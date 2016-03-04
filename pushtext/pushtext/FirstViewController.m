//
//  FirstViewController.m
//  pushtext
//
//  Created by wujianqiang on 16/1/26.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "FirstViewController.h"
#import "NextViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)push:(id)sender {
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
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
