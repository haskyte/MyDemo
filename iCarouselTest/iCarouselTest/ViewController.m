//
//  ViewController.m
//  iCarouselTest
//
//  Created by wujianqiang on 16/6/20.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "iCarousel.h"

#define kSCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define kRANDCOLOR [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];

@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) iCarousel *iCar;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[@"1",@"2",@"3",@"4"];
    [self.view addSubview:self.iCar];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scroll) userInfo:nil repeats:1];
}

- (void)scroll{
    if (self.iCar.currentItemIndex == self.dataArray.count -1) {
        [self.iCar scrollToItemAtIndex:0 animated:YES];
    }else{
        [self.iCar scrollToItemAtIndex:self.iCar.currentItemIndex+1 animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (iCarousel *)iCar{
    if (_iCar == nil) {
        self.iCar = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0,kSCREENWIDTH , 200)];
        _iCar.dataSource = self;
        _iCar.delegate = self;
        _iCar.type = iCarouselTypeRotary;

    }
    return _iCar;
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [@[] mutableCopy];
    }
    return _dataArray;
}

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{
    return [self.dataArray count];
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view == nil) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, kSCREENWIDTH * 2/3, 160)];
        view.backgroundColor = kRANDCOLOR;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, kSCREENWIDTH/2, 20)];
        label.text = self.dataArray[index];
        label.textAlignment = NSTextAlignmentCenter;
        [self setWithView:view];
        [view addSubview:label];
    }
    return view;
}


- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.iCar.itemWidth);
}

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
//    NSLog(@"%@",carousel);
}
- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.iCar.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

- (IBAction)action:(UIButton *)sender {
    if (self.iCar.type == iCarouselTypeCustom) {
        self.iCar.type = 0;
    }else{
        self.iCar.type += 1;
    }
}

- (void)setWithView:(UIView *)view{
    view.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
    view.layer.shadowOffset = CGSizeMake(5, 5);
    view.layer.shadowRadius = 5;
    view.layer.shadowOpacity = 0.5;
}

@end
