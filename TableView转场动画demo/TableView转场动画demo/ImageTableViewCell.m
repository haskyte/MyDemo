//
//  ImageTableViewCell.m
//  TableView转场动画demo
//
//  Created by wujianqiang on 16/8/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

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
        
        [self.contentView addSubview:self.photoImage];
        
    }return self;
}

- (UIImageView *)photoImage{
    if (_photoImage == nil) {
        self.photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 80)];
        
    }
    return _photoImage;
}


@end
