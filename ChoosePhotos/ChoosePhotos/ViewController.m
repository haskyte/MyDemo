//
//  ViewController.m
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "AlbumPickerViewController.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,AlbumDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)chooseImages:(id)sender {
    AlbumPickerViewController *photosVC = [[AlbumPickerViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:photosVC];
    photosVC.albumDelegate = self;
    
    [self presentViewController:naviVC animated:YES completion:nil];
    
}

- (void)selectImages:(NSArray *)imageArray{
    NSLog(@"==========%@",imageArray);
}


/*
#pragma mark - UIImagePickerControllerDelegate -
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //裁剪后的图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSLog(@"%@",image);
    [self dismissViewControllerAnimated:YES completion:nil];
}

//取消按钮的回调
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
*/

@end
