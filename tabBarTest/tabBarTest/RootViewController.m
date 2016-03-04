//
//  RootViewController.m
//  tabBarTest
//
//  Created by wujianqiang on 15/10/12.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FirstViewController *first = [[FirstViewController alloc] init];
    SecondViewController *second = [[SecondViewController alloc] init];
    
    self.viewControllers = @[first,second];
    self.tabBar.hidden = YES;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.tag = 0;
    button1.frame = CGRectMake(10, 100, 200, 50);
    button1.backgroundColor = [UIColor whiteColor];
    [button1 addTarget:self action:@selector(buttton1:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(10, 200, 200, 50);
    button2.backgroundColor = [UIColor whiteColor];
    [button2 addTarget:self action:@selector(buttton2:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 1;
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    

}

- (void)buttton1:(UIButton *)button1{
    self.selectedIndex = button1.tag;
}
- (void)buttton2:(UIButton *)button2{
    self.selectedIndex = button2.tag;
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
