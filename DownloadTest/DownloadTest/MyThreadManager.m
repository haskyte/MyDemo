//
//  MyThreadManager.m
//  WuJieSales
//
//  Created by Hu Bin on 15/10/15.
//  Copyright © 2015年 Hu Bin. All rights reserved.
//

#import "MyThreadManager.h"
#import "AppDelegate.h"

@implementation MyThreadManager

+ (id)getManager
{
    static MyThreadManager *manager;
    if (manager == nil) {
        manager = [[MyThreadManager alloc] init];
        manager.operationQueue = [[NSOperationQueue alloc] init];
        manager.operationQueue.maxConcurrentOperationCount=5;
    }
    return manager;
}

- (void)loadDataWithBlock:(void (^)(void))loadDataBlock doMainBlock:(void (^)(void))mainBlock
{
    [self.operationQueue addOperationWithBlock:^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        loadDataBlock();
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            mainBlock();
        }];
    }];
}

@end
