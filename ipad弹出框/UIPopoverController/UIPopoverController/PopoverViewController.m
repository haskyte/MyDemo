//
//  PopoverViewController.m
//  UIPopoverController
//
//  Created by lanouhn on 15/6/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()

@end

@implementation PopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.preferredContentSize = CGSizeMake(200, 200);
    
    
    //导航条上的标题
    self.navigationItem.title = @"标题";
    
    
    //设置导航视图控制器的左按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(clickAction:)];
}
//实现左按钮的点击事件

- (void)clickAction:(UIBarButtonItem *)item {
    //关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)heheda:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
