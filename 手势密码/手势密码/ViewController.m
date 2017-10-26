//
//  ViewController.m
//  手势密码
//
//  Created by wujianqiang on 16/8/9.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "LLLockViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LLLockViewController *lockVC = [[LLLockViewController alloc] initWithType:LLLockViewTypeCreate];
    [self presentViewController:lockVC animated:YES completion:nil];
}

@end
