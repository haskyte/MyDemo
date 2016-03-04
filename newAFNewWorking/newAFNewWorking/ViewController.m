//
//  ViewController.m
//  newAFNewWorking
//
//  Created by wujianqiang on 16/1/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:<#(nonnull NSString *)#> parameters:<#(nullable id)#> progress:<#^(NSProgress * _Nonnull downloadProgress)downloadProgress#> success:<#^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)success#> failure:<#^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)failure#>]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
