//
//  ViewController.m
//  循环动画
//
//  Created by wujianqiang on 15/12/23.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "repeatBottonView.h"
#import "animatView.h"
@interface ViewController ()

@property (nonatomic ,strong) animatView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.animationView = [[animatView alloc] initWithFrame:CGRectMake(100, 100, 30, 120)];
    [self.view addSubview:self.animationView];
}
- (IBAction)show:(id)sender {
    [self.animationView showAnimation];
}
- (IBAction)hide:(id)sender {
    [self.animationView hiddenAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
