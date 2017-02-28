
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 最新更新时间：2016-11-24 【倒叙】
 最新Version：【Version：2.0.1】
 更新内容：
 2.0.1、优化方法名命名规范
 2.0.2、删除多余代码，简化方法名和属性名，详见 demo
 2.0.3、新增旧方法更新提示
 2.0.4、优化各种注释
 
 */

#import <UIKit/UIKit.h>

/*! 过期属性或方法名提醒 */
#define BANetManagerDeprecated(instead) __deprecated_msg(instead)


/*!
 *  设置 buttonPosition 样式
 *  注意：【xib 、storyboard、纯代码均适配】xib 、storyboard 只需在 - (void)awakeFromNib{} 内部设置 buttonPositionStyle 即可，其他代码均可通过 xib、storyboard  设置，
 例如：
 - (void)awakeFromNib
 {
    button.buttonPositionStyle = BAButtonPositionStyleLeft;
 }
 */
typedef NS_ENUM(NSUInteger, BAButtonPositionStyle) {
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
 */
typedef NS_ENUM(NSUInteger, BAButtonRectCornerStyle) {
    BAButtonRectCornerStyleBottomLeft = 0,
    BAButtonRectCornerStyleBottomRight,
    BAButtonRectCornerStyleTopLeft,
    BAButtonRectCornerStyleTopRight,
    BAButtonRectCornerStyleBottomLeftAndBottomRight,
    BAButtonRectCornerStyleTopLeftAndTopRight,
    BAButtonRectCornerStyleBottomLeftAndTopLeft,
    BAButtonRectCornerStyleBottomRightAndTopRight,
    BAButtonRectCornerStyleBottomRightAndTopRightAndTopLeft,
    BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft,
    BAButtonRectCornerStyleAllCorners
};

@interface BAButton : UIButton


/*!
 *  设置 buttonPosition 样式
 */
@property (nonatomic, assign) BAButtonPositionStyle buttonPositionStyle;

/*!
 *  设置 buttonRectCorner 样式，必须同时设置 buttonCornerRadii
 */
@property (nonatomic, assign) BAButtonRectCornerStyle buttonRectCornerStyle;

/*!
 *  button 的 角半径，默认 CGSizeMake(20, 20)
 */
@property (nonatomic, assign) CGSize buttonCornerRadii;

/*!
 *  设置 button 圆角
 */
@property (nonatomic, assign) CGFloat buttonCornerRadius;



#pragma mark - 过期方法
@property (nonatomic, assign) BAButtonPositionStyle buttonStatus BANetManagerDeprecated("方法已过期，请使用最新属性名：buttonPositionStyle");
+ (instancetype _Nonnull)BA_ShareButton BANetManagerDeprecated("方法已过期，请使用最新方法名：BAButton *btn1 = [[BAButton alloc] init]");
- (instancetype _Nonnull)initWitButtonStatus:(BAButtonPositionStyle)status BANetManagerDeprecated("方法已过期，请使用最新方法名：BAButton *btn1 = [[BAButton alloc] init]");

@end

