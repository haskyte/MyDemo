//
//  AlbumDelegate.h
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/22.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlbumDelegate <NSObject>

- (void)selectImages:(NSArray *)imageArray;

@end
