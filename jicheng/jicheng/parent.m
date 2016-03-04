//
//  parent.m
//  jicheng
//
//  Created by wujianqiang on 15/10/26.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "parent.h"

@implementation parent

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
        [self printfnum1];
        [self printfnum2];
    }
    return self;
}

- (void)printfnum1{
    NSLog(@"1");
}
- (void)printfnum2{
    NSLog(@"2");
}


@end
