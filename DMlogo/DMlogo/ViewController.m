//
//  ViewController.m
//  DMlogo
//
//  Created by wujianqiang on 16/8/18.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "DMRefreshView.h"
#import "DMHUDView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 500, 100, 30);
    [but setBackgroundColor:[UIColor redColor]];
    [but addTarget:self action:@selector(creatHUD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
}

- (void)creatHUD{
    
    
    DMHUDView *HUD = [[DMHUDView alloc] initWithFrame:CGRectMake(100, 200, 55, 55)];
    [self.view addSubview:HUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DMRefreshView *dmView = [[DMRefreshView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
        [self.view addSubview:dmView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10000 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HUD removeFromSuperview];
            [dmView removeFromSuperview];
        });
    });

    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
