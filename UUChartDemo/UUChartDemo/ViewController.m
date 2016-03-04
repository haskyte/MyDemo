//
//  ViewController.m
//  UUChartDemo
//
//  Created by wujianqiang on 15/10/9.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

@interface ViewController ()<UUChartDataSource>

@property (nonatomic, strong) UUChart *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.chartView = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(10, 20, 300, 300) withSource:self withStyle:UUChartBarStyle];
    [self.chartView showInView:self.view];
}

- (NSArray *)UUChart_xLableArray:(UUChart *)chart{
    return [self getXTitles:12];
}

- (NSArray *)UUChart_yValueArray:(UUChart *)chart{
    NSArray *ary4 = @[@"100",@"200",@"300",@"400",@"500",@"600",@"700",@"800",@"900",@"1000",@"1100",@"1200"];
    return @[ary4];
}

- (NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i = 0; i < num; i ++) {
        NSString * str = [NSString stringWithFormat:@"%d月份",i + 1];
        [xTitles addObject:str];
    }
    return xTitles;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
