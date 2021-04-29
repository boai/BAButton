//
//  BAViewController.m
//  BAButton
//
//  Created by boai on 11/15/2018.
//  Copyright (c) 2018 boai. All rights reserved.
//

#import "BAViewController.h"

#import "ViewController2.h"
#import "ViewController3.h"
#import "BAButton.h"

@interface BAViewController ()

//@property(nonatomic, strong) UIButton *button;

@end

@implementation BAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BAButton";
    
    [self initUI];
    [self initNavi];
}

- (void)initNavi {
    CGRect frame = CGRectMake(0, 0, 80, 40);
    UIButton *navi_rightButton = [UIButton ba_creatButtonWithFrame:frame title:@"xib" selTitle:nil titleColor:BAKit_Color_Red_pod titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAKit_ButtonLayoutTypeCenterImageRight viewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleRightNaviButtonAction:)];
    navi_rightButton.backgroundColor = BAKit_Color_RandomRGB_pod();
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_rightButton];
    
    UIButton *navi_leftButton = [UIButton ba_creatButtonWithFrame:frame title:@"state" selTitle:nil titleColor:BAKit_Color_Red_pod titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAKit_ButtonLayoutTypeCenterImageRight viewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleLeftNaviButtonAction:)];
    [navi_rightButton ba_view_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:20 borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
    navi_rightButton.backgroundColor = BAKit_Color_RandomRGBA_pod();
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_leftButton];
    
    // 点击事件 Block 返回！
    BAKit_WeakSelf
    navi_leftButton.ba_buttonActionBlock = ^(UIButton * _Nonnull button) {
        BAKit_StrongSelf
        // 添加按钮点击音效和震动效果
        //        [button ba_buttonPlaySoundEffectWithFileName:@"begin.mp3" isNeedShock:YES];
        [self.navigationController pushViewController:[ViewController3 new] animated:YES];
    };
    
    navi_rightButton.ba_buttonActionBlock = ^(UIButton * _Nonnull button) {
        BAKit_StrongSelf
        // 添加按钮点击音效和震动效果
        //        [button ba_buttonPlaySoundEffectWithFileName:@"failure.mp3" isNeedShock:YES];
        [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    };
}

- (void)handleLeftNaviButtonAction:(UIButton *)sender {
    //     添加按钮点击音效和震动效果
    //    [sender ba_viewPlaySoundEffectWithFileName:@"begin.mp3" isNeedShock:YES];
    //    [self.navigationController pushViewController:[ViewController3 new] animated:YES];
}

- (void)handleRightNaviButtonAction:(UIButton *)sender {
    //     添加按钮点击音效和震动效果
    //    [sender ba_buttonPlaySoundEffectWithFileName:@"failure.mp3" isNeedShock:YES];
    //    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
}

