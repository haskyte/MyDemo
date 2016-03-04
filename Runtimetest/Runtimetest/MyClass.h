//
//  MyClass.h
//  Runtimetest
//
//  Created by wujianqiang on 16/3/2.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;


- (void)method1;

- (void)method2;

+ (void)classMethod1;

@end
