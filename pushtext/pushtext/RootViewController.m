//
//  RootViewController.m
//  pushtext
//
//  Created by wujianqiang on 16/1/26.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "JTNavigationController.h"
#import "FirstViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    JTNavigationController *jtnav = [[JTNavigationController alloc] initWithRootViewController:firstVC];
    self.viewControllers = @[jtnav];
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
