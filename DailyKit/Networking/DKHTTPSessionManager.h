//
//  DKHTTPSessionManager.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

/**
 required:
 创建本类的 category
 
 optional:
 重写 baseURL 的 getter 方法可以设置 baseURL
 重写 parameters 的 getter 方法可以封装公共网络参数
 重写 errorHandler 的 getter 方法可以统一处理网络错误
 */

#import <AFNetworking/AFNetworking.h>

// 网络方法枚举
typedef NS_ENUM(NSInteger, DKRequestMethod) {
    GET,
    POST,
};

/**
 完成回调

 @param result 结果集
 @param error NSError
 */
typedef void (^DKCompletion)(id result, NSError * error);

/**
 网络错误处理

 @param error NSError
 */
typedef void(^DKErrorHandler)(NSError * error);

@interface DKHTTPSessionManager : AFHTTPSessionManager

/**
 获取单例对象

 @return 返回本类的单例对象
 */
+ (instancetype)manager;

/**
 GET、POST请求

 @param method GET、POST
 @param URLString URLString
 @param parameters 网络参数
 @param completion 完成回调
 */
+ (void)request:(DKRequestMethod)method URLString:(NSString *)URLString parameters:(id)parameters completion:(DKCompletion)completion;

@end
