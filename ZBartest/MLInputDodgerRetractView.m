//
//  MLInputDodgerRetractView.m
//  MLInputDodger
//
//  Created by molon on 15/7/28.
//  Copyright (c) 2015年 molon. All rights reserved.
//

#import "MLInputDodgerRetractView.h"

@interface MLInputDodgerRetractView()

@end

@implementation MLInputDodgerRetractView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

#pragma mark - event
- (void)retract
{
    if (self.didClickRetractButtonBlock) {
        self.didClickRetractButtonBlock();
    }
}

#pragma mark - layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    static CGFloat buttonWidth = 35.0f;
//    self.button.frame = CGRectMake(CGRectGetWidth(self.frame)-buttonWidth, 0, buttonWidth, CGRectGetHeight(self.frame));
}

#pragma mark - penetrable

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL result = [super pointInside:point withEvent:event];
    
//    if (result) {
//        //penetrable except button
//        if (!CGRectContainsPoint(self.button.frame, point)) {
//            return NO;
//        }
//    }
    
    return result;
}
@end
