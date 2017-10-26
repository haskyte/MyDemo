//
//  YALSunyRefreshControl.m
//  YALSunyPullToRefresh
//
//  Created by Konstantin Safronov on 12/24/14.
//  Copyright (c) 2014 Konstantin Safronov. All rights reserved.
//

#import "YALSunnyRefreshControl.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

static const CGFloat DefaultHeight = 100.f;
static const CGFloat AnimationDuration = 1.f;
static const CGFloat AnimationDamping = 0.4f;
static const CGFloat AnimationVelosity= 0.8f;


@interface YALSunnyRefreshControl ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic,assign) BOOL forbidSunSet;
@property (nonatomic,assign) BOOL isSunRotating;
@property (nonatomic,assign) BOOL forbidContentInsetChanges;

@end

@implementation YALSunnyRefreshControl

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithFrame:(CGRect)frame {
    return [[[YALSunnyRefreshControl internalBundle] loadNibNamed:@"YALSunnyRefreshControl" owner:self options:nil] firstObject];
}

+ (NSBundle *)internalBundle {
    return [NSBundle bundleForClass: [YALSunnyRefreshControl class]];
}

-(void)dealloc {
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)attachToScrollView:(UIScrollView *)scrollView {
    self.scrollView = scrollView;
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self setFrame:CGRectMake(0.f, 0.f, scrollView.frame.size.width, 0.f)];
    [scrollView addSubview:self];
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    [self calculateShift];
}

-(void)calculateShift{
    
    [self setFrame:CGRectMake(0.f,
                              0.f,
                              self.scrollView.frame.size.width,
                              self.scrollView.contentOffset.y)];
    
    if(self.scrollView.contentOffset.y <= -DefaultHeight){
        
        [self scaleItems];
        if(!self.forbidSunSet){
            
            [self rotateSunInfinitely];
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            self.forbidSunSet = YES;
            
        }
    }
    
    if(!self.scrollView.dragging && self.forbidSunSet && self.scrollView.decelerating && !self.forbidContentInsetChanges){
        [self beginRefreshing];
    }
    
    if(!self.forbidSunSet){
        [self setupSunHeightAboveHorisont];
        [self setupSkyPosition];
    }
}

-(void)beginRefreshing {
    
    [self.scrollView setContentInset:UIEdgeInsetsMake(DefaultHeight, 0.f, 0.f, 0.f)];
    [self.scrollView setContentOffset:CGPointMake(0.f, -DefaultHeight) animated:YES];
    self.forbidContentInsetChanges = YES;
}

-(void)endRefreshing{
    
    if(self.scrollView.contentOffset.y > -DefaultHeight){
        
        [self performSelector:@selector(returnToDefaultState) withObject:nil afterDelay:AnimationDuration];
    }else{
        [self returnToDefaultState];
    }
}

-(void)returnToDefaultState{
    
    self.forbidContentInsetChanges = NO;
    [UIView animateWithDuration:AnimationDuration
                          delay:0.f
         usingSpringWithDamping:AnimationDamping
          initialSpringVelocity:AnimationVelosity
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self.scrollView setContentInset:UIEdgeInsetsMake(0, 0.f, 0.f, 0.f)];
                     } completion:nil];
    self.forbidSunSet = NO;
    [self stopSunRotating];
}

-(void)setupSunHeightAboveHorisont{
    
    CGFloat shiftInPercents = [self shiftInPercents];

    NSLog(@"%f",shiftInPercents);
    
}

-(CGFloat)shiftInPercents{
    
    return (DefaultHeight / 100) * -self.scrollView.contentOffset.y;
}

-(void)setupSkyPosition{
    
//    CGFloat shiftInPercents = [self shiftInPercents];
//    CGFloat skyTopConstant = SkyDefaultShift + ((SkyTopShift / 100) * shiftInPercents);

}

-(void)scaleItems{
    
    CGFloat shiftInPercents = [self shiftInPercents];
    CGFloat buildigsScaleRatio = shiftInPercents / 100;
    
}

-(void)rotateSunInfinitely{
    NSLog(@"正在刷新");
}

-(void)stopSunRotating{
    
    self.isSunRotating = NO;
    self.forbidSunSet = NO;

}

@end
