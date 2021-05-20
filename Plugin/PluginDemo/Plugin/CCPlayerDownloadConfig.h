//
//  CCPlayerDownloadConfig.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPluginConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerDownloadConfig : CCPlayerPluginConfig

+ (CCPlayerDownloadConfig *)defaultConfig;

/** 下载URL */
@property (nonatomic, copy) NSString *videoUrl;

/** 保存地址 */
@property (nonatomic, copy) NSString *saveFilePath;

@end

NS_ASSUME_NONNULL_END
