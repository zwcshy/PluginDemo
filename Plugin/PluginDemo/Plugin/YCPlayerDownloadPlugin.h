//
//  YCPlayerDownloadPlugin.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPlugin.h"
#import "YCPlayerDownloadConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YCPlayerDownloadPluginDelegate<NSObject>

/** 开始下载 */
- (void)startDownLoadWithUrl:(NSString *)url;
/** 下载中 */
- (void)downloadWithProgress:(float)process;
/** 开始完成 */
- (void)finishDownloadLoadWithUrl:(NSString *)url;

@end

@interface YCPlayerDownloadPlugin : YCPlayerPlugin

@property (nonatomic, strong) YCPlayerDownloadConfig *config;

@property (nonatomic, weak) id<YCPlayerDownloadPluginDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
