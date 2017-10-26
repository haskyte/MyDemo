//
//  CustomTextField.m
//  ProductDetail
//
//  Created by wujianqiang on 16/10/18.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "CustomTextField.h"

@interface CustomTextField ()

@property (nonatomic, assign) CGFloat placeHoldFont;
@property (nonatomic, strong) UIColor *placeHoldColor;
@end

@implementation CustomTextField

- (instancetype)initWithFrame:(CGRect)frame PlaceHoldFont:(CGFloat)placeholdfont PlaceHoldColor:(UIColor *)placeholdcolor{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeHoldFont = placeholdfont;
        self.placeHoldColor = placeholdcolor;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//控制清除按钮的位置

//-(CGRect)clearButtonRectForBounds:(CGRect)bounds{
//return CGRectMake(bounds.origin.x + bounds.size.width - 50, bounds.origin.y + bounds.size.height -20, 16, 16);
//}

//控制placeHolder的位置，左右缩10
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, 10, 0);
//    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y+5, bounds.size.width -10, bounds.size.height);
//    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, 10, 0);
//    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y + 5, bounds.size.width -10, bounds.size.height);
//    return inset;
    
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset( bounds, 10 , 0 );
//    CGRect inset = CGRectMake(self.bounds.origin.x+10, (self.bounds.size.height- self.font.pointSize)/2, self.bounds.size.width, self.font.pointSize);
//    return inset;
}
//控制左视图位置
//- (CGRect)leftViewRectForBounds:(CGRect)bounds{
//    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width-250, bounds.size.height);
//    return inset;
//    //return CGRectInset(bounds,50,0);
//}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect{
    CGRect placeholderRect = CGRectMake(rect.origin.x, (self.bounds.size.height- self.placeHoldFont)/2-2, rect.size.width, self.placeHoldFont+4);//设置距离
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    style.alignment = self.textAlignment;
    NSDictionary *attr = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, [UIFont systemFontOfSize:self.placeHoldFont], NSFontAttributeName, self.placeHoldColor, NSForegroundColorAttributeName, nil];
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}

@end
