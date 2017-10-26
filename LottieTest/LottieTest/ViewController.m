//
//  ViewController.m
//  LottieTest
//
//  Created by wujianqiang on 2017/5/8.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) LOTAnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.animationView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  Bodymovin 插件  aep转json
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.animationView.hidden = YES;
//        [self creataView];
//    });
    
}

- (void)creataView{
    
//    UIView *topvIEW= [[UIView alloc] initWithFrame:CGRectMake(0, -300, 414, 300)];
//    topvIEW.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:topvIEW];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        topvIEW.frame = CGRectMake(0, 0, 414, 300);
//    }];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 414, 100)];
    label1.text = @"豆蔓理财数据";
    [self.view addSubview:label1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 500, 100, 40);
    [button setTitle:@"pushnext" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushAction:(UIButton *)btn{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:secondVC];
}

- (LOTAnimationView *)animationView{
    if (!_animationView) {
        self.animationView = [LOTAnimationView animationNamed:@"preloader.json"];
        _animationView.frame = CGRectMake(0, 0, 100, 100);
        _animationView.backgroundColor = [UIColor whiteColor];
        _animationView.loopAnimation = YES;
        _animationView.center = self.view.center;
        _animationView.contentMode = UIViewContentModeScaleAspectFill;
        [_animationView play];
    }
    return _animationView;
}


@end
