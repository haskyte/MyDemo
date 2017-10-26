//
//  CustomProgress.m
//  ProgerssTest
//
//  Created by wujianqiang on 16/7/14.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "CustomProgress.h"

#define BORDER CGRectGetHeight(self.frame)/5
#define HEIGHT CGRectGetHeight(self.frame)
#define WIDE CGRectGetWidth(self.frame)
#define SIDE 1
#define CORNERSPACE 3
#define BLUECOLOR [UIColor colorWithRed:119/255.0 green:196/255.0 blue:84/255.0 alpha:1]
#define DURATION 1.5

@interface CustomProgress ()

@property (nonatomic, strong) UILabel *percentLabel;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *pointView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic)     int count;

@end

@implementation CustomProgress

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _count = 0;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.percentLabel];
        [self addSubview:self.backView];
        [self addSubview:self.leftView];
        [self addSubview:self.pointView];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backView.layer.borderColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1].CGColor;
    self.backView.layer.borderWidth = BORDER;
    self.backView.layer.cornerRadius = HEIGHT/2;
    self.backView.layer.masksToBounds = YES;
    
    self.leftView.layer.cornerRadius = CGRectGetHeight(self.leftView.frame)/2;
    self.leftView.layer.masksToBounds = YES;
    
    self.pointView.layer.cornerRadius = CGRectGetHeight(self.pointView.frame)/2;
    self.pointView.layer.masksToBounds = YES;

    self.percentLabel.layer.anchorPoint = CGPointMake(0.5, 1);
}

- (UILabel *)percentLabel{
    if (_percentLabel == nil) {
        self.percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, - 2 * HEIGHT * 2/3, HEIGHT * 3, HEIGHT * 2)];
        _percentLabel.backgroundColor = BLUECOLOR;
        _percentLabel.textAlignment = NSTextAlignmentCenter;
        _percentLabel.textColor = [UIColor whiteColor];
        _percentLabel.font = [UIFont systemFontOfSize:CGRectGetHeight(self.frame)];
        
        [self creatPathWithView:_percentLabel];
    }
    return _percentLabel;
}

- (UIView *)backView{
    if (_backView == nil) {
        self.backView = [[UIView alloc] initWithFrame:self.bounds];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIView *)leftView{
    if (_leftView == nil) {
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(BORDER, BORDER, 100, HEIGHT - 2*BORDER)];
        _leftView.backgroundColor = BLUECOLOR;
    }
    return _leftView;
}

- (UIView *)pointView{
    if (_pointView == nil) {
        self.pointView = [[UIView alloc] initWithFrame:CGRectMake((WIDE - 2 * BORDER) * self.progress - (HEIGHT - 2 * BORDER) /2 - SIDE, BORDER - SIDE, HEIGHT - 2 * (BORDER - SIDE), HEIGHT - 2 * (BORDER - SIDE))];
        _pointView.backgroundColor = BLUECOLOR;
    }
    return _pointView;
}

- (void)creatPathWithView:(UIView *)pathView{
    CGFloat viewWidth = CGRectGetWidth(pathView.frame);
    CGFloat viewHeight = CGRectGetHeight(pathView.frame) - CORNERSPACE;
    CAShapeLayer *signLayer = [CAShapeLayer layer];
    UIBezierPath *signPath = [UIBezierPath bezierPath];
    [signPath moveToPoint:CGPointMake(0, CORNERSPACE)];
    [signPath addLineToPoint:CGPointMake(viewWidth, CORNERSPACE)];
    [signPath addLineToPoint:CGPointMake(viewWidth, viewHeight)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2 + CORNERSPACE, viewHeight)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2, viewHeight + CORNERSPACE)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2 - CORNERSPACE, viewHeight)];
    [signPath addLineToPoint:CGPointMake(0, viewHeight)];
    [signPath closePath];
    signLayer.path = signPath.CGPath;
    pathView.layer.mask = signLayer;
}

- (void)setProgress:(CGFloat)progress{
    if (_progress != progress) {
        _progress = progress;
    }
    self.leftView.frame = CGRectMake(BORDER, BORDER, (WIDE - 2 * BORDER) * progress, HEIGHT - 2*BORDER);
    self.pointView.frame = CGRectMake((WIDE - 2 * BORDER) * progress - (HEIGHT - 2 * BORDER) /2 - SIDE, BORDER - SIDE, HEIGHT - 2 * (BORDER - SIDE), HEIGHT - 2 * (BORDER - SIDE));
    self.percentLabel.frame = CGRectMake((WIDE - 2 * BORDER) * progress - HEIGHT * 3/2, - 2 * HEIGHT * 2/3, HEIGHT * 3, HEIGHT * 2);
//    CGFloat percent = progress * 100;
//    self.percentLabel.text = [NSString stringWithFormat:@"%.f%%",percent];
}

- (void)setAnimation:(BOOL)animation{
    if (_animation != animation) {
        _animation = animation;
    }
    if (animation) {
        self.leftView.frame = CGRectMake(BORDER, BORDER, 0, HEIGHT - 2*BORDER);
        self.pointView.frame = CGRectMake(0, BORDER - SIDE, HEIGHT - 2 * (BORDER - SIDE), HEIGHT - 2 * (BORDER - SIDE));
//        self.percentLabel.transform = CGAffineTransformMakeRotation(-M_PI_4/4);

        self.percentLabel.frame = CGRectMake(BORDER - HEIGHT * 3/2, - 2 * HEIGHT * 2/3, HEIGHT * 3, HEIGHT * 2);
        [UIView animateWithDuration:DURATION delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.leftView.frame = CGRectMake(BORDER, BORDER, (WIDE - 2 * BORDER) * self.progress, HEIGHT - 2*BORDER);
            self.pointView.frame = CGRectMake((WIDE - 2 * BORDER) * self.progress - (HEIGHT - 2 * BORDER) /2 - SIDE, BORDER - SIDE, HEIGHT - 2 * (BORDER - SIDE), HEIGHT - 2 * (BORDER - SIDE));
            self.percentLabel.frame = CGRectMake((WIDE - 2 * BORDER) * self.progress - HEIGHT * 3/2, - 2 * HEIGHT * 2/3, HEIGHT * 3, HEIGHT * 2);
            
        } completion:^(BOOL finished) {
            
        }];
        CGFloat percent = self.progress * 100;
        CGFloat second = DURATION/percent;
        _timer =[NSTimer scheduledTimerWithTimeInterval:second target:self selector:@selector(repeat) userInfo:nil repeats:YES];
    }
}

- (void)repeat{
    CGFloat percent = self.progress * 100;
    if (_count < percent) {
        self.percentLabel.text = [NSString stringWithFormat:@"%d%%",_count];
    }else{
        self.percentLabel.text = [NSString stringWithFormat:@"%.f%%",percent];
        [_timer invalidate];
        _timer = nil;
        _count = 0;
    }
    _count ++;
}

@end
