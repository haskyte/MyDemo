//
//  ViewController.m
//  block回调
//
//  Created by wujianqiang on 16/1/5.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textlabel;

@property (nonatomic, strong) BViewController *bVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bVC = [[BViewController alloc] initTextBlock:^(NSString *text) {
        self.textlabel.text = text;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextVC:(id)sender {
    [self.navigationController pushViewController:self.bVC animated:YES];
}
@end
