//
//  ButtonView.m
//  block
//
//  Created by wujianqiang on 15/10/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame Block:(block)block{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat height = frame.size.height;
        CGFloat wide = frame.size.width/3;
        for (int i = 0;  i < 3; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(i * wide, 0, wide, height);
            [button setTitle:@"点击" forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            _bloc = block;
        }
    }
    return self;
}

- (void)buttonTouchUpInside:(UIButton *)button{
    _bloc(button.tag);
}

@end
