//
//  AlbumTableViewCell.m
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "AlbumTableViewCell.h"
#import "UIView+VsualFormat.h"
#import "AlbumModel.h"
#import <Photos/Photos.h>

@interface AlbumTableViewCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation AlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.titleLabel];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

- (void)updateConstraints{
    [super updateConstraints];
    
    [self.contentView addConstrainsWithVisualFormat:@"H:|-10-[v0(==80)]-10-[v1]|" Views:@[self.headImage,self.titleLabel]];
    [self.contentView addConstrainsWithVisualFormat:@"V:|-10-[v0]-10-|" Views:@[self.headImage]];
    [self.contentView addConstrainsWithVisualFormat:@"V:|-10-[v0]-10-|" Views:@[self.titleLabel]];
}

- (UIImageView *)headImage{
    if (!_headImage) {
        self.headImage = [[UIImageView alloc] init];
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        _headImage.layer.masksToBounds = YES;
    }
    return _headImage;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (void)setAlbumModel:(AlbumModel *)albumModel{
    _albumModel = albumModel;
    
    
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    
    [[PHImageManager defaultManager] requestImageForAsset:albumModel.headImageAsset targetSize:CGSizeMake(240, 240) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.headImage.image = result;
    }];
    self.titleLabel.text = [NSString stringWithFormat:@"%@(%ld)",albumModel.title,(long)albumModel.count];
    
}



@end
