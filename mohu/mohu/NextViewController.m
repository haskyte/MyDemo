//
//  NextViewController.m
//  mohu
//
//  Created by wujianqiang on 15/12/22.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "NextViewController.h"
#import <FXBlurView.h>
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"backImage@2x"];
    [self.view addSubview:imageView];
    FXBlurView *blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [blurView setDynamic:YES];
    blurView.blurRadius = 30;
    blurView.tintColor = [UIColor clearColor];
    [imageView addSubview:blurView];
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
