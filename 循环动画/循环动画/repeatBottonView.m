//
//  repeatBottonView.m
//  循环动画
//
//  Created by wujianqiang on 15/12/23.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "repeatBottonView.h"

@implementation repeatBottonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(15, 15)];
    [bezierPath addLineToPoint: CGPointMake(30, 0)];
    [bezierPath addLineToPoint: CGPointMake(15, 5)];
    [bezierPath addLineToPoint: CGPointMake(0, 0)];
    [bezierPath addLineToPoint: CGPointMake(15, 15)];
    [bezierPath closePath];
    [color2 setFill];
    [bezierPath fill];
    [color3 setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}

@end
