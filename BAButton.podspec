
Pod::Spec.new do |s|
    s.name         = 'BAButton'
    s.version      = '2.0.0'
    s.summary      = '更新内容：2.0.1、优化方法名命名规范 2.0.2、删除多余代码，简化方法名和属性名，详见demo 2.0.3、新增旧方法更新提示'
    s.homepage     = 'https://github.com/boai/BAButton'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BAButton', :tag => s.version.to_s }
    s.source_files = 'BAButton/**/*.{h,m}'
    s.requires_arc = true
end
