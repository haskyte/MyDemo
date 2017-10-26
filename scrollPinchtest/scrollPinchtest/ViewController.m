//
//  ViewController.m
//  scrollPinchtest
//
//  Created by wujianqiang on 16/8/1.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "ImageScroll.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    backImage.image = [UIImage imageNamed:@"backimage"];
    
    ImageScroll *imageScroll = [[ImageScroll alloc] initWithFrame:self.view.bounds image:backImage];
    [self.view addSubview:imageScroll];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
