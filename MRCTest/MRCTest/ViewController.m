//
//  ViewController.m
//  MRCTest
//
//  Created by wujianqiang on 15/11/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] init];
    
    
    NSArray *array = [NSArray array] ;
    
    array = [@[] copy];
    
    [array release];
    [view release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
