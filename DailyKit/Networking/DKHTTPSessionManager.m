//
//  DKHTTPSessionManager.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "DKHTTPSessionManager.h"
#import <objc/runtime.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>


#pragma mark - AFHTTPSessionManager (DailyKit)
@interface AFHTTPSessionManager (DailyKit)

/**
 给 AFHTTPSessionManager 添加 parameters 属性
 为了在 DKHTTPSessionManager 的 category 中重写 parameters 的 getter 方法时不报警告
 */
@property (strong, nonatomic) NSMutableDictionary *parameters;



/**
 给 AFHTTPSessionManager 添加 activityIndicatorViewSetter 属性
 在 DKHTTPSessionManager 的 category 中重写 activityIndicatorViewSetter 的 getter 方法设置菊花
 例如：
 - (DKActivityIndicatorViewSetter)activityIndicatorViewSetter
 {
    return ^{
        [SVProgressHUD show];
    };
 }
 */
@property (copy, nonatomic)DKActivityIndicatorViewSetter activityIndicatorViewSetter;



/**
 给 AFHTTPSessionManager 添加 activityIndicatorViewCleaner 属性
 在 DKHTTPSessionManager 的 category 中重写 activityIndicatorViewCleaner 的 getter 方法移除菊花
 例如：
 - (DKActivityIndicatorViewCleaner)activityIndicatorViewCleaner
 {
    return ^{
        [SVProgressHUD dismiss];
    };
 }
 */
@property (copy, nonatomic)DKActivityIndicatorViewCleaner activityIndicatorViewCleaner;



/**
 给 AFHTTPSessionManager 添加 errorHandler 属性
 在 DKHTTPSessionManager 的 category 中重写 errorHandler 的 getter 方法以对网络错误统一处理
 例如：
 - (DKErrorHandler)errorHandler
 {
    return ^(NSError *error){
        NSString *msg = [NSString stringWithFormat:@"%@", error.userInfo[@"NSLocalizedDescription"]];
        [SVProgressHUD dk_onlyText:msg delay:10];
    };
 }
 */
@property (copy, nonatomic)DKErrorHandler errorHandler;

@end

@implementation AFHTTPSessionManager (DailyKit)

static char parametersKey;

- (NSMutableDictionary *)parameters
{
    return objc_getAssociatedObject(self, &parametersKey);
}

- (void)setParameters:(NSMutableDictionary *)parameters
{
    objc_setAssociatedObject(self, &parametersKey, parameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



static char activityIndicatorViewSetterKey;

- (DKActivityIndicatorViewSetter)activityIndicatorViewSetter
{
    return objc_getAssociatedObject(self, &activityIndicatorViewSetterKey);
}

- (void)setActivityIndicatorViewSetter:(DKActivityIndicatorViewSetter)activityIndicatorViewSetter
{
    objc_setAssociatedObject(self, &activityIndicatorViewSetterKey, activityIndicatorViewSetter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



static char activityIndicatorViewCleanerKey;

- (DKActivityIndicatorViewCleaner)activityIndicatorViewCleaner
{
    return objc_getAssociatedObject(self, &activityIndicatorViewCleanerKey);
}

- (void)setActivityIndicatorViewCleaner:(DKActivityIndicatorViewCleaner)activityIndicatorViewCleaner
{
    objc_setAssociatedObject(self, &activityIndicatorViewCleanerKey, activityIndicatorViewCleaner, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



static char errorHandlerKey;

- (DKErrorHandler)errorHandler
{
    return objc_getAssociatedObject(self, &errorHandlerKey);
}

- (void)setErrorHandler:(DKErrorHandler)errorHandler
{
    objc_setAssociatedObject(self, &errorHandlerKey, errorHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


#pragma mark - DKNetworkProtocol
@protocol DKHTTPSessionManagerProtocol <NSObject>

@optional

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end


#pragma mark - DKHTTPSessionManager
@interface DKHTTPSessionManager() <DKHTTPSessionManagerProtocol>

@end

@implementation DKHTTPSessionManager

static DKHTTPSessionManager *manager = nil;

// ARC
+ (instancetype)manager
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        manager = [[self alloc] init];
        
        manager.parameters = nil;
        
        [manager.requestSerializer setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
        
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 8.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                             @"application/json",
                                                             @"text/json",
                                                             @"text/javascript",
                                                             @"text/html",
                                                             @"text/plain",
                                                             @"application/octet-stream",
                                                             @"image/jpeg",
                                                             @"image/png",
                                                             nil];
        
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
    });
    
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        manager = [super allocWithZone:zone];
    });
    
    return manager;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return manager;
}

// MRC
#if __has_feature(objc_arc)

#else
- (instancetype)retain
{
    return manager;
}

- (NSUInteger)retainCount
{
    return 1;
}

- (oneway void)release
{
    // do nothing
}

- (instancetype)autorelease
{
    return manager;
}
#endif


#pragma mark - 封装 AFN 的 GET 和 POST
+ (void)request:(DKRequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters completion:(DKCompletion)completion
{
    DKHTTPSessionManager *manager = [DKHTTPSessionManager manager];
    
    NSString *methodName = (method == GET) ? @"GET" : @"POST";
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:manager.parameters];
    [dict addEntriesFromDictionary:parameters];
    
    if (manager.activityIndicatorViewSetter) {
        manager.activityIndicatorViewSetter();
    }
    
    [[manager dataTaskWithHTTPMethod:methodName
                           URLString:URLString
                          parameters:dict
                      uploadProgress:nil
                    downloadProgress:nil
                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                 
                                 completion(responseObject, nil);
                                 
                                 if (manager.activityIndicatorViewCleaner) {
                                     manager.activityIndicatorViewCleaner();
                                 }
                                 
                             }
      
                             failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 
                                 completion(nil, error);
                                 
                                 if (manager.activityIndicatorViewCleaner) {
                                     manager.activityIndicatorViewCleaner();
                                 }
                                 
                                 if (error && manager.errorHandler) {
                                     manager.errorHandler(error);
                                 }
                                 
                             }] resume];
    
}

@end
