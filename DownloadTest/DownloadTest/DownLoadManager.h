//
//  DownLoadManager.h
//  DownloadTest
//
//  Created by wujianqiang on 15/12/10.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  回调下载的数据
 *
 *  @param progress    下载进度
 *  @param currentSize 已经下载的文件大小 M
 *  @param directSize  文件总大小 M
 */
typedef void(^DownLoadBlock)(float progress,float currentSize,float directSize);

@protocol DownLoadManagerDelegate <NSObject>

- (void)downLoadWithProgress:(float)progress CurrentSize:(float)currentSize DirectSize:(float)directSize;

@end

/**
 *  文件下载完成之后保存的路径
 *
 *  @param filePath 沙盒路径
 */
typedef void(^FilePathBlock)(NSString *filePath);
@interface DownLoadManager : NSObject

@property (nonatomic, copy) DownLoadBlock downloadblock;
@property (nonatomic, copy) FilePathBlock filepathblock;

@property (nonatomic, weak) id<DownLoadManagerDelegate>delegate;

+ (instancetype)shareWithManager;

/**
 *  创建下载任务并开始下载
 *
 *  @param url           下载的url
 */
- (void)downLoadWithUrl:(NSString *)url DownLoadBlock:(DownLoadBlock)downloadblock FilePathBlock:(FilePathBlock)filepathblock;

/**
 *  继续下载
 */
- (void)continue;

/**
 *  暂停
 */
- (void)pause;


@end
