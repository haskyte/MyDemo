//
//  secondViewController.m
//  gifTest
//
//  Created by wujianqiang on 16/8/16.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.titletext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
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
