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

- (void)test
{
    [self.btn1 ba_buttonSetBackgroundColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn1 ba_buttonSetBackgroundColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    
    [self.btn2 ba_buttonSetBackgroundColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:NO];
    [self.btn2 ba_buttonSetBackgroundColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:NO];
    
    [self.btn3 ba_buttonSetborderColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn3 ba_buttonSetborderColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    self.btn3.layer.borderWidth = 5;
    
    [self.btn4 ba_buttonSetborderColor:BAKit_ColorRandom() forState:UIControlStateNormal animated:YES];
    [self.btn4 ba_buttonSetborderColor:BAKit_ColorRandom() forState:UIControlStateSelected animated:YES];
    self.btn4.layer.borderWidth = 5;
    
    [self.btn5 ba_buttonSetTitleLabelFont:[UIFont systemFontOfSize:10] forState:UIControlStateNormal];
    [self.btn5 ba_buttonSetTitleLabelFont:[UIFont systemFontOfSize:12] forState:UIControlStateSelected];
    
    [self.btn6 ba_buttonConfigBackgroundColors:@{@(UIControlStateNormal):BAKit_ColorRandom(),
                                                 @(UIControlStateSelected):BAKit_ColorRandom()}];
    
    [self.btn7 ba_buttonConfigBorderColors:@{@(UIControlStateNormal):BAKit_ColorRandom(),
                                             @(UIControlStateSelected):BAKit_ColorRandom()}];
    self.btn7.layer.borderWidth = 5;
    
    [self.btn8 ba_buttonConfigTitleLabelFont:@{@(UIControlStateNormal):[UIFont systemFontOfSize:10],
                                               @(UIControlStateSelected):[UIFont systemFontOfSize:12]}];
}

- (IBAction)btnClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

- (IBAction)countDownClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    __block UIButton *btn = sender;
    [sender ba_countDownWithTimeInterval:60 countDownFormat:@"剩余 %zd"];
    [sender setTimeStoppedCallback:^{
        [btn setTitle:@"倒计时" forState:UIControlStateNormal];
    }];
}

- (IBAction)skipClick:(UIButton *)sender {
    __block UIButton *btn = sender;
    [sender ba_countDownWithTimeInterval:5 countDownFormat:@"跳过 %zd"];
    [sender setTimeStoppedCallback:^{
        [btn setTitle:@"跳过" forState:UIControlStateNormal];
    }];
}

- (void)dealloc {
    NSLog(@"释放了");
}

@end
