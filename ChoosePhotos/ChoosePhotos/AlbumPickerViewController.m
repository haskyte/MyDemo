//
//  AlbumPickerViewController.m
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "AlbumPickerViewController.h"
#import "AlbumManager.h"
#import "AlbumModel.h"
#import "UIView+VsualFormat.h"
#import "AlbumTableViewCell.h"
#import "PhotoViewController.h"

@interface AlbumPickerViewController ()<UITableViewDelegate,UITableViewDataSource,AlbumDelegate>

@property (nonatomic, strong) NSArray *ablumList;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation AlbumPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ablumList =  [[AlbumManager manager] getPhotoAblumList];
    [self setNav];
    [self setViews];
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if(status == PHAuthorizationStatusAuthorized) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.ablumList =  [[AlbumManager manager] getPhotoAblumList];
                    [self.tableView reloadData];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 用户点击 不允许访问
                    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                });
            }
        }];
    }
    
}

- (void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"相册";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAction:)];
}

- (void)cancelAction:(UIBarButtonItem *)item{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

- (void)setViews{
    [self.view addSubview:self.tableView];
    
    [self.view addConstrainsWithVisualFormat:@"H:|[v0]|" Views:@[self.tableView]];
    [self.view addConstrainsWithVisualFormat:@"V:|[v0]|" Views:@[self.tableView]];
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100.f;
        [_tableView registerClass:[AlbumTableViewCell class] forCellReuseIdentifier:@"AlbumTableViewCell"];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ablumList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumTableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.ablumList.count > indexPath.row) {
        cell.albumModel = self.ablumList[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumModel *albumModel = self.ablumList[indexPath.row];
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.albumDelegate = self;
    photoVC.assetArray = [[AlbumManager manager] getAssetsInAssetCollection:albumModel.assetCollection ascending:NO];
    [self.navigationController pushViewController:photoVC animated:YES];
}

- (void)selectImages:(NSArray *)imageArray{
    if (self.albumDelegate) {
        [self.albumDelegate selectImages:imageArray];
    }
}


- (NSArray *)ablumList{
    if (!_ablumList) {
        self.ablumList = [@[] copy];
    }
    return _ablumList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
