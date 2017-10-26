//
//  DMHUDView.m
//  DMlogo
//
//  Created by wujianqiang on 16/8/19.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "DMHUDView.h"

#define BORDERWIDE 3
#define TIME 2
#define RADIU 7

@interface DMHUDView ()

@property (nonatomic, strong) UIView *layerView;

@end

@implementation DMHUDView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layerView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:self.layerView];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self creatRound];
    [self creatTurnRound];
    
    [self creatLogo];
    [self creatYeLogo];
}

- (void)creatRound{
    CAShapeLayer *cycleLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.layerView.center radius:CGRectGetWidth(self.frame)/2 startAngle:M_PI*2 endAngle:0 clockwise:NO];
    cycleLayer.path = path.CGPath;
    cycleLayer.fillColor = [UIColor clearColor].CGColor;
    cycleLayer.strokeColor = [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1].CGColor;
    
    cycleLayer.lineWidth = BORDERWIDE;
    [self.layerView.layer addSublayer:cycleLayer];
}

- (void)creatTurnRound{
    UIView *turnView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:turnView];
    CAShapeLayer *cycleLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:turnView.center radius:CGRectGetWidth(self.frame)/2 startAngle:M_PI*3/2 endAngle:M_PI*11/6 clockwise:YES];
    cycleLayer.path = path.CGPath;
    cycleLayer.fillColor = [UIColor clearColor].CGColor;
    cycleLayer.strokeColor = [UIColor colorWithRed:72/255.0 green:173/255.0 blue:107/255.0 alpha:1].CGColor;
    cycleLayer.lineWidth = BORDERWIDE;
    [turnView.layer addSublayer:cycleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithFloat:M_PI*3/2];
    animation.toValue = [NSNumber numberWithFloat:M_PI*7/2];
    animation.duration = TIME;
    animation.repeatCount = 1000;
    [turnView.layer addAnimation:animation forKey:nil];
}

- (void)creatLogo{
    CAShapeLayer *logoLayer = [CAShapeLayer layer];
    UIBezierPath *logoPath = [UIBezierPath bezierPath];
    
    [logoPath moveToPoint:CGPointMake(24, 18)];
    [logoPath addLineToPoint:CGPointMake(24, 30)];
    [logoPath addArcWithCenter:CGPointMake(17, 30) radius:RADIU startAngle:0 endAngle:M_PI*3/2 clockwise:YES];
    [logoPath addLineToPoint:CGPointMake(21, 23)];
    
    [logoPath moveToPoint:CGPointMake(27, 23)];
    [logoPath addArcWithCenter:CGPointMake(27, 30) radius:RADIU startAngle:M_PI*3/2 endAngle:M_PI*2 clockwise:YES];
    [logoPath addLineToPoint:CGPointMake(34, 37)];
    
    logoLayer.path = logoPath.CGPath;
    logoLayer.fillColor = [UIColor clearColor].CGColor;
    logoLayer.strokeColor = [UIColor colorWithRed:72/255.0 green:173/255.0 blue:107/255.0 alpha:1].CGColor;
    logoLayer.lineWidth = 2;
    [self.layerView.layer addSublayer:logoLayer];

//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.fromValue = @0;
//    animation.toValue = @1;
//    animation.duration = TIME*3/4;
//    [logoLayer addAnimation:animation forKey:nil];
    
}

- (void)creatYeLogo{
    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(TIME*3/4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CAShapeLayer *yeLogoLayer = [CAShapeLayer layer];
        UIBezierPath *yeLogoPath = [UIBezierPath bezierPath];
        [yeLogoPath moveToPoint:CGPointMake(36, 23)];
        [yeLogoPath addArcWithCenter:CGPointMake(36, 30) radius:RADIU startAngle:M_PI*3/2 endAngle:M_PI*2 clockwise:YES];
        [yeLogoPath addLineToPoint:CGPointMake(43, 37)];
        
        yeLogoLayer.path = yeLogoPath.CGPath;
        yeLogoLayer.fillColor = [UIColor clearColor].CGColor;
        yeLogoLayer.strokeColor = [UIColor colorWithRed:239/255.0 green:177/255.0 blue:44/255.0 alpha:1].CGColor;
        yeLogoLayer.lineWidth = 2;
        [weakSelf.layerView.layer addSublayer:yeLogoLayer];
        
//        CABasicAnimation *yeanimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//        yeanimation.fromValue = @0;
//        yeanimation.toValue = @1;
//        yeanimation.duration = TIME/4;
//        [yeLogoLayer addAnimation:yeanimation forKey:nil];
//    });
}

@end
