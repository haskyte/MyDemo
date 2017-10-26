//
//  FirstViewController.m
//  rac
//
//  Created by wujianqiang on 2017/1/19.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "UIView+VsualFormat.h"
#import "FirstViewController.h"
@interface FirstViewController ()
@property (strong, nonatomic) UILabel *label1;

@property (strong, nonatomic) UITextField *textfield;
@property (strong, nonatomic) UIButton *backButton;

@property (nonatomic, copy) __block NSString *input;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    

//    @weakify(self);

    [[self.backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {

//        @strongify(self);
        NSInteger index = 10;
        if (self.touchSignal) {
            [self.touchSignal sendNext:@(index)];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
    [self setUpViews];
    
}

- (void)setUpViews{
    [self.view addSubview:self.backButton];
    
    [self updateViewConstraints];
    [self updateFocusIfNeeded];

}

- (void)updateViewConstraints{
    
    [self.view addConstrainsWithVisualFormat:@"H:|-20-[v0]-20-|" Views:@[self.backButton]];
    [self.view addConstrainsWithVisualFormat:@"V:[v0(==30)]" Views:@[self.backButton]];
    [self.view addConstraintWithSetView:self.backButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

    [super updateViewConstraints];
    
}

- (UIButton *)backButton{
    if (!_backButton) {
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setTitle:@"BACK•BACK" forState:UIControlStateNormal];
        _backButton.backgroundColor = [UIColor yellowColor];
        [_backButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    return _backButton;
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
