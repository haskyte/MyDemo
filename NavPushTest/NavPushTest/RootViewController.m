//
//  RootViewController.m
//  NavPushTest
//
//  Created by wujianqiang on 16/7/7.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "NextViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImage.image = [UIImage imageNamed:@"backimage@2x"];
//    [self.view addSubview:backImage];
    
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [bar setBarTintColor:[UIColor yellowColor]];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"root"];
    [bar pushNavigationItem:item animated:NO];
    [self.view addSubview:bar];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 200, 80, 40)];
    pushBtn.backgroundColor = [UIColor grayColor];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)push:(id)sender {
    NextViewController *viewcontroller = [[NextViewController alloc ]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
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
