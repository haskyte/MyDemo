//
//  RedView.m
//  rac
//
//  Created by wujianqiang on 2017/1/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "RedView.h"
#import <ReactiveCocoa.h>
@implementation RedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.blackButton];
        [self addSubview:self.textField];
    }
    return self;
}

- (UIButton *)blackButton{
    if (_blackButton == nil) {
        self.blackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _blackButton.backgroundColor = [UIColor blackColor];
        _blackButton.frame = CGRectMake(10, 10, 30, 30);
        
        [[_blackButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            
        }];
    }
    return _blackButton;
}

- (UITextField *)textField{
    if (!_textField) {
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 100, 30)];
        
    }
    return _textField;
}


@end
