//
//  PopAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "PopAnimate.h"

@interface PopAnimate ()

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic) CGRect newRect;

@end


@implementation PopAnimate


- (instancetype)initWithImage:(NSString *)image newRect:(CGRect)newRect{
    self = [super init];
    if (self) {
        self.imageName = image;
        self.newRect = newRect;
    }
    return self;
}

- (void)animateTransitionEvent {
    
    UIImageView *tmpImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
    tmpImageView.image = [UIImage imageNamed:self.imageName];
    
    [self.containerView addSubview:self.toViewController.view];
    [self.containerView addSubview:tmpImageView];
    
    self.toViewController.view.alpha   = 0.f;
    
    [UIView animateWithDuration:self.transitionDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tmpImageView.frame = self.newRect;
                         
                         self.fromViewController.view.alpha = 0.f;
                         self.toViewController.view.alpha   = 1.f;
             
                     } completion:^(BOOL finished) {
             
                         [tmpImageView removeFromSuperview];
                         [self completeTransition];
    
                     }];
}

@end
