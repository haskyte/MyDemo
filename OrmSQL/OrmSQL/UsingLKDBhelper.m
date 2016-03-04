//
//  UsingLKDBhelper.m
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "UsingLKDBhelper.h"
#import <LKDBHelper.h>
@implementation UsingLKDBhelper


+ (LKDBHelper *)getUsingLKDBHelper{
    static LKDBHelper *db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [[LKDBHelper alloc] init];
    });
    return db;
}

@end
