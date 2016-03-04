//
//  BViewController.h
//  delegate
//
//  Created by wujianqiang on 16/1/5.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BViewControllerDelegate <NSObject>

- (void)getText:(NSString *)text;

@end

@interface BViewController : UIViewController

@property (nonatomic, weak) id<BViewControllerDelegate>delegate;

@end
