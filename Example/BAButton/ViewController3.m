//
//  ViewController3.m
//  BAButton
//
//  Created by 任子丰 on 17/5/25.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController3.h"
#import "BAButton.h"

@interface ViewController3 ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *countDownBtn;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIButton State";
    [self test];
}

- (void)test {
    [self.btn1 ba_buttonSetBackgroundColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateNormal animated:YES];
    [self.btn1 ba_buttonSetBackgroundColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateSelected animated:YES];
    // 不同状态下的阴影效果
    [self.btn1 ba_buttonSetRoundShadowWithCornerRadius:0 shadowColor:BAKit_Color_Yellow_pod offset:CGSizeMake(0.6, 0.6) opacity:1 shadowRadius:5 forState:UIControlStateNormal];
    [self.btn1 ba_buttonSetRoundShadowWithCornerRadius:0 shadowColor:BAKit_Color_Red_pod offset:CGSizeMake(0.6, 0.6) opacity:1 shadowRadius:5 forState:UIControlStateSelected];
    
    [self.btn2 ba_buttonSetBackgroundColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateNormal animated:NO];
    [self.btn2 ba_buttonSetBackgroundColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateSelected animated:NO];
    
    [self.btn3 ba_buttonSetborderColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateNormal animated:YES];
    [self.btn3 ba_buttonSetborderColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateSelected animated:YES];
    self.btn3.layer.borderWidth = 5;
    
    [self.btn4 ba_buttonSetborderColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateNormal animated:YES];
    [self.btn4 ba_buttonSetborderColor:BAKit_Color_RandomRGB_pod() forState:UIControlStateSelected animated:YES];
    self.btn4.layer.borderWidth = 5;
    
    [self.btn5 ba_buttonSetTitleLabelFont:[UIFont systemFontOfSize:10] forState:UIControlStateNormal];
    [self.btn5 ba_buttonSetTitleLabelFont:[UIFont systemFontOfSize:12] forState:UIControlStateSelected];
    
    [self.btn6 ba_buttonConfigBackgroundColors:@{@(UIControlStateNormal):BAKit_Color_RandomRGB_pod(),
                                                 @(UIControlStateSelected):BAKit_Color_RandomRGB_pod()}];
    
    [self.btn7 ba_buttonConfigBorderColors:@{@(UIControlStateNormal):BAKit_Color_RandomRGB_pod(),
                                             @(UIControlStateSelected):BAKit_Color_RandomRGB_pod()}];
    self.btn7.layer.borderWidth = 5;
    
    [self.btn8 ba_buttonConfigTitleLabelFont:@{@(UIControlStateNormal):[UIFont systemFontOfSize:10],
                                               @(UIControlStateSelected):[UIFont systemFontOfSize:12]}];
}

- (IBAction)btnClick:(UIButton *)sender {
    // 添加按钮点击音效和震动效果
//    [sender ba_buttonPlaySoundEffectWithFileName:@"failure.mp3" isNeedShock:YES];
    sender.selected = !sender.isSelected;
}

- (IBAction)countDownClick:(UIButton *)sender {
//    sender.userInteractionEnabled = NO;
    __block UIButton *btn = sender;
    [sender ba_countDownCustomWithTimeInterval:5 block:^(NSInteger currentTime) {
        // 此处是可以自由定制 title 和 image
        NSString *title = [NSString stringWithFormat:@"Countdown_0%ld", (long)currentTime];
        dispatch_async(dispatch_get_main_queue(), ^{
            [btn setTitle:nil forState:UIControlStateNormal];
            [btn setBackgroundImage:BAKit_ImageName(title) forState:UIControlStateNormal];
        });
    }];

    [sender setTimeStoppedCallback:^{
        [btn setTitle:@"倒计时" forState:UIControlStateNormal];
    }];
}

- (IBAction)skipClick:(UIButton *)sender {
//    __block UIButton *btn = sender;
    [sender ba_countDownWithTimeInterval:5 countDownFormat:nil endTitle:@"重新发送"];
//    [sender setTimeStoppedCallback:^{
//        [btn setTitle:@"跳过" forState:UIControlStateNormal];
//    }];
}

- (void)dealloc {
    NSLog(@"释放了");
}


@end
