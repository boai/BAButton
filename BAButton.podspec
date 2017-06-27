Pod::Spec.new do |s|
    s.name         = 'BAButton'
    s.version      = '2.5.4'
    s.summary      = '自定义 button 类！用分类全新重构 BAButton，代码配置更灵活！可以自由设置 button 的文字和图片的布局、间距、每个角的切圆角！'
    s.homepage     = 'https://github.com/BAHome/BAButton'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '8.0'
    s.source       = { :git => 'https://github.com/BAHome/BAButton.git', :tag => s.version.to_s }
    s.source_files = 'BAButton/BAButton/*.{h,m}'
    s.requires_arc = true
end