- (void)initUI {
    
    CGRect textFieldFrame = CGRectMake(50, kStatusBarAndNavigationBarHeight + 10, BAKit_SCREEN_WIDTH - 50 * 2, 50);
    
    if (kStatusBarHeight > 20) {
        UITextField *textField = UITextField.new;
        textField.backgroundColor = UIColor.greenColor;
        textField.placeholder = @"修复 iPhone X 等异形屏键盘异常";
        textField.frame = textFieldFrame;
        [self.view addSubview:textField];
    }
    
    CGFloat min_x = 40;
    CGFloat min_y = (kStatusBarHeight > 20) ? CGRectGetMaxY(textFieldFrame) + 10 : kStatusBarAndNavigationBarHeight + 10;
    CGFloat min_w = CGRectGetWidth(self.view.frame) - min_x * 2;
    //    CGFloat min_w = 200;
    
    CGFloat min_h = 0;
    CGFloat min_space = 5;
    
    for (NSInteger i = 0; i < 8; i ++) {
        min_h = 30;
        if (i == 2 || i == 3) {
            min_h = min_w * 0.5;
        }
        
        // 原生写法
        //        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //        button.frame = CGRectMake(min_x, min_y, min_w, min_h);
        //        button.backgroundColor = BAKit_Color_RandomRGBA_pod();
        //        button.titleLabel.font = [UIFont systemFontOfSize:13];
        //        [button setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
        
        // BAButton 简单写法
        UIButton *button = [UIButton ba_buttonWithFrame:CGRectMake(min_x, min_y, min_w, min_h)
                                                  title:nil
                                             titleColor:nil
                                              titleFont:[UIFont systemFontOfSize:13]
                                                  image:[UIImage imageNamed:@"tabbar_mainframeHL"]
                                        backgroundColor:BAKit_Color_RandomRGBA_pod()];
        
        min_y = CGRectGetMaxY(button.frame) + min_space;
        
        CGFloat padding = 10;
        CGFloat viewCornerRadius = 15;
        BAKit_ButtonLayoutType type;
        
        switch (i) {
            case 0: {
                [button setTitle:@"默认样式：内容居中-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeNormal;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
            } break;
            case 1: {
                [button setTitle:@"内容居中-图右文左" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeCenterImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
            } break;
            case 2: {
                [button setTitle:@"内容居中-图上文下" forState:UIControlStateNormal];
                // 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
                // 根据宽比例去缩放图片，注意：如果button 的图片 太宽，需要调用此方法去等比压缩图片，压缩完的图片，记得要在frame 之后设置图片
                UIImage *stretchableButtonImage = [[UIImage imageNamed:@"条形码.jpg"] ba_imageScaleToWidth:button.frame.size.width];
                [button setImage:stretchableButtonImage forState:UIControlStateNormal];
                
                type = BAKit_ButtonLayoutTypeCenterImageTop;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2 borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
            } break;
            case 3: {
                [button setTitle:@"内容居中-图下文上" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeCenterImageBottom;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2];
            } break;
            case 4: {
                [button setTitle:@"内容居左-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeLeftImageLeft;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB_pod()];
                button.ba_padding_inset = 20;
            } break;
            case 5: {
                [button setTitle:@"内容居左-图右文左" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeLeftImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius];
            } break;
            case 6: {
                [button setTitle:@"内容居右-图左文右" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeRightImageLeft;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];
            } break;
            case 7: {
                button.ba_padding = 10;
                button.ba_padding_inset = 20;
                [button setTitle:@"内容居右-图右文左2" forState:UIControlStateNormal];
                type = BAKit_ButtonLayoutTypeRightImageRight;
                [button ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
            } break;
                
            default: {
                type = BAKit_ButtonLayoutTypeNormal;
            } break;
        }
        
        // 注意：文字、字体大小、图片等设置一定要在设置 ba_button_setBAButtonLayoutType 之前设置，要不然计算会以默认字体大小计算，导致位置偏移
        [button ba_button_setButtonLayoutType:type padding:padding];
        
        [self.view addSubview:button];
    }
}

//#pragma mark - 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
//- (UIButton *)button
//{
//    if (!_button)
//    {
//        // 测试大图片 button 的 layout 布局，如果你的图片宽高大于 自身的宽高，怎需要压缩后再配置布局
//        // 原生写法
//        //        _button = [UIButton buttonWithType:UIButtonTypeCustom];
//        //        [_button setTitle:@"123456" forState:UIControlStateNormal];
//        //        [_button setTitleColor:BAKit_Color_Red_pod forState:UIControlStateNormal];
//        //        _button.backgroundColor = BAKit_Color_Gray_10_pod;
//
//        // BAButton 简单写法
//        _button = [UIButton ba_buttonWithFrame:CGRectZero title:@"123456" titleColor:BAKit_Color_Red_pod titleFont:[UIFont systemFontOfSize:15] backgroundColor:BAKit_Color_Gray_10_pod];
//
//        [self.view addSubview:_button];
//    }
//    return _button;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

