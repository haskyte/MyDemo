//
//  UITextField+shake.m
//  LessonAnimation
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "UITextField+shake.h"

@implementation UITextField (shake)

- (void)shake{
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    keyFrame.values = @[@(self.center.x + 20),@(self.center.x),@(self.center.x - 20)];
    keyFrame.repeatCount = 1000000;
    keyFrame.duration = 0.3;
    [self.layer addAnimation:keyFrame forKey:nil];
}


@end
