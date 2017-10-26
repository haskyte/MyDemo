//
//  ImageScroll.m
//  scrollPinchtest
//
//  Created by wujianqiang on 16/8/1.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ImageScroll.h"

@interface ImageScroll ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation ImageScroll

- (instancetype)initWithFrame:(CGRect)frame image:(UIImageView *)image{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.imageView = image;
        self.imageView.userInteractionEnabled = YES;
        self.imageView.frame = CGRectMake(0, (self.frame.size.height - image.frame.size.height)/2.0, image.frame.size.width, image.frame.size.height);
        
        UIPinchGestureRecognizer *pinch  = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
        [self.imageView addGestureRecognizer:pinch];
        
        
        [self addSubview:self.scrollView];
    }
    return self;
}


- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 3.0;
        _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        
        [_scrollView addSubview:self.imageView];
    }
    return _scrollView;
}



- (void)pinchAction:(UIPinchGestureRecognizer *)pinchGesture{
    pinchGesture.view.transform = CGAffineTransformScale(pinchGesture.view.transform, pinchGesture.scale, pinchGesture.scale);
    self.scrollView.zoomScale = pinchGesture.scale;
    
    pinchGesture.scale = 1;
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height = self.scrollView.frame.size.height / scale;
    NSLog(@"zoomRect.size.height is %f",zoomRect.size.height);
    NSLog(@"self.frame.size.height is %f",self.scrollView.frame.size.height);
    zoomRect.size.width  = self.scrollView.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
