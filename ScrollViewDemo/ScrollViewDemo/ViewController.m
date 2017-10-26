//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by wujianqiang on 16/8/1.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic)  CGFloat offset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame)*3, CGRectGetHeight(_scrollView.frame));
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.tag = 1;
        _scrollView.delegate = self;
        
        for (int i = 0; i < 3; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-200)];
            imageView.image = [UIImage imageNamed:@"backimage"];
            
            UIScrollView *imageZoom = [[UIScrollView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
            imageZoom.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
            imageZoom.tag = 2;
            imageZoom.delegate = self;
            imageZoom.minimumZoomScale = 1.0;
            imageZoom.maximumZoomScale = 3.0;
            imageZoom.layer.anchorPoint = CGPointMake(0.5, 0.5);
            [imageZoom addSubview:imageView];
            [_scrollView addSubview:imageZoom];
        }
    }
    return _scrollView;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    if (scrollView.tag == 2) {
        for (UIImageView *imageView in scrollView.subviews) {
            return imageView;
        }
        return nil;
    }
    return nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        if (self.offset != scrollView.contentOffset.x) {
            for (UIScrollView *iamgeZoom in scrollView.subviews) {
                [UIView animateWithDuration:0.3 animations:^{
                    iamgeZoom.zoomScale = 1.0;
                }];
            }
            self.offset = scrollView.contentOffset.x;
        }
    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if (scrollView.tag == 2) {
        for (UIView *view in scrollView.subviews) {
            view.center = [self centerOfScrollViewContent:scrollView];
        }
    }
}

- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}

@end
