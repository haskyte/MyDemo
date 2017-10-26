//
//  CircleView.m
//  ball
//
//  Created by wujianqiang on 2016/11/17.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "CircleView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define RGB(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame Progress:(CGFloat)progress{
    self = [super initWithFrame:frame];
    if (self) {
      
        [self creatBallWithProgress:progress];
    }
    return self;
}

- (void)creatBallWithProgress:(CGFloat)progress{
    
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:backView];
    
    CGFloat ballRadius = self.bounds.size.width/2;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:CGPointMake(self.bounds.size.width/2, 0)];
    
    [path addArcWithCenter:CGPointMake(self.bounds.size.width/2, 0 + ballRadius)
                    radius:ballRadius
                startAngle:M_PI * 3/2
                  endAngle:2 * M_PI * progress + M_PI * 3/2
                 clockwise:YES];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = RGB(127, 238, 245).CGColor;
    layer.lineWidth = 6;
    layer.lineCap = kCALineCapRound;
    [backView.layer addSublayer:layer];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = progress;
    [layer addAnimation:animation forKey:nil];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = progress;
    pathAnimation.repeatCount = 1;
    
    
    pathAnimation.path = path.CGPath;

    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - 3, 0, 10, 10)];
    pointView.backgroundColor = [UIColor redColor];
    pointView.layer.cornerRadius = 5;
    pointView.layer.masksToBounds = YES;
    [backView addSubview:pointView];
    [pointView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = [NSNumber numberWithFloat:0];
        animation.toValue = [NSNumber numberWithFloat:M_PI*2];
        animation.duration = 0.1;
        animation.repeatCount = 1000;
        [backView.layer addAnimation:animation forKey:nil];
    });
}

@end
