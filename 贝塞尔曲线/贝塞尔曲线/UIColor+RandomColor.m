//
//  UIColor+RandomColor.m
//  贝塞尔曲线
//
//  Created by wujianqiang on 16/6/20.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)RandomColor{
    return [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
}

@end
