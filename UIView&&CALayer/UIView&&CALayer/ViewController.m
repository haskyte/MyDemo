//
//  ViewController.m
//  UIView&&CALayer
//
//  Created by wujianqiang on 16/10/12.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];
    blueLayer.delegate = self;
//    [blueLayer display];
    
    UIImage *image = [UIImage imageNamed:@"image@2x.png"];
//    blueLayer.contents = (__bridge id _Nullable)(image.CGImage);
    self.layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
//    self.layerView.contentMode = UIViewContentModeScaleAspectFit;
    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = image.scale;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    self.layerView.layer.masksToBounds = YES;
    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    // 渐变色
    [self GradientLayer];

}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx,[UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)GradientLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:gradientLayer];
    
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor,  (__bridge id)[UIColor redColor].CGColor];
    
    //set locations
    gradientLayer.locations = @[@0.0,@0.5, @1];
    
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
