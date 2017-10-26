//
//  NextViewController.m
//  通知
//
//  Created by wujianqiang on 16/5/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"
@interface NextViewController ()<ViewControllerDelegate>

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"add" object:nil];
    
    ViewController *virwC = [[ViewController alloc] init];
    virwC.delegate = self;
    NSLog(@"%@",virwC.delegate);
}

- (void)postUserInfo:(NSString *)userinfo{
    
    
    NSLog(@"%@",userinfo);
}

- (void)receiveMessage:(NSNotification *)notification{
    NSLog(@"1");
    if ([notification.name isEqualToString:@"add"]) {
        NSLog(@"%@",notification.userInfo);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
