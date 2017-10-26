//
//  ViewController.m
//  ProgerssTest
//
//  Created by wujianqiang on 16/7/13.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

#import "CustomProgress.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomProgress *progress = [[CustomProgress alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.frame) - 40, 13)];
    progress.progress = 1;
    progress.animation = YES;
    [self.view addSubview:progress];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
