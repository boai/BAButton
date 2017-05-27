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
    
    [self test];
    [self setupNavi];
}

- (void)setupNavi
{
    CGRect frame = CGRectMake(0, 0, 80, 40);
    UIButton *navi_rightButton = [[UIButton alloc] creatButtonWithFrame:frame title:@"xib" selTitle:nil titleColor:nil titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAButtonLayoutTypeCenterImageRight viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleRightNaviButtonAction)];
    navi_rightButton.backgroundColor = BAKit_ColorRandom();
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navi_rightButton];
    
    UIButton *navi_leftButton = [[UIButton alloc] creatButtonWithFrame:frame title:@"state" selTitle:nil titleColor:nil titleFont:nil image:[UIImage imageNamed:@"tabbar_mainframeHL"] selImage:nil padding:2 buttonPositionStyle:BAButtonLayoutTypeCenterImageRight viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:20 target:self selector:@selector(handleLeftNaviButtonAction)];
    navi_rightButton.backgroundColor = BAKit_ColorRandom();
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
        button.backgroundColor = BAKit_ColorRandom();
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
        min_y = CGRectGetMaxY(button.frame) + min_space;
        
        CGFloat padding = 10;
        CGFloat viewCornerRadius = 15;
        BAButtonLayoutType type;
        
        switch (i) {
            case 0:
            {
                [button setTitle:@"默认样式：内容居中-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeNormal;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 1:
            {
                [button setTitle:@"内容居中-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
            }
                break;
            case 2:
            {
                [button setTitle:@"内容居中-图上文下" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageTop;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2];
            }
                break;
            case 3:
            {
                [button setTitle:@"内容居中-图下文上" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageBottom;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2];
            }
                break;
            case 4:
            {
                [button setTitle:@"内容居左-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeLeftImageLeft;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
                button.padding_inset = 20;
            }
                break;
            case 5:
            {
                [button setTitle:@"内容居左-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeLeftImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 6:
            {
                [button setTitle:@"内容居右-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeRightImageLeft;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 7:
            {
                [button setTitle:@"内容居右-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeRightImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
            }
                break;
                
            default:
                type = BAButtonLayoutTypeNormal;
                break;
        }
        [button ba_button_setBAButtonLayoutType:type padding:padding];
        [self.view addSubview:button];
    }
}




@end
