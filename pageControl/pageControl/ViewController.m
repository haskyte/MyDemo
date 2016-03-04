//
//  ViewController.m
//  pageControl
//
//  Created by wujianqiang on 15/12/24.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "TAPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    TAPageControl *page = [[TAPageControl alloc] initWithFrame:CGRectMake(0, 100, 1024, 50)];
    page.numberOfPages = 3;
    page.spacingBetweenDots = 100;
    page.currentDotImage = [UIImage imageNamed:@"YRBtn2"];
    page.dotImage = [UIImage imageNamed:@"YRBtn1"];
    page.dotSize = CGSizeMake(10, 10);
    page.hidesForSinglePage = YES;
    [self.view addSubview:page];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
