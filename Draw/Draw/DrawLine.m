//
//  DrawLine.m
//  Draw
//
//  Created by wujianqiang on 2017/2/8.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

// 系统自动调动，视图显示在屏幕上的时候调用一次
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    drawlineline();
    
    drawSquare();
    
    drawTriangle();
}

// 矩形
void drawSquare(){
    // 1. 获得图形山下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制四边形
    CGContextAddRect(context, CGRectMake(10, 10, 120, 180));
    // 设置颜色
    [[UIColor purpleColor] setFill];
    // 显示在view上
    CGContextFillPath(context);
}

// 不规则图形
void drawTriangle(){
    // 1. 获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 180);
    CGContextAddLineToPoint(context, 30, 140);
    CGContextClosePath(context);
    [[UIColor redColor] set];
    CGContextStrokePath(context);
}



// 画线
void drawlineline(){
    // 1. 获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 绘制图形
    // 设置线段的宽度
    CGContextSetLineWidth(context, 5);
    // 设置颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    // 设置起点
    CGContextMoveToPoint(context, 10, 10);
    // 划线
    CGContextAddLineToPoint(context, 100, 100);
    // 3. 显示到view
    CGContextStrokePath(context);
    
    
    //
    [[UIColor blueColor] set];
    // 设置线条头尾部样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设直线段转折点的样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    // 画线
    CGContextMoveToPoint(context, 100, 120);
    CGContextAddLineToPoint(context, 200, 120);
    CGContextAddLineToPoint(context, 200, 200);
    // 显示到view
    CGContextStrokePath(context);
}























@end
