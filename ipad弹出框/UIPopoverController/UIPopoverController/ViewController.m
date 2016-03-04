//
//  ViewController.m
//  UIPopoverController
//
//  Created by lanouhn on 15/6/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建一个按钮,点击实现窗口弹出
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    //设置按钮的尺寸和大小
    btn.frame = CGRectMake(50, 200, 100, 50);
    
    //设置按钮的背景颜色
    btn.backgroundColor = [UIColor magentaColor];

    //按钮上的文字
    [btn setTitle:@"效果" forState:(UIControlStateNormal)];
    
    //给按钮添加事件
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    //将按钮添加到视图上
    [self.view addSubview:btn];
    
    
    NSString *str = @"11.6%";
    NSLog(@"%d",[str integerValue]);
    
    
    
}
//实现按钮的点击事件
- (void)clickAction:(UIButton *)item {
    //初始化要弹出的视图, 给视图添加重用标识
    PopoverViewController *popVC = [[PopoverViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:popVC];
    
    //设置弹出视图的样式(style)
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    
    //跳转代码
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
