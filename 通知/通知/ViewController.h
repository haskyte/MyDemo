//
//  ViewController.h
//  通知
//
//  Created by wujianqiang on 16/5/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ViewControllerDelegate <NSObject>

- (void)postUserInfo:(NSString *)userinfo;

@end

@interface ViewController : UIViewController


@property (nonatomic,weak) id<ViewControllerDelegate>delegate;

@end

