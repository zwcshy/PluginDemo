//
//  YCPlayerDownloadConfig.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPluginConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCPlayerDownloadConfig : YCPlayerPluginConfig

+ (YCPlayerDownloadConfig *)defaultConfig;

/** 下载URL */
@property (nonatomic, copy) NSString *videoUrl;

/** 保存地址 */
@property (nonatomic, copy) NSString *saveFilePath;

@end

NS_ASSUME_NONNULL_END
