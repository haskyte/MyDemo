//
//  BViewController.m
//  block回调
//
//  Created by wujianqiang on 16/1/5.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@property (nonatomic, strong) UITextField *textFlied;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.textFlied = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 21)];
    self.textFlied.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textFlied];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10, 300, 300, 30);
    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"先输入文字再点击我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (instancetype)initTextBlock:(TextBlock)textblock{
    self = [super init];
    if (self) {
        
        self.textBlock = textblock;
    }
    return self;
}

- (void)buttonaction:(UIButton *)button{
    self.textBlock(self.textFlied.text);
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
