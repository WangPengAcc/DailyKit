Pod::Spec.new do |s|
  s.name         = "DailyKit"
  s.version      = "0.0.51"
  s.summary      = "iOS dev daily kit."
  s.homepage     = "https://github.com/grasource-wangpeng/DailyKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "grasource-wangpeng" => "wangpeng_acc@163.com" }
  s.source       = { :git => "https://github.com/grasource-wangpeng/DailyKit.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = 'DailyKit/**/*'
  s.public_header_files = 'DailyKit/**/*.{h}'
  s.ios.deployment_target = '9.0'
  s.framework  = "Foundation", 'UIKit', 'CoreGraphics', 'CoreFoundation', 'WebKit', 'Photos'
  s.dependency   "AFNetworking"
  s.dependency   "FMDB"
  s.dependency   "SVProgressHUD"
end
