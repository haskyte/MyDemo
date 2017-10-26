//
//  AlbumPickerViewController.h
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumDelegate.h"


@interface AlbumPickerViewController : UIViewController


@property (nonatomic, weak) id<AlbumDelegate>albumDelegate;


@end
