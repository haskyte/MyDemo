//
//  ViewController.m
//  通知
//
//  Created by wujianqiang on 16/5/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dic =@{@"123":@"2222"};

//    [[NSNotificationCenter defaultCenter] postNotificationName:@"add" object:nil userInfo:dic];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextVC:(id)sender {
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}
- (IBAction)buttonaction:(id)sender {
    NSLog(@"12");
    [self.delegate postUserInfo:@"123123123123"];
    NSLog(@"%@",self.delegate);
}




@end
