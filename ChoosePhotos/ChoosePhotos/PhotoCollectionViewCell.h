//
//  PhotoCollectionViewCell.h
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface PhotoCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) PHAsset *headImageAsset; 

@property (nonatomic, strong) UIImageView *coverImage;


@end
