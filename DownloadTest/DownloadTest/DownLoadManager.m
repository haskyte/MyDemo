//
//  DownLoadManager.m
//  DownloadTest
//
//  Created by wujianqiang on 15/12/10.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "DownLoadManager.h"
#import <AFURLSessionManager.h>

@interface DownLoadManager ()<NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSessionDownloadTask *downLoadTask;
@property (nonatomic, strong) NSURLSession *session;
/**
 *  downLoadProgress 下载进度
 *  downloadedSize  已经下载的文件大小
 *  directDownloadSize 文件总大小
 */
@property (nonatomic) float downLoadProgress,downloadedSize,directDownloadSize;
@property (nonatomic, strong) NSString *downLoadUrl;

/**
 *  暂停时候下载的进度
 */
@property (nonatomic, strong) NSData *resumeData;

@end

@implementation DownLoadManager

+ (instancetype)shareWithManager{
    static DownLoadManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DownLoadManager alloc] init];
    });
    return manager;
}

- (void)downLoadWithUrl:(NSString *)url DownLoadBlock:(DownLoadBlock)downloadblock FilePathBlock:(FilePathBlock)filepathblock{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    self.downLoadUrl = url;
    self.downLoadTask = [self.session downloadTaskWithRequest:request];
//    self.downloadblock = downloadblock;
    self.filepathblock = filepathblock;
    [self.downLoadTask resume];
}

- (void)continue{
    self.downLoadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    [self.downLoadTask resume];
    self.resumeData = nil;
}

- (void)pause{
    __weak typeof(self) weakSelf = self;
    [self.downLoadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        weakSelf.resumeData = resumeData;
        weakSelf.downLoadTask = nil;
    }];
}


- (NSURLSession *)session{
    if (_session == nil) {
         NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    }
    return _session;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    /**
     *  bytesWritten 下载速度
     *  totalBytesWritten  已经下载的文件大小
     *  totalBytesExpectedToWrite 文件总大小
     */
    self.downLoadProgress = totalBytesWritten/1.0/totalBytesExpectedToWrite/1.0;
    self.downloadedSize = totalBytesWritten/1024.0/1024.0;
    self.directDownloadSize = totalBytesExpectedToWrite/1024.0/1024.0;
//    [self performSelectorOnMainThread:@selector(returnMainThread) withObject:nil waitUntilDone:YES];
    [self.delegate downLoadWithProgress:self.downLoadProgress CurrentSize:self.downloadedSize DirectSize:self.directDownloadSize];
}

- (void)returnMainThread{
    self.downloadblock(self.downLoadProgress,self.downloadedSize,self.directDownloadSize);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    /**
     *  location 下载的文件保存的位置
     */
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager moveItemAtPath:location.path toPath:file error:nil];
    self.filepathblock(file);
}

@end
