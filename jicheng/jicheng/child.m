//
//  child.m
//  jicheng
//
//  Created by wujianqiang on 15/10/26.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "child.h"

@implementation child

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super init];
    if (self) {
        [self printfnum2];
    }
    return self;
}

@end
