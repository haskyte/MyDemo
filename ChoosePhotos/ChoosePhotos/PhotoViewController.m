//
//  PhotoViewController.m
//  ChoosePhotos
//
//  Created by wujianqiang on 2017/3/17.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIView+VsualFormat.h"
#import "PhotoCollectionViewCell.h"

@interface PhotoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic, strong) NSMutableArray *indexArray;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"相册";
    
    [self setViews];
    [self setNav];
}

- (void)setViews{
    [self.view addSubview:self.collectionView];
    
    [self.view addConstrainsWithVisualFormat:@"H:|[v0]|" Views:@[self.collectionView]];
    [self.view addConstrainsWithVisualFormat:@"V:|[v0]|" Views:@[self.collectionView]];

}

- (void)setNav{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStyleDone target:self action:@selector(chooseImage)];
}

- (void)chooseImage{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        if (self.albumDelegate) {
            [self.albumDelegate selectImages:self.photoArray];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"PhotoCollectionViewCell"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.assetArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
    cell.tag=indexPath.row;
    if (self.assetArray.count > indexPath.row) {
        cell.headImageAsset = self.assetArray[indexPath.row];
    }
    if ([self.indexArray containsObject:indexPath]) {
        cell.coverImage.hidden = false;
    }else{
        cell.coverImage.hidden = true;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.bounds.size.width-5)/4, (self.view.bounds.size.width-5)/4);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PHAsset *photoAsset = self.assetArray[indexPath.row];
    CGSize size = CGSizeMake(photoAsset.pixelWidth, photoAsset.pixelHeight);
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    __block UIImage *image = [[UIImage alloc] init];
    [[PHImageManager defaultManager] requestImageForAsset:photoAsset targetSize:size contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        image = image;
    }];
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if ([self.indexArray containsObject:indexPath]) {
        cell.coverImage.hidden = YES;
        [self.photoArray removeObject:image];
        [self.indexArray removeObject:indexPath];
    }else{
        [self.photoArray addObject:image];
        [self.indexArray addObject:indexPath];
        cell.coverImage.hidden = NO;
    }
}

- (NSMutableArray *)photoArray{
    if (!_photoArray) {
        self.photoArray = [@[] mutableCopy];
    }
    return _photoArray;
}

- (NSMutableArray *)indexArray{
    if (!_indexArray) {
        self.indexArray = [@[] mutableCopy];
    }
    return _indexArray;
}



@end
