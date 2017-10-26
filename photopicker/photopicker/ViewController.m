//
//  ViewController.m
//  photopicker
//
//  Created by wujianqiang on 16/5/25.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
@interface ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonaction:(UIButton *)sender {
    TZImagePickerController *imageVC = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [imageVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> * images, NSArray *imagearray, BOOL statue) {
        NSLog(@"----%@",images);
        
        NSLog(@"+++++%@",imagearray);
        
        NSLog(@"111111%d",statue);
    }];
    [self presentViewController:imageVC animated:YES completion:nil];
}

@end
