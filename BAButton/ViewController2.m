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

    [self.normalButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeNormal padding:padding];
    
    [self.normalButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeft viewCornerRadius:viewCornerRadius];
    
    [self.centerImageRightButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeCenterImageRight padding:padding];
    [self.centerImageRightButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];

    [self.centerImageTopButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeCenterImageTop padding:padding];
    [self.centerImageTopButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2];

    [self.centerImageBottomButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeCenterImageBottom padding:padding];
    [self.centerImageBottomButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2];

    [self.leftImageLeftButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeLeftImageLeft padding:padding];
    self.leftImageLeftButton.padding_inset = 20;
    [self.leftImageLeftButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeftAndBottomRight viewCornerRadius:viewCornerRadius];

    [self.leftImageRightButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeLeftImageRight padding:padding];
    self.leftImageRightButton.padding_inset = 20;

    [self.leftImageRightButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius];

    [self.rightImageLeftButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeRightImageLeft padding:padding];
    [self.rightImageLeftButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];

    [self.rightImageRightButton ba_button_setBAButtonLayoutType:BAButtonLayoutTypeRightImageRight padding:padding];
    [self.rightImageRightButton ba_button_setBAViewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
}


@end
