//
//  ViewController.m
//  customtextfield
//
//  Created by wujianqiang on 2017/1/5.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomTextField *textfield = [[CustomTextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50) PlaceHoldFont:11 PlaceHoldColor:[UIColor greenColor]];
    textfield.backgroundColor = [UIColor grayColor];
    textfield.font = [UIFont systemFontOfSize:15];
    textfield.placeholder = @"输入内容";
    [self.view addSubview:textfield];
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
