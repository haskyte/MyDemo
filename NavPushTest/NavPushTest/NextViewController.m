//
//  NextViewController.m
//  NavPushTest
//
//  Created by wujianqiang on 16/7/7.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"first"];
    [bar pushNavigationItem:item animated:NO];
    [self.view addSubview:bar];
    
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"123123" style:UIBarButtonItemStylePlain target:self action:@selector(returnBack)];
}

- (void)returnBack{
    [self.navigationController popViewControllerAnimated:YES];
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
