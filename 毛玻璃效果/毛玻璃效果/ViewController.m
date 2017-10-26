//
//  ViewController.m
//  毛玻璃效果
//
//  Created by User_Name_HJZ on 16/4/25.
//  Copyright © 2016年 User_Name_HJZ_Alex. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView *backimage;//背景图

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.backimage = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImage *sourceImage = [UIImage imageNamed:@"backimage"];
    UIImage *lastImage = [sourceImage applyDarkEffect];//一句代码搞定毛玻璃效果

    
    self.backimage.image = lastImage;
    self.backimage.userInteractionEnabled = YES;
//    self.backimage
    
    [self.view addSubview:self.backimage];
 
    //测试代码
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height / 2, 150, 30);
//    label.textColor = [UIColor whiteColor];
//    label.text = @"发红包请@我";
//    [self.view addSubview:label];
    
    
//    
//    NSInteger widht = self.view.bounds.size.width;
//    NSInteger height = self.view.bounds.size.height;
//    NSLog(@"%ld %ld",(long)widht,(long)height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
