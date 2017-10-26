//
//  CustomProgress.h
//  ProgerssTest
//
//  Created by wujianqiang on 16/7/14.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomProgress : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic) CGFloat progress;

@property (nonatomic) BOOL animation;

@end
