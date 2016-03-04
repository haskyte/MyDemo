//
//  LaunchViewController.m
//  Launch
//
//  Created by wujianqiang on 15/12/1.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImage.image = [UIImage imageNamed:@"Login_BackGroundImage@2x"];
    [self.view addSubview:backImage];
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
