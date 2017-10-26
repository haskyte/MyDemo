//
//  ViewController.m
//  HttpRequest
//
//  Created by wujianqiang on 16/10/14.
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
    
//    NSString *str = @"http://192.168.21.220:8080/CreditMarket/api/v2/auth/login";
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
////
//    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//
//    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Authorization"];
////    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
////        NSError *error;
////        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
////        NSLog(@"================\n%@",json);
////        NSLog(@"\n %@",error);
////        
//////        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//////        NSLog(@"%@",result);
////        
////        
////        
////    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
////        NSLog(@"%@",error);
////    }];
//
//    
//    
//    NSDictionary *parameter = @{@"loginName":@"18622603346",@"password":@"111111",@"source":@"APP"};
//    [manager POST:str parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSLog(@"%@",responseObject);
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//        
//        NSLog(@"%@",json);
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//        NSLog(@"%@",error);
//    }];

    NSString *url = @"https://account.douman.com/api/v2/useramountinfo/getInvestContract?userId=9EA560BD-50C5-45AB-80A7-466B7E08D15E&loanId=090E891C-3E87-493B-98F5-5A644EFD2233&access_token=499b59b60493a076ec30a213c1df88ca57fa6d054b2aa241857d8ea83b8c3671";
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",nil];

    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];

//    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%@",downloadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",path);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

//    NSURL *URL = [NSURL URLWithString:str];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    [manager setValue:str forKey:@"authorization"];
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
////            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@" %@", responseObject);
//        }
//    }];
//    [dataTask resume];


//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"" password:@""];
//    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"/n ===================");
//        NSLog(@"%@",responseObject);
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"/n +++++++++++++++++++");
//        NSLog(@"%@",error);
//    }];



@end
