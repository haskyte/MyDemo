//
//  UIView+Shadow.m
//  WuJieSales
//
//  Created by wujianqiang on 15/12/7.
//  Copyright © 2015年 Hu Bin. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)

- (void)setShadow{
    self.layer.cornerRadius = 3;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.2;
}

@end
