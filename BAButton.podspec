Pod::Spec.new do |s|
  s.name         = "BAButton"
  s.version      = "1.0.0"
  s.summary      = 'A collection of iOS components.'
  s.description  = <<-DESC
                   可以完全自定义button！
                   DESC
  s.homepage     = "https://github.com/boai/BAButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "boai" => "sunboyan@outlook.com" }
  s.social_media_url   = "http://weibo.com/538298123?refer_flag=1001030101_&is_all=1"
  s.homepage     = 'https://github.com/boai/BAButton'
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/boai/BAButton", :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = "BAButton/**/*.{h,m}"
  s.public_header_files = "BAButton/**/*.h"

end
