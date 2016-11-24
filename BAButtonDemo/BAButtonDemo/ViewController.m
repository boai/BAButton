//
//  ViewController.m
//  BAButtonDemo
//
//  Created by 博爱之家 on 16/4/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "BAButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buttonTest];
}

- (void)buttonTest
{
    BAButton *btn = [[BAButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];;
    [btn setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn setTitle:@"系统默认样式" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.buttonStatus = BABAButtonStatusNormal;
    btn.buttonCornerRadius = 5.0;
    btn.frame = CGRectMake(50, 50, 200, 50);
    /*! 文字和图片的间距用这两行代码更改就行了 */
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, btn.titleLabel.frame.size.width+5);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [self.view addSubview:btn];
    
    //    BAButton *btn = [[BAButton alloc] initWithFrame:CGRectMake(100, 100, 200, 30) image:[UIImage imageNamed:@"btn_share"] highlightedImage:[UIImage imageNamed:@"btn_share"] fadeDuration:3];
    //    btn.backgroundColor = [UIColor greenColor];
    //    //    [btn setImage:[UIImage imageNamed:@"tabbar_discover"] forState:UIControlStateNormal];
    //    [btn setTitle:@"默认" forState:UIControlStateNormal];
    //    //    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    //    btn.buttonStatus = BABAButtonStatusNormal;
    //    //    btn.buttonCornerRadius = 5.0;
    //    //    btn.frame = CGRectMake(100, 100, 200, 30);
    //    [self.view addSubview:btn];
    
    BAButton *btn1 = [[BAButton alloc] init];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn1 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.buttonStatus = BABAButtonStatusLeft;
    btn1.buttonCornerRadius = 5.0;
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    btn1.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame) + 10, 200, 50);
    [self.view addSubview:btn1];
    
    BAButton *btn2 = [[BAButton alloc] init];
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn2 setTitle:@"中心对齐[文字左图片右]" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.buttonStatus = BABAButtonStatusCenter;
    btn2.buttonCornerRadius = 5.0;
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    btn2.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn1.frame) + 10, 300, 50);
    [self.view addSubview:btn2];
    
    BAButton *btn3 = [[BAButton alloc] init];
    [btn3 setBackgroundColor:[UIColor greenColor]];
    [btn3 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn3 setTitle:@"右对齐[文字左图片右]" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.buttonStatus = BABAButtonStatusRight;
    btn3.buttonCornerRadius = 5.0;
    btn3.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn2.frame) + 10, 200, 50);
    [self.view addSubview:btn3];
    
    BAButton *btn4 = [[BAButton alloc] init];
    btn4.buttonStatus = BABAButtonStatusLeft;
    [btn4 setBackgroundColor:[UIColor greenColor]];
    [btn4 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn4 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:10];
    btn4.buttonCornerRadius = 5.0;
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn3.frame) + 10, 200, 50);
    [self.view addSubview:btn4];
    
    BAButton *btn5 = [[BAButton alloc] init];
    btn5.buttonStatus = BABAButtonStatusTop;
    [btn5 setBackgroundColor:[UIColor greenColor]];
    [btn5 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn5 setTitle:@"图片在上，文字在下" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:10];
    btn5.buttonCornerRadius = 5.0;
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn5.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn4.frame) + 10, 200, 80);
    [self.view addSubview:btn5];
    
    BAButton *btn6 = [[BAButton alloc] init];
    btn6.buttonStatus = BABAButtonStatusBottom;
    [btn6 setBackgroundColor:[UIColor greenColor]];
    [btn6 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn6 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:10];
    btn6.buttonCornerRadius = 5.0;
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn6.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn5.frame) + 10, 150, 80);
    [self.view addSubview:btn6];
    
    BAButton *btn7 = [[BAButton alloc] init];
    btn7.buttonStatus = BABAButtonStatusBottom;
    [btn7 setBackgroundColor:[UIColor greenColor]];
    [btn7 setImage:[UIImage imageNamed:@"播放次数"] forState:UIControlStateNormal];
    [btn7 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:13];
    btn7.buttonCornerRadius = 5.0;
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn7.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn6.frame) + 10, 150, 80);
    [self.view addSubview:btn7];
}

@end
