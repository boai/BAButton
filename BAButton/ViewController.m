//
//  ViewController.m
//  BAButton
//
//  Created by boai on 2017/5/19.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "BAButton.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BAButton";
    
//    [self test];
    [self setupNavi];
    // 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
    [self test2];
}

- (void)test2
{
    self.button.hidden = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    
    min_x = 100;
    min_y = 100;
    min_w = BAKit_SCREEN_WIDTH - min_x * 2;
    min_h = min_w;
    self.button.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    // 根据宽比例去缩放图片，注意：如果button 的图片 太宽，需要调用此方法去等比压缩图片，压缩完的图片，记得要在frame 之后设置图片
    UIImage *stretchableButtonImage = [[UIImage imageNamed:@"条形码.jpg"] ba_imageScaleToWidth:_button.frame.size.width];
    [_button setImage:stretchableButtonImage forState:UIControlStateNormal];
    
    // button 图文布局也要在图片设置之后设置才能有效
    _button.ba_buttonLayoutType = BAKit_ButtonLayoutTypeCenterImageTop;
}

#pragma mark - 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
- (UIButton *)button
{
    if (!_button)
    {
        // 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"123456" forState:UIControlStateNormal];
        [_button setTitleColor:BAKit_Color_Red_pod forState:UIControlStateNormal];
        _button.backgroundColor = BAKit_Color_Gray_10_pod;
        
        [self.view addSubview:_button];
    }
    return _button;
}

- (void)setupNavi
{
    CGRect frame = CGRectMake(0, 0, 80, 40);
    UIButton *navi_rightButton = [UIButton ba_creatButtonWithFrame:frame title:@"xib" selTitle:nil titleColor:BAKit_Color_Red_pod titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAKit_ButtonLayoutTypeCenterImageRight viewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleRightNaviButtonAction)];
    navi_rightButton.backgroundColor = BAKit_Color_RandomRGB_pod();
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_rightButton];
    
    UIButton *navi_leftButton = [UIButton ba_creatButtonWithFrame:frame title:@"state" selTitle:nil titleColor:BAKit_Color_Red_pod titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAKit_ButtonLayoutTypeCenterImageRight viewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleLeftNaviButtonAction)];
    [navi_rightButton ba_view_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:20 borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
    navi_rightButton.backgroundColor = BAKit_Color_RandomRGBA_pod();
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_leftButton];
}

- (void)handleLeftNaviButtonAction
{
    [self.navigationController pushViewController:[ViewController3 new] animated:YES];
}

- (void)handleRightNaviButtonAction
{
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
}

- (void)test
{
    CGFloat min_x = 20;
    CGFloat min_y = 80;
    CGFloat min_w = CGRectGetWidth(self.view.frame) - min_x * 2;
    //    CGFloat min_w = 200;
    
    CGFloat min_h = 0;
    CGFloat min_space = 5;
    
    for (NSInteger i = 0; i < 8; i ++)
    {
        min_h = 30;
        if (i == 2 || i == 3)
        {
            min_h = 80;
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(min_x, min_y, min_w, min_h);
        button.backgroundColor = BAKit_Color_RandomRGBA_pod();
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
        min_y = CGRectGetMaxY(button.frame) + min_space;
        
        CGFloat padding = 10;
        CGFloat viewCornerRadius = 15;
        BAKit_ButtonLayoutType type;
        
        switch (i) {
            case 0:
            {
                [button setTitle:@"默认样式：内容居中-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeNormal;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
            }
                break;
            case 1:
            {
                [button setTitle:@"内容居中-图右文左" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeCenterImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
            }
                break;
            case 2:
            {
                [button setTitle:@"内容居中-图上文下" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeCenterImageTop;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2 borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
            }
                break;
            case 3:
            {
                [button setTitle:@"内容居中-图下文上" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeCenterImageBottom;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2];
            }
                break;
            case 4:
            {
                [button setTitle:@"内容居左-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeLeftImageLeft;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
                button.ba_padding_inset = 20;
            }
                break;
            case 5:
            {
                [button setTitle:@"内容居左-图右文左" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeLeftImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 6:
            {
                [button setTitle:@"内容居右-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeRightImageLeft;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 7:
            {
                [button setTitle:@"内容居右-图右文左" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeRightImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
            }
                break;
                
            default:
                type = BAKit_ButtonLayoutTypeNormal;
                break;
        }
        
        // 注意：文字、字体大小、图片等设置一定要在设置 ba_button_setBAButtonLayoutType 之前设置，要不然计算会以默认字体大小计算，导致位置偏移
        [button ba_button_setButtonLayoutType:type padding:padding];
        
        [self.view addSubview:button];
    }
}

@end
