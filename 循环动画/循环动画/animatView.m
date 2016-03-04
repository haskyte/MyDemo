//
//  animatView.m
//  循环动画
//
//  Created by wujianqiang on 15/12/23.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "animatView.h"
#import "repeatBottonView.h"

@interface animatView ()

@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, strong) NSMutableArray *keyArray;
@property (nonatomic, strong) UIImageView *keyView;

@end

@implementation animatView

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

    }
    return self;
}

- (void)creatRepeatView{
    for (int i = 0; i < 3; i ++) {
        repeatBottonView *repeatView = [[repeatBottonView alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
        repeatView.alpha = 0;
        repeatView.backgroundColor = [UIColor clearColor];
        [self addSubview:repeatView];
        [self.viewArray addObject:repeatView];
        [UIView animateWithDuration:1 delay:i/3.00 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveLinear animations:^{
            CGPoint center = repeatView.center;
            center.y += 140;
            repeatView.center = center;
            repeatView.alpha = 1;
            repeatView.transform = CGAffineTransformMakeScale(1.8, 1.8);
        } completion:nil];
    }
}

- (void)creatKeyView{
    for (int i = 0; i < 2; i ++) {
        UIImageView *keyView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 220, 25, 45)];
        keyView.image = [UIImage imageNamed:@"key@2x"];
        keyView.alpha = 0.5 + i * 0.5;
        [self.keyArray addObject:keyView];
        [self addSubview:keyView];
        keyView.layer.anchorPoint = CGPointMake(0.5, 0.8);
        [UIView animateWithDuration:0.3 delay:0.3 - i * 0.3 options:UIViewAnimationOptionCurveLinear animations:^{
            keyView.transform = CGAffineTransformMakeRotation(-M_PI_4);
        } completion:nil];
        [UIView animateWithDuration:0.6 delay:0.6 - i * 0.3 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
            keyView.transform = CGAffineTransformMakeRotation(M_PI_4);
        } completion:nil];
    }
}

- (void)hiddenAnimation{
    [self.viewArray enumerateObjectsUsingBlock:^(repeatBottonView *repeatView, NSUInteger idx, BOOL * _Nonnull stop) {
        [repeatView removeFromSuperview];
    }];
    [self.keyArray enumerateObjectsUsingBlock:^(UIImageView *keyView, NSUInteger idx, BOOL * _Nonnull stop) {
        [keyView removeFromSuperview];
    }];
    self.keyView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 220, 25, 45)];
    _keyView.image = [UIImage imageNamed:@"key@2x"];
    _keyView.layer.anchorPoint = CGPointMake(0.5, 0.8);
    [self addSubview:_keyView];
}

- (void)showAnimation{
    [self creatRepeatView];
    [self creatKeyView];
    [self.keyView removeFromSuperview];
}


- (NSMutableArray *)viewArray{
    if (!_viewArray) {
        self.viewArray = [@[] mutableCopy];
    }
    return _viewArray;
}

- (NSMutableArray *)keyArray{
    if (!_keyArray) {
        self.keyArray = [@[] mutableCopy];
    }
    return _keyArray;
}

@end
