//
//  RootViewController.m
//  turnButton
//
//  Created by wujianqiang on 16/2/23.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "WMHamburgerButton.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)creatButton{
    WMHamburgerButton *rightHamburger = [[WMHamburgerButton alloc] initWithFrame:CGRectMake(0, 0, 17, 15)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightHamburger];
    [rightHamburger addTarget:self action:@selector(itemaction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)itemaction:(WMHamburgerButton *)item{
    if (item.selected == YES) {
        NSLog(@"1");
    }else{
        NSLog(@"2");
    }
}

- (void)buttonaction:(UIButton *)button{
    if (button.selected == NO) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            button.transform = CGAffineTransformMakeRotation(M_PI_4);
//            [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        } completion:nil];
        button.selected = YES;
    }else{
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            button.transform = CGAffineTransformMakeRotation(-M_PI_2);
//            [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        } completion:nil];
        button.selected = NO;
    }
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
