//
//  ViewController.m
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "ModelManager.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveModel:(UIButton *)sender {
    Model *model = [[Model alloc] init];
    model.mid = [NSString stringWithFormat:@"%d",arc4random()%1000];
    model.title = [NSString stringWithFormat:@"小明%@",model.mid];
    model.figure = [NSString stringWithFormat:@"url"];
    [[ModelManager getManager] insertModelToDB:model];
}

@end
