//
//  DMRefreshView.m
//  DMlogo
//
//  Created by wujianqiang on 16/8/18.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "DMRefreshView.h"

#define DURATION 1

@implementation DMRefreshView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatCycleWithColor:[UIColor colorWithRed:254/255.0 green:204/255.0 blue:81/255.0 alpha:1]];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self creatCycleWithColor:[UIColor colorWithRed:75/255.0 green:197/255.0 blue:252/255.0 alpha:1]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self creatCycleWithColor:[UIColor colorWithRed:88/255.0 green:197/255.0 blue:172/255.0 alpha:1]];
            });
        });
        
        
        UIImageView *starImage = [[UIImageView alloc] init];
        starImage.bounds = CGRectMake(0, 0, CGRectGetWidth(self.frame)/4, CGRectGetWidth(self.frame)/4);
        starImage.center = self.center;
        starImage.image = [UIImage imageNamed:@"star@2x.png"];
        [self addSubview:starImage];
        
        starImage.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:1 animations:^{
            starImage.transform = CGAffineTransformMakeScale(1, 1);
        }];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = [NSNumber numberWithFloat:-M_PI*3/2];
        animation.toValue = [NSNumber numberWithFloat:-M_PI*7/2];
        animation.duration = DURATION;
        [starImage.layer addAnimation:animation forKey:nil];
    }
    return self;
}

- (void)creatCycleWithColor:(UIColor *)color{
    CAShapeLayer *cycleLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:CGRectGetWidth(self.frame)/4 startAngle:M_PI*3/2 endAngle:0 clockwise:NO];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame)-CGRectGetWidth(self.frame)/4, CGRectGetMinY(self.frame)+CGRectGetWidth(self.frame)/16)];
    cycleLayer.path = path.CGPath;
    cycleLayer.fillColor = [UIColor clearColor].CGColor;
    cycleLayer.strokeColor = color.CGColor;
    
    cycleLayer.lineWidth = 3;
    [self.layer addSublayer:cycleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = DURATION;
    [cycleLayer addAnimation:animation forKey:nil];
}


@end
