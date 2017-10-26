//
//  ViewController.m
//  截屏测试
//
//  Created by wujianqiang on 16/7/8.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImage.image = [UIImage imageNamed:@"backimage@2x"];
    [self.view addSubview:backImage];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 20)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 130, 200)];
    imageview.image = [self ViewRenderImage];
    
    imageview.layer.borderColor = [UIColor blackColor].CGColor;
    imageview.layer.borderWidth = 2;
    
    [self.view addSubview:imageview];
}

- (UIImage *)ViewRenderImage
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
