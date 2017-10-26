//
//  UIView+VsualFormat.h
//  VsualFormat
//
//  Created by wujianqiang on 2017/2/9.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VsualFormat)


/**
 vfl

 @param format vfl
 @param views views
 */
- (void)addConstrainsWithVisualFormat:(NSString *)format
                                Views:(NSArray <UIView *>*)views;



/**
 view1 的 attr1 在 view2 的 attr2 * multoplier 再便宜 c 的位置上

 @param view1 view1
 @param attr1 view的某个属性
 @param relation view1 和 view2的关系
 @param view2 view2
 @param attr2 view2的某个属性
 @param multiplier view2的某个属性的倍数
 @param c 偏移量
 */
- (void)addConstraintWithSetView:(id)view1
                       attribute:(NSLayoutAttribute)attr1
                       relatedBy:(NSLayoutRelation)relation
                          toItem:(id)view2
                       attribute:(NSLayoutAttribute)attr2
                      multiplier:(CGFloat)multiplier
                        constant:(CGFloat)c;

- (void)addConstraintWithSetView:(id)view1
            CenterXisEquelToItem:(id)view2
                        constant:(CGFloat)c;


- (void)addConstraintWithSetView:(id)view1
            CenterYisEquelToItem:(id)view2
                        constant:(CGFloat)c;

@end
