//
//  ViewController.m
//  DownloadTest
//
//  Created by wujianqiang on 15/12/10.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadManager.h"
#import "MyThreadManager.h"

@interface ViewController ()<DownLoadManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UILabel *perLabel;
@property (nonatomic, strong) NSString *filePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)startDownLoad:(UIButton *)sender {
    DownLoadManager *downManager = [DownLoadManager shareWithManager];
    [downManager downLoadWithUrl:@"http://vjs.zencdn.net/v/oceans.mp4" DownLoadBlock:^(float progress, float currentSize, float directSize) {

    } FilePathBlock:^(NSString *filePath) {
        NSLog(@"%@",filePath);
        self.filePath = filePath;
    }];
    downManager.delegate = self;
}

- (void)downLoadWithProgress:(float)progress CurrentSize:(float)currentSize DirectSize:(float)directSize{

    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
        self.percentLabel.text = [NSString stringWithFormat:@"%.2fM/%.2fM",currentSize,directSize];
        self.perLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
        
    });
}

- (IBAction)pauseButton:(id)sender {
    [[DownLoadManager shareWithManager] pause];
    
}

- (IBAction)deleteButton:(id)sender {
//    NSFileManager *manager = [NSFileManager defaultManager];
//    [manager removeItemAtPath:self.filePath error:nil];
    [[DownLoadManager shareWithManager] continue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
