Pod::Spec.new do |s|
  s.name         = "DailyKit"
  s.version      = "0.0.31"
  s.summary      = "iOS dev daily kit."
  s.homepage     = "https://github.com/iospp/DailyKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "pp" => "iospp@foxmail.com" }
  s.source       = { :git => "https://github.com/iospp/DailyKit.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = 'DailyKit/**/*'
  s.public_header_files = 'DailyKit/*.{h}'
  s.ios.deployment_target = '9.0'
  s.framework  = "Foundation", 'UIKit', 'CoreGraphics', 'CoreFoundation', 'WebKit'
  s.dependency   "AFNetworking"
  s.dependency   "FMDB"
  s.dependency   "SVProgressHUD"
end
