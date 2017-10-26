//
//  ViewController.m
//  遍历
//
//  Created by wujianqiang on 2016/11/22.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    NSArray *array = @[@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f",@"a",@"b",@"c",@"d",@"e",@"f"];
    
    dispatch_async(queue1, ^{
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@    -----  ",array[idx]);
        }];
    });
    dispatch_async(queue1, ^{
        dispatch_apply(array.count, queue, ^(size_t index) {
            NSLog(@"%@",array[index]);
        });
    });
    
    dispatch_async(queue1, ^{
        for (NSString * str in array) {
            NSLog(@"%@     +++++++++ ",str);
        }
    
    });


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
