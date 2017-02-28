Pod::Spec.new do |s|
    s.name         = 'BAButton'
    s.version      = '2.1.0'
s.summary      = '自定义 button 类！2.1.1、继承自 UIButton 可以像 UIButton 一样随便添加系统属性 2.1.2、可以单独设置文字和图片的位置 2.1.3、还可以设置文字或者图片间距 2.1.4、可以设置按钮的任意一个角的圆角度数 2.1.4、全面适配纯代码、xib、storyboard'
    s.homepage     = 'https://github.com/boai/BAButton'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BAButton.git', :tag => s.version.to_s }
    s.source_files = 'BAButton/**/*.{h,m}'
    s.requires_arc = true
end