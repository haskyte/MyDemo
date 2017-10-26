//
//  ViewController.m
//  uiScrollView
//
//  Created by wujianqiang on 16/5/24.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDE [UIScreen mainScreen].bounds.size.width
#define VIEW_HIGHT 200

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageArray = @[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"]];
    
    [self.view addSubview:self.scrollView];
    
    [self addTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDE, VIEW_HIGHT)];
        
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDE, VIEW_HIGHT * (self.imageArray.count + 1));
        _scrollView.delegate = self;
        
        NSMutableArray *dataArray = [self.imageArray mutableCopy];
        [dataArray addObject:self.imageArray.firstObject];
        
        for (int i = 0; i < dataArray.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:dataArray[i]];
            imageView.frame = CGRectMake(0, VIEW_HIGHT * i, SCREEN_WIDE, VIEW_HIGHT);
            [_scrollView addSubview:imageView];
        }
        
    }
    return _scrollView;
}


// 切换图片

- (void)changeImage{
    if (self.scrollView.contentOffset.y == VIEW_HIGHT * self.imageArray.count) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentOffset.y + VIEW_HIGHT);
    }];
}

// 开启定时器

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
}

// 关闭定时器
- (void)removeTimer{
    [self.timer invalidate];
}

// 开始拖拽的时候

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

// 拖拽结束的时候
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self addTimer];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.y == VIEW_HIGHT * self.imageArray.count) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }else if (self.scrollView.contentOffset.y == 0) {
        self.scrollView.contentOffset = CGPointMake(0, VIEW_HIGHT * self.imageArray.count);
    }
}

@end
