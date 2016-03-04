//
//  ButtonView.h
//  block
//
//  Created by wujianqiang on 15/10/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^block)(int index);
@interface ButtonView : UIView

@property (nonatomic, copy) block bloc;

- (instancetype)initWithFrame:(CGRect)frame Block:(block)block;

@end
