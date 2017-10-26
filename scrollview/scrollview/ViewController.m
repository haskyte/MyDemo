//
//  ViewController.m
//  scrollview
//
//  Created by wujianqiang on 2016/12/8.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "iCarousel.h"

#define kScreenWide [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kImageWide kScreenWide/5
#define kImageHeight 30

@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) iCarousel *carousel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 100, kScreenWide, kImageHeight)];
    self.carousel.type = iCarouselTypeLinear;
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    [self.view addSubview:self.carousel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return 12;
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kImageWide, kImageHeight)];
    imageview.image = [UIImage imageNamed:@"rule"];
    return imageview;
}


- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value;
    } else if(option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{

    NSLog(@"%zd",index);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
}



@end
