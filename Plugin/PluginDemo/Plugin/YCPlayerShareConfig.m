//
//  YCPlayerShareConfig.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerShareConfig.h"

@implementation YCPlayerShareConfig

+ (YCPlayerShareConfig *)defaultConfig {
    YCPlayerShareConfig *config = [[YCPlayerShareConfig alloc] init];
    return config;
}

- (instancetype)init {
    if (self = [super init]) {
        self.appId = @"";
        self.appSecret = @"";
    }
    return self;
}

@end
