//
//  ViewController.m
//  delegate
//
//  Created by wujianqiang on 16/1/5.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()<BViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic ,strong) BViewController *bVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.bVC = [[BViewController alloc] init];
    self.bVC.delegate = self;
}

- (void)getText:(NSString *)text{
    self.textLabel.text = text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButtonAction:(id)sender {
    [self.navigationController pushViewController:self.bVC animated:YES];
    
}
@end
