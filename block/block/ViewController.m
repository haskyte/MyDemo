//
//  ViewController.m
//  block
//
//  Created by wujianqiang on 15/10/16.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "ButtonView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lantinghe;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ButtonView *view = [[ButtonView alloc] initWithFrame:CGRectMake(100, 200, 300, 50) Block:^(int index) {
        NSLog(@"%d",index);
    }];
    [self.view addSubview:view];
    
    NSArray *familyNames = [UIFont familyNames];
    for(NSString *familyName in familyNames)
    {
        NSLog(@"%@", familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames)
        {
            NSLog(@"\t%@", fontName);
        }
    }
    
    self.lantinghe.font = [UIFont fontWithName:@"Lantinghei" size:16];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
