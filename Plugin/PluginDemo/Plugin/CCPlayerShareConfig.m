//
//  CCPlayerShareConfig.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayerShareConfig.h"

@implementation CCPlayerShareConfig

+ (CCPlayerShareConfig *)defaultConfig {
    CCPlayerShareConfig *config = [[CCPlayerShareConfig alloc] init];
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
