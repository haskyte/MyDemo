//
//  PushAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "PushAnimate.h"

@interface PushAnimate ();

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic) CGRect oldRect;

@end


@implementation PushAnimate

- (instancetype)initWithImage:(NSString *)image OldRect:(CGRect)oldRect{
    self = [super init];
    if (self) {
        self.imageName = image;
        self.oldRect = oldRect;
    }
    return self;
}


- (void)animateTransitionEvent {
    
    UIImageView *tmpImageView  = [[UIImageView alloc] initWithFrame:self.oldRect];
    tmpImageView.image = [UIImage imageNamed:_imageName];
    
    [self.containerView addSubview:self.toViewController.view];
    [self.containerView addSubview:tmpImageView];
    self.containerView.backgroundColor = [UIColor blackColor];
    self.toViewController.view.alpha   = 0.f;
    
    [UIView animateWithDuration:self.transitionDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tmpImageView.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200);
                         
//                         self.fromViewController.view.alpha = 0.f;
//                         self.toViewController.view.alpha   = 1.f;
                         
                     } completion:^(BOOL finished) {
                         
                         [tmpImageView removeFromSuperview];
                         [self completeTransition];
                     }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.transitionDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.fromViewController.view.alpha = 0.f;
        self.toViewController.view.alpha   = 1.f;

    });
}

@end
