//
//  ViewController.m
//  MostColor
//
//  Created by wujianqiang on 16/10/11.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UIImage *CGImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.CGImage = [UIImage imageNamed:@"backimage"];
    
//    self.view.backgroundColor = [self mostColor];
    
    
    UIImageView *backimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 100, 200)];
    backimage.image = self.CGImage;
    [self.view addSubview:backimage];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 64)];
    view.backgroundColor = [self mostColor];
    [self.view addSubview:view];
    
    UIImage * img = [UIImage imageNamed:@"backimage"];
    //转化为位图
    CGImageRef temImg = img.CGImage;
    //根据范围截图
    temImg=CGImageCreateWithImageInRect(temImg, CGRectMake(100, 100, 100, 100));
    //得到新的图片
    UIImage *new = [UIImage imageWithCGImage:temImg];
    //释放位图对象
    
    UIImageView *newImage = [[UIImageView alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    newImage.image = new;
    
    [self.view addSubview:newImage];
    
    CGImageRelease(temImg);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


static void RGBtoHSV( float r, float g, float b, float *h, double *s, double *v )
{
    float min, max, delta;
    min = MIN( r, MIN( g, b ));
    max = MAX( r, MAX( g, b ));
    *v = max;               // v
    delta = max - min;
    if( max != 0 )
        *s = delta / max;       // s
    else {
        // r = g = b = 0        // s = 0, v is undefined
        *s = 0;
        *h = -1;
        return;
    }
    if( r == max )
        *h = ( g - b ) / delta;     // between yellow & magenta
    else if( g == max )
        *h = 2 + ( b - r ) / delta; // between cyan & yellow
    else
        *h = 4 + ( r - g ) / delta; // between magenta & cyan
    *h *= 60;               // degrees
    if( *h < 0 )
        *h += 360;
}

-(UIColor*)mostColor{
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(40, 40);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, self.CGImage.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    NSArray *MaxColor=nil;
    // NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    float maxScore=0;
    for (int x=0; x<thumbSize.width*thumbSize.height; x++) {
        
        
        int offset = 4*x;
        
        int red = data[offset];
        int green = data[offset+1];
        int blue = data[offset+2];
        int alpha =  data[offset+3];
        
        if (alpha<25)continue;
        
        float h,s,v;
        RGBtoHSV(red, green, blue, &h, &s, &v);
        
        float y = MIN(abs(red*2104+green*4130+blue*802+4096+131072)>>13, 235);
        y= (y-16)/(235-16);
        if (y>0.9) continue;
        
        float score = (s+0.1)*x;
        if (score>maxScore) {
            maxScore = score;
        }
        MaxColor=@[@(red),@(green),@(blue),@(alpha)];
        //[cls addObject:clr];
        
        
        
    }
    CGContextRelease(context);
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

@end
