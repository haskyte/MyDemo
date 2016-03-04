//
//  ViewController.m
//  uislider
//
//  Created by wujianqiang on 15/10/9.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //左右轨的图片
    UIImage *stetchLeftTrack= [UIImage imageNamed:@"progress@2x"];
    UIImage *stetchRightTrack = [UIImage imageNamed:@"progress@2x"];
    //滑块图片
    UIImage *thumbImage = [UIImage imageNamed:@"button_slider@2x"];
    
    UISlider *sliderA=[[UISlider alloc]initWithFrame:CGRectMake(30, 320, 257, 7)];
    sliderA.backgroundColor = [UIColor clearColor];
    sliderA.value=1.0;
    sliderA.minimumValue=0.7;
    sliderA.maximumValue=1.0;
    
    [sliderA setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
    [sliderA setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
    //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
    [sliderA setThumbImage:thumbImage forState:UIControlStateHighlighted];
    [sliderA setThumbImage:thumbImage forState:UIControlStateNormal];
    //滑块拖动时的事件
    [sliderA addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    //滑动拖动后的事件
    [sliderA addTarget:self action:@selector(sliderDragUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:sliderA];
    
}

- (void)sliderValueChanged:(UISlider *)slider{
    
    
}

- (void)sliderDragUp:(UISlider *)slider{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
