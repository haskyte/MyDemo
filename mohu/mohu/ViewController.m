//
//  ViewController.m
//  mohu
//
//  Created by wujianqiang on 15/12/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Shadow.h"
#import <FXBlurView.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}
- (IBAction)iOS8blurAction:(id)sender {
  
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
