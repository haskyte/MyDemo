//
//  ViewController.m
//  uipickerView
//
//  Created by wujianqiang on 15/12/28.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "AddressView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *address;


@property (nonatomic, strong) AddressView *addressView;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.addressView = [[AddressView alloc] init];
    self.address.inputView = self.addressView;
    self.address.inputAccessoryView = self.toolBar;
}


- (UIToolbar *)toolBar{
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _toolBar.barTintColor=[UIColor brownColor];
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
        _toolBar.items = @[item1, item2];
    }
    return _toolBar;
}

- (void)click{
    if (_address.isFirstResponder) {
        [_address resignFirstResponder];
        self.address.text = [NSString stringWithFormat:@"%@%@%@",self.addressView.province,self.addressView.city,self.addressView.area];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.


@end
