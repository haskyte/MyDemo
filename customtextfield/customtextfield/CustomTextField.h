//
//  CustomTextField.h
//  ProductDetail
//
//  Created by wujianqiang on 16/10/18.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextField : UITextField

- (instancetype)initWithFrame:(CGRect)frame
                PlaceHoldFont:(CGFloat)placeholdfont
               PlaceHoldColor:(UIColor *)placeholdcolor;

@end
