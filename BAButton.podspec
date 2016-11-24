Pod::Spec.new do |s|
  s.name         = "BAButton"
  s.version      = "2.0"
s.summary      = '更新内容：\n2.0.1、优化方法名命名规范\n2.0.2、删除多余代码，简化方法名和属性名，详见 demo\n2.0.3、新增旧方法更新提示\n2.0.4、优化各种注释'
  s.homepage     = "https://github.com/boai/BAButton.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "boai" => "sunboyan@outlook.com" }
  s.social_media_url   = "http://weibo.com/538298123?refer_flag=1001030101_&is_all=1"
  s.homepage     = 'https://github.com/boai/BAButton.git'
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/boai/BAButton.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'BAButton/**/*.{h,m}'
  s.public_header_files = 'BAButton/**/*.{h}'

end
