//
//  RepeatView.m
//  ball
//
//  Created by wujianqiang on 2016/11/17.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "RepeatView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define RGB(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#define durationTime 0.01

@implementation RepeatView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:backView];
        
        CGFloat ballRadius = self.bounds.size.width/2;
        UIBezierPath *path = [UIBezierPath bezierPath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        [path moveToPoint:CGPointMake(self.bounds.size.width/2, 0)];
        
        [path addArcWithCenter:CGPointMake(self.bounds.size.width/2, 0 + ballRadius)
                        radius:ballRadius
                    startAngle:M_PI * 3/2
                      endAngle:2 * M_PI + M_PI * 3/2
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
        animation.duration = durationTime;
        animation.repeatCount = MAXFLOAT;
        [layer addAnimation:animation forKey:nil];
        
        CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        pathAnimation.calculationMode = kCAAnimationPaced;
        pathAnimation.rotationMode = kCAAnimationRotateAutoReverse;
        pathAnimation.fillMode = kCAFillModeForwards;
        pathAnimation.removedOnCompletion = NO;
        pathAnimation.duration = durationTime;
        pathAnimation.repeatCount = MAXFLOAT;
        
        
        pathAnimation.path = path.CGPath;
        
        UIImageView *pointView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - 3, 0, 30, 10)];
        pointView.backgroundColor = [UIColor redColor];
        pointView.image = [UIImage imageNamed:@"RepeatView"];
        pointView.layer.cornerRadius = 5;
        pointView.layer.masksToBounds = YES;
        [backView addSubview:pointView];
        [pointView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];

        
    }
    return self;
}




@end
