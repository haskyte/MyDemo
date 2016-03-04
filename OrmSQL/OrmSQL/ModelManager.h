//
//  ModelManager.h
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Model;
@interface ModelManager : NSObject

+ (instancetype)getManager;

- (void)insertModelToDB:(Model *)model;

- (NSArray *)selectModels;

@end
