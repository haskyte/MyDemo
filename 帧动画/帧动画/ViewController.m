//
//  ViewController.m
//  帧动画
//
//  Created by wujianqiang on 15/12/25.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//


#import "ViewController.h"
#import "PresentViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *graduallView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:graduallView];
    
    void (^keyFrameBlock)() = ^(){
        // 创建颜色数组
        NSArray *arrayColors = @[[UIColor orangeColor],
                                 [UIColor yellowColor],
                                 [UIColor greenColor],
                                 [UIColor blueColor],
                                 [UIColor purpleColor],
                                 [UIColor redColor]];
        NSUInteger colorCount = [arrayColors count];
        // 循环添加关键帧
        for (NSUInteger i = 0; i < colorCount; i++) {
            [UIView addKeyframeWithRelativeStartTime:i / (CGFloat)colorCount
                                    relativeDuration:1 / (CGFloat)colorCount
                                          animations:^{
                                              [graduallView setBackgroundColor:arrayColors[i]];
                                          }];
        }
    };
    [UIView animateKeyframesWithDuration:1.0
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewAnimationOptionRepeat
                              animations:keyFrameBlock
                              completion:^(BOOL finished) {
                                  // 动画完成后执行
                                  // code...
                              }];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:button];
    PresentViewController *presentVC = [[PresentViewController alloc] init];
    UIPopoverController *poc = [[UIPopoverController alloc] initWithContentViewController:presentVC];
    [poc presentPopoverFromBarButtonItem:bar permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
