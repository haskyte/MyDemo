//
//  ViewController.m
//  登录测试
//
//  Created by Hu Bin on 15/7/3.
//  Copyright (c) 2015年 Hu Bin. All rights reserved.
//

#import "ViewController.h"
#import "UserViewController.h"

@interface ViewController ()
{
    NSString *userName;
    NSString *pass;
    NSString *sonCompany;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *logoImage = [UIImage imageNamed:@"logo.jpg"];
    [_logo initWithImage:logoImage];
    userName = @"";
    pass = @"";
    sonCompany = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textFieldAction:(UITextField *)sender {
    switch ([sender tag]) {
        case 1001:
            userName = [sender text];
            break;
        case 1002:
            pass = [sender text];
            break;
        case 1003:
            sonCompany = [sender text];
            break;
        default:
            userName = @"";
            pass = @"";
            sonCompany = @"";
            break;
    }
}

- (IBAction)alert:(UIButton *)sender {
    if ([userName isEqualToString:@"user"] && [pass isEqualToString:@"pass"]) {
        UserViewController *userView = [[UserViewController alloc] init];
        [self presentViewController:userView animated:YES completion:^{
            
        }];
    }else {
        NSLog(@"登录失败，username = %@, pass= %@",userName,pass);
    }
}
@end
