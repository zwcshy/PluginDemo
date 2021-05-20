//
//  CCPlayerDownloadConfig.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayerDownloadConfig.h"

@implementation CCPlayerDownloadConfig

+ (CCPlayerDownloadConfig *)defaultConfig {
    CCPlayerDownloadConfig *config = [[CCPlayerDownloadConfig alloc] init];
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
