//
//  ViewController.m
//  切割image
//
//  Created by wujianqiang on 16/7/21.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"backimage"];
    [self.view addSubview:imageView];
    
    [self creatPathWithView:imageView];
}

- (void)creatPathWithView:(UIImageView *)pathView{
//    CGFloat viewWidth = CGRectGetWidth(pathView.frame);
//    CGFloat viewHeight = CGRectGetHeight(pathView.frame) - CORNERSPACE;
    CAShapeLayer *signLayer = [CAShapeLayer layer];
    UIBezierPath *signPath = [UIBezierPath bezierPath];
    [signPath moveToPoint:CGPointMake(0, 100)];
    [signPath addLineToPoint:CGPointMake(375, 100)];
    [signPath addLineToPoint:CGPointMake(375, 313)];
    [signPath addLineToPoint:CGPointMake(0, 313)];
    [signPath closePath];
    signLayer.path = signPath.CGPath;
    pathView.layer.mask = signLayer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
