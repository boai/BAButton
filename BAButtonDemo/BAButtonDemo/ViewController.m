//
//  ViewController.m
//  BAButtonDemo
//
//  Created by 博爱之家 on 16/4/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "BAButton.h"

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define button_margin 10
#define button_w      (SCREEN_WIDTH - button_margin * 3) / 2

/*! 随机色 */
CG_INLINE UIColor *
BAKit_ColorRandom(){
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

#pragma mark - 根据文字内容和大小返回 size
CG_INLINE CGSize
BAKit_LabelSizeWithTextAndFont(NSString *text, UIFont *font){
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    CGSize newSize = CGSizeMake(size.width, size.height);
    return newSize;
}

@interface ViewController ()

@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BAButton";
    self.descLabel.hidden = NO;
    
    /*! for 循环创建 【xib 、storyboard、纯代码均适配】 */
    [self buttonTestNewDemo];
    
    /*! 单独创建 【xib 、storyboard、纯代码均适配】 */
//    [self buttonTestOldDemo];

}



#pragma mark - for 循环创建 【xib 、storyboard、纯代码均适配】
- (void)buttonTestNewDemo
{
//    CGFloat button_x = 0;
    CGFloat button_y = 64 + button_margin;
    CGFloat button_h = 0;
    NSString *button_title = @"";
    
    NSInteger buttonNumber = 6;
    for (NSInteger i = 0; i < buttonNumber; i++)
    {
        BAButton *button = [[BAButton alloc] init];
        button.backgroundColor = BAKit_ColorRandom();
        [button setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        
        NSInteger rowNum = 0;
        if (buttonNumber < 2)
        {
            rowNum = i;
        }
        else
        {
            rowNum = 2;
        }
        
        long columnIndex = i % 2;
        long rowIndex = i / rowNum;
        
        switch (i) {
            case 0:
            {
                button_h = 50;
                button_title = @"系统默认";
                button.padding = 20;
                button.buttonPositionStyle = BAButtonPositionStyleNormal;
                [button setButtonCornerRadii:CGSizeMake(20, 20) buttonRectCornerStyle:BAButtonRectCornerStyleTopRight];
            }
                break;
            case 1:
            {
                button_h = 50;
                button_title = @"左对齐[字左图右]";
                button.padding = 5;
                button.buttonPositionStyle = BAButtonPositionStyleLeft;
                [button setButtonCornerRadii:CGSizeMake(10, 10) buttonRectCornerStyle:BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft];
            }
                break;
            case 2:
            {
                button_h = 50;
                button_title = @"中心对齐[字左图右]";
                button.padding = 5;
                button.buttonPositionStyle = BAButtonPositionStyleCenter;
                [button setButtonCornerRadii:CGSizeMake(20, 20) buttonRectCornerStyle:BAButtonRectCornerStyleTopRight];
            }
                break;
            case 3:
            {
                button_h = 50;
                button_title = @"右对齐[字左图右]";
                button.padding = 5;
                button.buttonPositionStyle = BAButtonPositionStyleRight;
                [button setButtonCornerRadii:CGSizeMake(20, 20) buttonRectCornerStyle:BAButtonRectCornerStyleTopLeft];
            }
                break;
            case 4:
            {
                button_h = 50;
                button_title = @"字下图上";
                button.padding = 5;
                button.buttonPositionStyle = BAButtonPositionStyleTop;
                [button setButtonCornerRadii:CGSizeMake(20, 20) buttonRectCornerStyle:BAButtonRectCornerStyleTopRight];
            }
                break;
            case 5:
            {
                button_h = 80;
                button_title = @"字上图下";
                button.padding = 5;
                button.buttonPositionStyle = BAButtonPositionStyleBottom;
                /*! 直接设置四个圆角 */
                button.buttonCornerRadius = 80 / 2;
            }
                break;
                
            default:
                break;
        }
        button.frame = CGRectMake(button_margin + (button_w + button_margin) * columnIndex, button_y + (50 + button_margin) * rowIndex , button_w, button_h);
        [button setTitle:button_title forState:UIControlStateNormal];
        
        [self.view addSubview:button];
    }
}

#pragma mark - 单独创建 【xib 、storyboard、纯代码均适配】
- (void)buttonTestOldDemo
{
    BAButton *btn = [[BAButton alloc] init];
    btn.backgroundColor = BAKit_ColorRandom();
    [btn setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn setTitle:@"系统默认样式" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 70, 200, 50);
    /*! 文字和图片的间距用这两行代码更改就行了 */
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, btn.titleLabel.frame.size.width+5);
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    btn.buttonPositionStyle = BAButtonPositionStyleNormal;
    btn.padding = 10;
    /*!
     *  设置 buttonRectCorner 样式，
     *  注意：buttonRectCornerStyle 必须要先设置 buttonCornerRadii，才能有效，否则 button 不显示，
     *  举个🌰：
     btn.buttonCornerRadii = CGSizeMake(10, 10);
     btn.buttonRectCornerStyle = BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft;
     或者直接使用：
     [btn setButtonCornerRadii:CGSizeMake(10, 10) buttonRectCornerStyle:BAButtonRectCornerStyleTopLeft];
     */
//    [btn setButtonCornerRadii:CGSizeMake(10, 10) buttonRectCornerStyle:BAButtonRectCornerStyleBottomRightAndTopRightAndBottomLeft];
    [self.view addSubview:btn];

    
    UIFont *font = [UIFont systemFontOfSize:15];
    CGRect frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame) + 10, 200, 50);
    BAButton *btn1 = [[BAButton alloc] creatButtonWithFrame:frame title:@"左对齐[文字左图片右]" selTitle:nil titleColor:nil titleFont:font image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil buttonPositionStyle:BAButtonPositionStyleLeft target:self selector:@selector(handleButtonAction)];
    [btn1 setBackgroundColor:BAKit_ColorRandom()];
    btn1.padding = 10;
    [btn1 setButtonCornerRadii:CGSizeMake(50, 50) buttonRectCornerStyle:BAButtonRectCornerStyleTopRight];
    [self.view addSubview:btn1];

    BAButton *btn2 = [[BAButton alloc] init];
    btn2.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn1.frame) + 10, 300, 50);
    [btn2 setBackgroundColor:BAKit_ColorRandom()];
    [btn2 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn2 setTitle:@"中心对齐[文字左图片右]" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.buttonPositionStyle = BAButtonPositionStyleCenter;
    btn2.buttonCornerRadius = 8.0;
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btn2];

    BAButton *btn3 = [[BAButton alloc] init];
    [btn3 setBackgroundColor:BAKit_ColorRandom()];
    [btn3 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn3 setTitle:@"右对齐[文字左图片右]" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.buttonPositionStyle = BAButtonPositionStyleRight;
    [btn3 setButtonCornerRadii:CGSizeMake(20, 20) buttonRectCornerStyle:BAButtonRectCornerStyleTopRight];
    btn3.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn2.frame) + 10, 200, 50);
    [self.view addSubview:btn3];

    BAButton *btn4 = [[BAButton alloc] init];
    btn4.buttonPositionStyle = BAButtonPositionStyleLeft;
    [btn4 setBackgroundColor:BAKit_ColorRandom()];
    [btn4 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn4 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:10];
    btn4.buttonCornerRadius = 5.0;
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn3.frame) + 10, 200, 50);
    [self.view addSubview:btn4];

    BAButton *btn5 = [[BAButton alloc] init];
    btn5.buttonPositionStyle = BAButtonPositionStyleTop;
    [btn5 setBackgroundColor:BAKit_ColorRandom()];
    [btn5 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn5 setTitle:@"图片在上，文字在下" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:10];
    btn5.buttonCornerRadius = 5.0;
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn5.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn4.frame) + 10, 200, 80);
    [self.view addSubview:btn5];

    BAButton *btn6 = [[BAButton alloc] init];
    btn6.buttonPositionStyle = BAButtonPositionStyleBottom;
    [btn6 setBackgroundColor:BAKit_ColorRandom()];
    [btn6 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn6 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:10];
    btn6.buttonCornerRadius = 5.0;
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn6.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn5.frame) + 10, 150, 80);
    [self.view addSubview:btn6];

    BAButton *btn7 = [[BAButton alloc] init];
    btn7.buttonPositionStyle = BAButtonPositionStyleBottom;
    [btn7 setBackgroundColor:BAKit_ColorRandom()];
    [btn7 setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
    [btn7 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:13];
    btn7.buttonCornerRadius = 5.0;
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn7.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn6.frame) + 10, 150, 80);
    [self.view addSubview:btn7];
}

- (void)handleButtonAction
{
    
}

- (UILabel *)descLabel {
	if(_descLabel == nil) {
		_descLabel = [[UILabel alloc] init];
        self.descLabel.numberOfLines = 0;
        UIFont *font = [UIFont boldSystemFontOfSize:18];
        self.descLabel.font = font;
        NSString *desc = @"欢迎使用 BAButton ！\nBAButton特点如下：\n1、继承自 UIButton 可以像 UIButton 一样随便添加系统属性\n2、可以单独设置文字和图片的位置\n3、还可以设置文字或者图片间距\n4、可以设置按钮的任意一个角的圆角度数\n5、全面适配纯代码、xib、storyboard\n6、后期还有更加方便的封装，欢迎前来探讨新技术！";
        self.descLabel.text = desc;
        CGSize newSize = BAKit_LabelSizeWithTextAndFont(desc, font);
        self.descLabel.frame = CGRectMake(10, SCREEN_HEIGHT - newSize.height - 70, SCREEN_WIDTH - 20, newSize.height + 50);

        [self.view addSubview:self.descLabel];
	}
	return _descLabel;
}

@end
