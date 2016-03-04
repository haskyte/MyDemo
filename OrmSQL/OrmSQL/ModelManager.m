//
//  ModelManager.m
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ModelManager.h"
#import <LKDBHelper.h>
#import "UsingLKDBhelper.h"
#import "Model.h"

@interface ModelManager ()

@property (nonatomic, strong) LKDBHelper *dbHelper;

@end
@implementation ModelManager


+ (instancetype)getManager{
    static ModelManager *modelManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelManager = [[ModelManager alloc] init];
        modelManager.dbHelper = [UsingLKDBhelper getUsingLKDBHelper];
    });
    return modelManager;
}

- (void)insertModelToDB:(Model *)model{
    if (model != nil) {
        [model saveToDB];
    }
}

- (NSArray *)selectModels{
    //查询   search
    NSMutableArray* data = nil;
    data = [_dbHelper searchWithSQL:@"select * from @t" toClass:[Model class]];
    return data;
}

// 删除
- (void)deleteModelToDB:(Model *)model{
    if (model != nil) {
        [model deleteToDB];
    }
}

@end
