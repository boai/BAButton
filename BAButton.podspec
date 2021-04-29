#
# Be sure to run `pod lib lint BAButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BAButton'
  s.version          = '2.6.10'
  s.summary      = '自定义 button 类！用分类全新重构 BAButton，代码配置更灵活！可以自由设置 button 的文字和图片的布局、间距、每个角的切圆角！'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  修复 BAKit_ButtonLayoutTypeRightImageRight 样式下文字显示不全问题，ba_padding_inset 默认改为0
                       DESC

  s.homepage         = 'https://github.com/BAHome/BAButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'https://github.com/996icu/996.ICU/blob/master/LICENSE', :file => 'LICENSE' }
  s.author           = { 'boai' => 'sunboyan@outlook.com' }
  s.source           = { :git => 'https://github.com/BAHome/BAButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files  = "BAButton/**/*.{h,m}"

  # s.resource_bundles = {
  #   'BAButton' => ['BAButton/Assets/*.png']
  # }

   s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
   s.requires_arc = true

  # s.dependency 'AFNetworking', '~> 2.3'
end
