//
//  PhotoViewController.h
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "AlbumDelegate.h"


@interface PhotoViewController : UIViewController

@property (nonatomic, strong) NSArray <PHAsset *> *assetArray; //通过该属性获取该相册集下所有照片

@property (nonatomic, weak) id<AlbumDelegate>albumDelegate;


@end
