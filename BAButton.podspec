Pod::Spec.new do |s|
    s.name         = 'BAButton'
    s.version      = '2.2.0'
    s.summary      = '自定义 button 类！2.2.1、修复 buttonCornerRadii 只能在添加frame 后设置才能有效的问题，现在可以随意设置<br> 2.2.2、新增设置文字或和图片间距，举个🌰：self.padding = 10;'
    s.homepage     = 'https://github.com/boai/BAButton'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BAButton.git', :tag => s.version.to_s }
    s.source_files = 'BAButton/**/*.{h,m}'
    s.requires_arc = true
end