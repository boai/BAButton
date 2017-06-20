//
//  ViewController2.m
//  BAButton
//
//  Created by boai on 2017/5/20.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController2.h"
#import "BAButton.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageRightButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageTopButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageBottomButton;

@property (weak, nonatomic) IBOutlet UIButton *leftImageLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *leftImageRightButton;
@property (weak, nonatomic) IBOutlet UIButton *rightImageLeftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightImageRightButton;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test];
}

- (void)test
{
    self.title = @"xib、storyboard";
    CGFloat padding = 10;
    CGFloat viewCornerRadius = 15;
    
    [self.normalButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeNormal padding:padding];
    
    [self.normalButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB()];
    
    [self.centerImageRightButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeCenterImageRight padding:padding];
    [self.centerImageRightButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB()];
    
    [self.centerImageTopButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeCenterImageTop padding:padding];
    [self.centerImageTopButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2];
    
    [self.centerImageBottomButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeCenterImageBottom padding:padding];
    [self.centerImageBottomButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2 borderWidth:2.0f borderColor:BAKit_Color_RandomRGB()];
    
    [self.leftImageLeftButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeLeftImageLeft padding:padding];
    self.leftImageLeftButton.ba_padding_inset = 20;
    [self.leftImageLeftButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndBottomRight viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB()];
    
    [self.leftImageRightButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeLeftImageRight padding:padding];
    self.leftImageRightButton.ba_padding_inset = 20;
    
    [self.leftImageRightButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius borderWidth:2.0f borderColor:BAKit_Color_RandomRGB()];
    
    [self.rightImageLeftButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeRightImageLeft padding:padding];
    [self.rightImageLeftButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];
    
    [self.rightImageRightButton ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeRightImageRight padding:padding];
    [self.rightImageRightButton ba_button_setViewRectCornerType:BAKit_ViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
}


@end
