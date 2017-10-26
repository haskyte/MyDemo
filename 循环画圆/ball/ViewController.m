//
//  ViewController.m
//  ball
//
//  Created by wujianqiang on 2016/11/17.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "RepeatView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 100, 400, 200, 200) Progress:0.5];
    [self.view addSubview:circleView];
    
    RepeatView *repeatView = [[RepeatView alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 100, 200, 200, 200)];
    [self.view addSubview:repeatView];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
