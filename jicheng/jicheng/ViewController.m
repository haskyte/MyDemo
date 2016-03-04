//
//  ViewController.m
//  jicheng
//
//  Created by wujianqiang on 15/10/26.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "parent.h"
#import "child.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    parent *parent1 = [[parent alloc] init];
    [self.view addSubview:parent1];
    
    child *chi = [[child alloc] init];
    [self.view addSubview:chi];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
