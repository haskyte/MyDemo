//
//  ViewController.m
//  毛玻璃
//
//  Created by wujianqiang on 2017/2/8.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    imageView.image = [UIImage imageNamed:@"backimage"];
    [self.view addSubview:imageView];
    
    //  创建需要的毛玻璃特效类型
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //  毛玻璃view 视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    //添加到要有毛玻璃特效的控件中
    effectView.frame = imageView.bounds;
    [imageView addSubview:effectView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
