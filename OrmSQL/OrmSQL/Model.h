//
//  Model.h
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *figure;

@end

@interface NSObject(PrintSQL)
+(NSString*)getCreateTableSQL;
@end
