//
//  YCPlayerDownloadConfig.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerDownloadConfig.h"

@implementation YCPlayerDownloadConfig

+ (YCPlayerDownloadConfig *)defaultConfig {
    YCPlayerDownloadConfig *config = [[YCPlayerDownloadConfig alloc] init];
    return config;
}

- (instancetype)init {
    if (self = [super init]) {
        self.videoUrl = @"";
        self.saveFilePath = @"";
    }
    return self;
}

@end
