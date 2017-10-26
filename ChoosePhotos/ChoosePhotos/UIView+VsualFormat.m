//
//  UIView+VsualFormat.m
//  VsualFormat
//
//  Created by wujianqiang on 2017/2/9.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "UIView+VsualFormat.h"

@implementation UIView (VsualFormat)

- (void)addConstrainsWithVisualFormat:(NSString *)format Views:(NSArray<UIView *> *)views{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = [NSString stringWithFormat:@"v%lu",(unsigned long)idx];
        obj.translatesAutoresizingMaskIntoConstraints = false;
        [dic setValue:obj forKey:key];
    }];
    [self addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:format
                          options:0
                          metrics:nil
                          views:dic]];
}

- (void)addConstraintWithSetView:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:view1
                         attribute:attr1
                         relatedBy:relation
                         toItem:view2
                         attribute:attr2
                         multiplier:multiplier
                         constant:c]];
}


- (void)addConstraintWithSetView:(id)view1 CenterXisEquelToItem:(id)view2 constant:(CGFloat)c{
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:view1
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:view2
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:c]];
}

- (void)addConstraintWithSetView:(id)view1 CenterYisEquelToItem:(id)view2 constant:(CGFloat)c{
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:view1
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:view2
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1
                         constant:c]];
}

@end
