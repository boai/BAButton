//
//  XibButtonViewController.m
//  BAButton
//
//  Created by apple on 2017/5/20.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "XibButtonViewController.h"

@interface XibButtonViewController ()

@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageRightButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageTopButton;
@property (weak, nonatomic) IBOutlet UIButton *centerImageBottomButton;
@property (weak, nonatomic) IBOutlet UIButton *leftImageLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *leftImageRightButton;
@property (weak, nonatomic) IBOutlet UIButton *rightImageLeftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightImageRightButton;

@end

@implementation XibButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
