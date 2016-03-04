//
//  ViewController.h
//  Test
//
//  Created by 刘俊臣 on 15/7/27.
//  Copyright (c) 2015年 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>
//声明协议
@protocol ViewControllerDelegate <NSObject>
- (void)sayHi;
@optional
- (void)sayHello;
@end

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//在ARC下使用weak
//在MRC下使用assign
@property (nonatomic, weak)id<ViewControllerDelegate>  delegate;

@end

