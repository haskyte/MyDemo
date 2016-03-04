//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by wujianqiang on 16/2/25.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end
IB_DESIGNABLE

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(UIButton *)sender {
    [self clearView];
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.layerView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [layer addAnimation:animation forKey:nil];
    
    
    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation1.fromValue = @0.1;
//    animation1.toValue = @1;
//    animation1.duration = 1;
//    [layer addAnimation:animation1 forKey:nil];
    
//    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//    [bezierPath moveToPoint: CGPointMake(100, 100)];
//    [bezierPath addLineToPoint: CGPointMake(0, 0)];
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1;
//    [bezierPath stroke];
//    animation2.path = bezierPath.CGPath;
//    animation2.duration = 1;
//    animation2.repeatCount = 1;
//    [layer addAnimation:animation2 forKey:nil];
//    
//    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    pulse.duration = 1;
//    pulse.repeatCount = 1;
//    pulse.fromValue = [NSNumber numberWithFloat:1];
//    pulse.toValue = [NSNumber numberWithFloat:2];
//    [layer addAnimation:pulse forKey:nil];
    self.layerView.backgroundColor = [UIColor colorWithRed:20/255.0 green:50/255.0 blue:240/255.0 alpha:1];
    [self creatLine];
    [self creatQuxian];
    [self creatRound];
    [self creatMyName];
}

// 直线

- (void)creatLine{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(20, 240)];
    [linePath addLineToPoint:CGPointMake(320, 270)];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layerView.layer addSublayer:lineLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [lineLayer addAnimation:animation forKey:nil];
}

// 曲线
- (void)creatQuxian{
    CGPoint startPoint   = CGPointMake(50, 100);
    CGPoint endPoint     = CGPointMake(350, 100);
    CGPoint controlPoint = CGPointMake(150, 10);
    CGPoint controlPoint1 = CGPointMake(250, 190);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint1];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.layerView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [layer addAnimation:animation forKey:nil];
}

- (void)creatMyName{
    CGFloat startX = 100;
    CGFloat startY = 180;
    
    CAShapeLayer *nameLayer = [CAShapeLayer layer];
    UIBezierPath *namePath = [UIBezierPath bezierPath];
    
    [namePath moveToPoint:CGPointMake(startX + 25, startY + 20)];
    [namePath addLineToPoint:CGPointMake(startX + 30, startY + 80)];
    
    [namePath moveToPoint:CGPointMake(startX + 30 , startY + 30)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 25)];
    
    [namePath moveToPoint:CGPointMake(startX + 150 , startY + 22.5)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 80)];
    
    [namePath moveToPoint:CGPointMake(startX + 30 , startY + 70)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 70)];
    
    [namePath moveToPoint:CGPointMake(startX + 24 , startY + 100)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 90)];
    
    [namePath moveToPoint:CGPointMake(startX + 20 , startY + 127)];
    [namePath addLineToPoint:CGPointMake(startX + 168, startY + 121)];
    
    [namePath moveToPoint:CGPointMake(startX + 92 , startY + 92)];
    [namePath addQuadCurveToPoint:CGPointMake(startX + 20, startY + 165) controlPoint:CGPointMake(startX+90, startY+155)];
    [namePath moveToPoint:CGPointMake(startX + 92 , startY + 128)];
    [namePath addQuadCurveToPoint:CGPointMake(startX + 168, startY + 165) controlPoint:CGPointMake(startX+150, startY+160)];
    
    nameLayer.path = namePath.CGPath;
    nameLayer.fillColor = [UIColor clearColor].CGColor;
    nameLayer.strokeColor = [UIColor blackColor].CGColor;
    nameLayer.lineWidth = 5;
    [self.layerView.layer addSublayer:nameLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [nameLayer addAnimation:animation forKey:nil];
    
}

- (void)creatRound{
    CAShapeLayer *roundLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 200, 200)];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:100].bezierPathByReversingPath];
    roundLayer.fillColor = [UIColor redColor].CGColor;
//    roundLayer.strokeColor = [UIColor redColor].CGColor;
    roundLayer.path = path.CGPath;
    [self.layerView.layer addSublayer:roundLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [roundLayer addAnimation:animation forKey:nil];
}


- (void)clearView{
    [self.layerView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}


@end
