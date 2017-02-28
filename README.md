# BAButton
自定义button

>**开发中如有问题，可以联系本人**

**新浪微博：@博爱1616**

**QQ：     137361770**

#### 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，

###### http://www.cnblogs.com/boai/p/4977976.html

# 更新记录：

 ## 2017-02-28 【倒叙】<br>
 最新Version：【Version：2.1.0】<br>
 更新内容：<br>
 2.1.1、继承自 UIButton 可以像 UIButton 一样随便添加系统属性<br>
 2.1.2、可以单独设置文字和图片的位置<br>
 2.1.3、还可以设置文字或者图片间距<br>
 2.1.4、可以设置按钮的任意一个角的圆角度数<br>
 2.1.4、全面适配纯代码、xib、storyboard
## 2016.12.4 - 
pod 最新上架，修复部分已知bug，代码更精简！

###示例展示：

![image](https://raw.githubusercontent.com/boai/BAButton/master/BAButtonDemo/images/image1.png)
![image](https://raw.githubusercontent.com/boai/BAButton/master/BAButtonDemo/images/image2.png)


>##完全实现button的自定义，

###pod 导入：   pod 'BAButton', '~> 2.1.0'
如果发现pod search BAButton 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了
具体步骤：
- pod setup : 初始化
- pod repo update : 更新仓库
- pod search BAButton


###项目中导入头文件：
```
#import <BAButton.h> 即可
```

``` 用枚举展示button的类型：
/*!
 *  设置 buttonPosition 样式
 *  注意：【xib 、storyboard、纯代码均适配】xib 、storyboard 只需在 - (void)awakeFromNib{} 内部设置 buttonPositionStyle 即可，其他代码均可通过 xib、storyboard 设置，
 例如：
 - (void)awakeFromNib
 {
    button.buttonPositionStyle = BAButtonPositionStyleLeft;
 }
 */
typedef NS_ENUM(NSInteger, BAButtonPositionStyle) {
    /*!
     *  系统默认
     */
    BAButtonPositionStyleNormal = 0,
    /*!
     *  左对齐
     */
    BAButtonPositionStyleLeft,
    /*!
     *  居中对齐
     */
    BAButtonPositionStyleCenter,
    /*!
     *  右对齐
     */
    BAButtonPositionStyleRight,
    /*!
     *  图标在上，文本在下(居中)
     */
    BAButtonPositionStyleTop,
    /*!
     *  图标在下，文本在上(居中)
     */
    BAButtonPositionStyleBottom
};

/*!
 *  设置 buttonRectCorner 样式，，默认为：BAButtonRectCornerStyleAllCorners 
 *  注意：buttonRectCornerStyle 必须要在设置 frame 之后才能有效，否则 button 不显示
 */
typedef NS_ENUM(NSInteger, BAButtonRectCornerStyle) {
    /*!
     *  设置下左角 圆角半径
     */
    BAButtonRectCornerStyleBottomLeft = 0,
    /*!
     *  设置下右角 圆角半径
     */
    BAButtonRectCornerStyleBottomRight,
    /*!
     *  设置上左角 圆角半径
     */
    BAButtonRectCornerStyleTopLeft,
    /*!
     *  设置下右角 圆角半径
     */
    BAButtonRectCornerStyleTopRight,
    /*!
     *  设置下左、下右角 圆角半径
     */
    BAButtonRectCornerStyleBottomLeftAndBottomRight,
    /*!
     *  设置上左、上右角 圆角半径
     */
    BAButtonRectCornerStyleTopLeftAndTopRight,
    /*!
     *  设置下左、上左角 圆角半径
     */
    BAButtonRectCornerStyleBottomLeftAndTopLeft,
    /*!
     *  设置下右、上右角 圆角半径
     */
    BAButtonRectCornerStyleBottomRightAndTopRight,
    /*!
     *  设置上左、上右、下右角 圆角半径
     */
    BAButtonRectCornerStyleBottomRightAndTopRightAndTopLeft,
    /*!
     *  设置下右、上右、下左角 圆角半径
     */
    BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft,
    /*!
     *  设置全部四个角 圆角半径
     */
    BAButtonRectCornerStyleAllCorners
};


// 大家下载demo后可能出现图片不显示，只需更换图片即可，注意button的frame哦！
// 此外，此button的titleLAbel只支持一行显示，不支持多行！敬请注意！

// 示例1：
    BAButton *btn = [[BAButton alloc] init];
    btn.backgroundColor = BAKit_ColorRandom();
    [btn setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn setTitle:@"系统默认样式" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn.buttonPositionStyle = BAButtonPositionStyleNormal;
//    btn.buttonCornerRadius = 5.0;
    btn.frame = CGRectMake(50, 70, 200, 50);
    /*! 文字和图片的间距用这两行代码更改就行了 */
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, btn.titleLabel.frame.size.width+5);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    /*! 注意：buttonRectCornerStyle 必须要在设置 frame 之后才能有效，否则 button 不显示 */
    [self.view addSubview:btn];
    btn.buttonRectCornerStyle = BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft;

// 示例2：
BAButton *btn1 = [[BAButton alloc] init];
    [btn1 setBackgroundColor:BAKit_ColorRandom()];
    [btn1 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn1 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.buttonPositionStyle = BAButtonPositionStyleLeft;
    btn1.buttonCornerRadius = 5.0;
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    btn1.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame) + 10, 200, 50);
    [self.view addSubview:btn1];
    btn1.buttonRectCornerStyle = 2;
    btn1.buttonCornerRadii = CGSizeMake(50, 50);

其他示例可下载demo查看源码！
