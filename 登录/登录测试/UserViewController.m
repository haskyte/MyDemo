//
//  UserViewController.m
//  登录测试
//
//  Created by Hu Bin on 15/7/10.
//  Copyright (c) 2015年 Hu Bin. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "UserViewController.h"
#import "UzysAssetsPickerController.h"

@interface UserViewController () <UzysAssetsPickerControllerDelegate>

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_upload addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction:(id)sender
{
    UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
    picker.delegate = self;
    if ([sender isEqual:_upload]) {
        NSLog(@"ssss");
        picker.maximumNumberOfSelectionVideo = 0;
        picker.maximumNumberOfSelectionPhoto = 3;
    }
    NSLog(@"dddd");
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"ssssaas");
    }];
}

- (void) UzysAssetsPickerController:(UzysAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    _topImageView.backgroundColor = [UIColor clearColor];
    NSLog(@"assets %@",assets);
    __weak typeof(self) weakSelf = self;
    if ([[assets[0] valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]) {
        [assets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ALAsset *representation = obj;
            
            UIImage *img = [UIImage imageWithCGImage:representation.defaultRepresentation.fullResolutionImage scale:representation.defaultRepresentation.scale orientation:(UIImageOrientation)representation.defaultRepresentation.orientation];
            weakSelf.topImageView.image = img;
            *stop = YES;
        }];
    }
}

@end
