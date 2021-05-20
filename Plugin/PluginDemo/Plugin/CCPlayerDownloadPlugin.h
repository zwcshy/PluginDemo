//
//  CCPlayerDownloadPlugin.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPlugin.h"
#import "CCPlayerDownloadConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CCPlayerDownloadPluginDelegate<NSObject>

/** 开始下载 */
- (void)startDownLoadWithUrl:(NSString *)url;
/** 下载中 */
- (void)downloadWithProgress:(float)process;
/** 开始完成 */
- (void)finishDownloadLoadWithUrl:(NSString *)url;

@end

@interface CCPlayerDownloadPlugin : CCPlayerPlugin

@property (nonatomic, strong) CCPlayerDownloadConfig *config;

@property (nonatomic, weak) id<CCPlayerDownloadPluginDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
