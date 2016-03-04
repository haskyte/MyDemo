//
//  BViewController.h
//  block回调
//
//  Created by wujianqiang on 16/1/5.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^TextBlock)(NSString *text);

@interface BViewController : UIViewController

@property (nonatomic, copy) TextBlock textBlock;

- (instancetype)initTextBlock:(TextBlock)textblock;

@end
