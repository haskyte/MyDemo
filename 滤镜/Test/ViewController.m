//
//  ViewController.m
//  Test
//
//  Created by 刘俊臣 on 15/7/27.
//  Copyright (c) 2015年 LJC. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Model.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *outImageView;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, retain)Model *myModel;
@end

@implementation ViewController
//同时重写setter和getter的时候。
@synthesize name = _name;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"111"];
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    //颜色控制
    CIFilter *sepiaFilter = [CIFilter filterWithName:@"CIColorControls"];
    [sepiaFilter setValue:ciImage forKey:kCIInputImageKey];
//
//    //亮度
//    [sepiaFilter setValue:@0.1 forKey:@"inputBrightness"];
//
//    //饱和度
//    [sepiaFilter setValue:@0.5 forKey:@"inputSaturation"];

    //对比度
//    [sepiaFilter setValue:@1 forKey:@"inputContrast"];
    
    CIImage *outPut = [sepiaFilter outputImage];
    
    
    //设置颜色Matrix
    
//    CIFilter *secFielter = [CIFilter  filterWithName:@"CIColorMatrix"];
//    CIVector * alphaVector = [CIVector vectorWithX:50 Y:50 Z:50 W:10];
//    
//    [secFielter setValue:outPut forKey:kCIInputImageKey];
//    
//    [secFielter setValue:alphaVector forKeyPath:@"inputAVector"];
//    
//    CIImage *outPut2 = secFielter.outputImage;
//    
    
    /**
     *  高斯模糊
     */
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:@2 forKey:@"inputRadius"];
    [blurFilter setValue:outPut forKey:kCIInputImageKey];
    CIImage *outPut3 = blurFilter.outputImage;
    
    
    
    self.outImageView.image = [UIImage imageWithCIImage:outPut3 ];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
