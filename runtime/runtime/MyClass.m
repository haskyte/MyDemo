//
//  MyClass.m
//  Runtimetest
//
//  Created by wujianqiang on 16/3/2.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "MyClass.h"

@interface MyClass ()

{
    // 实例变量
    NSInteger _instance1;
    NSString *_instance2;
}

@property (nonatomic, assign) NSUInteger integer;

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;

@end


@implementation MyClass


+(void)classMethod1{
    
}

- (void)method1{
    NSLog(@"%s  %d ",__FUNCTION__,__LINE__);
}

- (void)method2{
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2{
    NSLog(@"argument1=%ld \n argument2=%@",arg1,arg2);
}


@end
