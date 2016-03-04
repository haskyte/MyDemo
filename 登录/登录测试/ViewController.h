//
//  ViewController.h
//  登录测试
//
//  Created by Hu Bin on 15/7/3.
//  Copyright (c) 2015年 Hu Bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *resert;
@property (weak, nonatomic) IBOutlet UIButton *repass;
- (IBAction)textFieldAction:(UITextField *)sender;

- (IBAction)alert:(UIButton *)sender;
@end

