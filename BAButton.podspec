Pod::Spec.new do |s|
    s.name         = 'BAButton'
    s.version      = '2.2.1'
s.summary      = '自定义 button 类！更新内容：2.2.1.1、button 的 角半径 buttonCornerRadii，默认 CGSizeMake(0, 0)'
    s.homepage     = 'https://github.com/boai/BAButton'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BAButton.git', :tag => s.version.to_s }
    s.source_files = 'BAButton/**/*.{h,m}'
    s.requires_arc = true
end
