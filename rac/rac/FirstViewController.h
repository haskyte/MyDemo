//
//  FirstViewController.h
//  rac
//
//  Created by wujianqiang on 2017/1/19.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ReactiveCocoa/ReactiveCocoa.h>


@interface FirstViewController : UIViewController

@property (nonatomic, strong) RACSubject *touchSignal;



@end
