//
//  ViewController.m
//  alertController
//
//  Created by wujianqiang on 15/10/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     _alertController = [UIAlertController alertControllerWithTitle:@"我是title" message:@"我是message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@" title" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"222" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"红色");
    }];
    [_alertController addAction:action];
    [_alertController addAction:action1];
}
- (IBAction)hehe:(id)sender {
    [self presentViewController:_alertController animated:YES completion:nil];
}

- (void)touchbutton:(UIButton *)button{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
