//
//  ViewController.m
//  roundButton
//
//  Created by wujianqiang on 16/6/21.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blueColor]];
    
    CAShapeLayer *roundLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:50].bezierPathByReversingPath];
    
    roundLayer.fillColor = [UIColor whiteColor].CGColor;
    
    roundLayer.path = path.CGPath;
    
    [button.layer addSublayer:roundLayer];
    
    [self.view addSubview:button];
}

- (void)click{
    NSLog(@"1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
