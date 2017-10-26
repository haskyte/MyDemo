//
//  ViewController.m
//  gifTest
//
//  Created by wujianqiang on 16/8/16.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>

#import "firstViewController.h"
#import "secondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *gifFilePathUrl = [[NSBundle mainBundle] URLForResource:@"jiazai" withExtension:@"gif"];
//    NSString *gifFilePath = [NSString stringWithContentsOfURL:gifFilePathUrl encoding:NSUTF8StringEncoding error:nil];
    NSData *gifData = [NSData dataWithContentsOfFile: gifFilePathUrl.absoluteString];
    NSLog(@"%@",gifFilePathUrl.absoluteString);
    NSMutableArray *frames = nil;
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)gifData, NULL);
    double total = 0;
    NSTimeInterval gifAnimationDuration;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        if (l > 1){
            frames = [NSMutableArray arrayWithCapacity: l];
            for (size_t i = 0; i < l; i++) {
                CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
                NSDictionary *dict = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(src, 0, NULL));
                if (dict){
                    NSDictionary *tmpdict = [dict objectForKey: @"{GIF}"];
                    total += [[tmpdict objectForKey: @"DelayTime"] doubleValue] * 100;
                }
                if (img) {
                    [frames addObject: [UIImage imageWithCGImage: img]];
                    CGImageRelease(img);
                }
            }
            gifAnimationDuration = total / 100;
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.animationImages = frames;
            imageView.animationDuration = gifAnimationDuration;
            [imageView startAnimating];
        }
    }
}
- (IBAction)firstAction:(id)sender {
    [self performSegueWithIdentifier:@"first" sender:@"first"];

}
- (IBAction)secondAction:(id)sender {
    [self performSegueWithIdentifier:@"second" sender:@"second"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"first"]) {
        firstViewController *siftVC = segue.destinationViewController;
//        siftVC.titletext = sender;
    }else if ([segue.identifier isEqualToString:@"second"]){
        secondViewController *playVC = segue.destinationViewController;
//        playVC.titletext = sender;
    }
}

@end
