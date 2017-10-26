//
//  PhotoCollectionViewCell.m
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "UIView+VsualFormat.h"

@interface PhotoCollectionViewCell ()
@property (nonatomic, strong) UIImageView *photoImage;



@end

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.photoImage];
        [self.contentView addSubview:self.coverImage];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

- (void)updateConstraints{
    [super updateConstraints];
    
    [self.contentView addConstrainsWithVisualFormat:@"V:|[v0]|" Views:@[self.photoImage]];
    [self.contentView addConstrainsWithVisualFormat:@"H:|[v0]|" Views:@[self.photoImage]];
    [self.contentView addConstrainsWithVisualFormat:@"V:|[v0]|" Views:@[self.coverImage]];
    [self.contentView addConstrainsWithVisualFormat:@"H:|[v0]|" Views:@[self.coverImage]];

}



- (UIImageView *)photoImage{
    if (!_photoImage) {
        self.photoImage = [[UIImageView alloc] init];
        _photoImage.contentMode = UIViewContentModeScaleAspectFill;
        _photoImage.layer.masksToBounds = YES;
    }
    return _photoImage;
}

- (UIImageView *)coverImage{
    if (!_coverImage) {
        self.coverImage = [[UIImageView alloc] init];
        _coverImage.image = [UIImage imageNamed:@"coverImage"];
        _coverImage.layer.masksToBounds = YES;
        _coverImage.hidden = true;
    }
    return _coverImage;
}



- (void)setHeadImageAsset:(PHAsset *)headImageAsset{
    _headImageAsset = headImageAsset;
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    [[PHImageManager defaultManager] requestImageForAsset:headImageAsset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.photoImage.image = result;
    }];

}


@end
