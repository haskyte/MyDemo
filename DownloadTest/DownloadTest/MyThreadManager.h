//
//  MyThreadManager.h
//  WuJieSales
//
//  Created by Hu Bin on 15/10/15.
//  Copyright © 2015年 Hu Bin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyThreadManager : NSObject
@property (nonatomic, strong) NSOperationQueue *operationQueue;

+ (id)getManager;

- (void) loadDataWithBlock:(void(^)(void)) loadDataBlock doMainBlock:(void(^)(void)) mainBlock;

@end
