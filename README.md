# BAButton
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/cocoapods/v/BAButton.svg?style=flat) ![](https://img.shields.io/cocoapods/dt/BAButton.svg
)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、UIButton 图片、文字自定义布局 <br>
* 2、UIButton 自定义切圆角，可以设置任意一个角的角半径
* 3、用 UIButton 的分类处理，处理更简单，一行代码轻松搞定所有 UIButton 自定义

## 2、示例展示
![BAButton1](https://github.com/BAHome/BAButton/blob/master/images/BAButton1.png)
![BAButton2](https://github.com/BAHome/BAButton/blob/master/images/BAButton2.png)

## 3、安装、导入示例和源码地址
* 1、pod 导入【最新版本：version 2.3.0】： <br>
 `pod 'BAButton'` <br>
如果发现 `pod search BAButton` 搜索出来的不是最新版本，需要在终端执行 cd 转换文件路径命令退回到 desktop，然后执行 `pod setup` 命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了。<br>
具体步骤：
  - pod setup : 初始化
  - pod repo update : 更新仓库
  - pod search BAButton
* 2、文件夹拖入：下载demo，把 BAButton 文件夹拖入项目即可，<br>
* 3、导入头文件：<br>
`  #import "BAButton.h" `<br>
* 4、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BAButton](https://github.com/BAHome/BAButton)<br>

## 4、代码示例
``` 
/**
 button 的样式，以图片为基准

 - BAButtonLayoutTypeNormal: button 默认样式：内容居中-图左文右
 - BAButtonLayoutTypeCenterImageRight: 内容居中-图右文左
 - BAButtonLayoutTypeCenterImageTop: 内容居中-图上文下
 - BAButtonLayoutTypeCenterImageBottom: 内容居中-图下文上
 - BAButtonLayoutTypeLeftImageLeft: 内容居左-图左文右
 - BAButtonLayoutTypeLeftImageRight: 内容居左-图右文左
 - BAButtonLayoutTypeRightImageLeft: 内容居右-图左文右
 - BAButtonLayoutTypeRightImageRight: 内容居右-图右文左
 */
typedef NS_ENUM(NSInteger, BAButtonLayoutType) {
    BAButtonLayoutTypeNormal = 0,
    BAButtonLayoutTypeCenterImageRight,
    BAButtonLayoutTypeCenterImageTop,
    BAButtonLayoutTypeCenterImageBottom,
    BAButtonLayoutTypeLeftImageLeft,
    BAButtonLayoutTypeLeftImageRight,
    BAButtonLayoutTypeRightImageLeft,
    BAButtonLayoutTypeRightImageRight,
};

/*!
 *  设置 viewRectCornerType 样式，
 *  注意：BAViewRectCornerType 必须要先设置 viewCornerRadius，才能有效，否则设置无效，
 */
typedef NS_ENUM(NSInteger, BAViewRectCornerType) {
    /*!
     *  设置下左角 圆角半径
     */
    BAViewRectCornerTypeBottomLeft = 0,
    /*!
     *  设置下右角 圆角半径
     */
    BAViewRectCornerTypeBottomRight,
    /*!
     *  设置上左角 圆角半径
     */
    BAViewRectCornerTypeTopLeft,
    /*!
     *  设置下右角 圆角半径
     */
    BAViewRectCornerTypeTopRight,
    /*!
     *  设置下左、下右角 圆角半径
     */
    BAViewRectCornerTypeBottomLeftAndBottomRight,
    /*!
     *  设置上左、上右角 圆角半径
     */
    BAViewRectCornerTypeTopLeftAndTopRight,
    /*!
     *  设置下左、上左角 圆角半径
     */
    BAViewRectCornerTypeBottomLeftAndTopLeft,
    /*!
     *  设置下右、上右角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRight,
    /*!
     *  设置上左、上右、下右角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRightAndTopLeft,
    /*!
     *  设置下右、上右、下左角 圆角半径
     */
    BAViewRectCornerTypeBottomRightAndTopRightAndBottomLeft,
    /*!
     *  设置全部四个角 圆角半径
     */
    BAViewRectCornerTypeAllCorners
};


// 大家下载demo后可能出现图片不显示，只需更换图片即可，注意button的frame哦！
// 此外，此button的titleLAbel只支持一行显示，不支持多行！敬请注意！

// 示例1：
    [self.normalButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeNormal padding:padding];
    [self.normalButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeft viewCornerRadius:viewCornerRadius];
    

// 示例2：
    CGRect frame = CGRectMake(0, 0, 80, 40);
    UIButton *navi_rightButton = [[UIButton alloc] creatButtonWithFrame:frame title:@"xib" selTitle:nil titleColor:nil titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAButtonLayoutTypeCenterImageRight viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleRightNaviButtonAction)];
    navi_rightButton.backgroundColor = BAKit_ColorRandom();
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_rightButton];

其他示例可下载demo查看源码！
```

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！
 如有更多需求，请前往：[【https://github.com/BAHome】](https://github.com/BAHome) 
 
 最新更新时间：2017-05-20 【倒叙】
 最新Version：【Version：2.3.0】<br>
 更新内容：<br>
 2.3.0.1、用分类全新重构 BAButton，代码配置更灵活<br>
 2.3.0.2、可以自由设置 button 的文字和图片的布局、间距、每个角的切圆角<br>
 2.3.0.3、全面适配 纯代码、xib、storyboard<br>
 2.3.0.4、版本改动较大，希望大家谅解，如果用老版本的 BAButton，可以参考demo 更换新版本，后期改动不大<br>

* 2017-04-24 <br>
最新Version：【Version：2.2.1】<br>
更新内容：<br>
2.2.1.1、新增快速创建button 的demo，和 自定义 naviButton demo

* 2017-03-15 <br>
 最新Version：【Version：2.2.1】<br>
 更新内容：<br>
 2.2.1.1、button 的 角半径 buttonCornerRadii，默认 CGSizeMake(0, 0)

* 2017-03-02 <br>
 最新Version：【Version：2.2.0】<br>
 更新内容：<br>
 2.2.0.1、修复 buttonCornerRadii 只能在添加frame 后设置才能有效的问题，现在可以随意设置<br>
 2.2.0.2、新增设置文字或和图片间距，举个🌰：self.padding = 10;

* 2017-02-28 【倒叙】<br>
 最新Version：【Version：2.1.0】<br>
 更新内容：<br>
 2.1.1、继承自 UIButton 可以像 UIButton 一样随便添加系统属性<br>
 2.1.2、可以单独设置文字和图片的位置<br>
 2.1.3、还可以设置文字或者图片间距<br>
 2.1.4、可以设置按钮的任意一个角的圆角度数<br>
 2.1.4、全面适配纯代码、xib、storyboard
* 2016.03.04 <br>
pod 最新上架，修复部分已知bug，代码更精简！

## 6、bug 反馈 和 联系方式
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认证对待每一个问题！ <br>

> 2、联系方式 <br> 
QQ群：479663605  【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 
博爱QQ：137361770 <br> 
博爱微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br> 

## 7、开发环境 和 支持版本
> 开发使用 Xcode Version 8.3.2 (8E2002) 最新版，理论上支持所有 iOS 版本，如有版本适配问题，请及时反馈！多谢合作！

## 8、感谢
> 感谢 BAHome 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> BAHome 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

