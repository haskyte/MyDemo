//
//  ViewController.m
//  PageController
//
//  Created by wujianqiang on 15/11/19.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "PJRSignatureView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PJRSignatureView *signView = [[PJRSignatureView alloc] initWithFrame:self.view.bounds];

    [self.view addSubview:signView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
