//
//  ViewController.m
//  播放视频
//
//  Created by wujianqiang on 2017/2/23.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "VideoPlayerController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (IBAction)touch:(id)sender {
    VideoPlayerController *vc= [[VideoPlayerController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
