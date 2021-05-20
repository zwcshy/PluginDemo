//
//  CCPlayerDownloadPlugin.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayerDownloadPlugin.h"

@interface CCPlayerDownloadPlugin ()

@end

@implementation CCPlayerDownloadPlugin

- (instancetype)init {
    if (self = [super init]) {
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(startDownLoadWithUrl:)]) {
                [self.delegate startDownLoadWithUrl:self.config.videoUrl];
            }
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(downloadWithProgress:)]) {
                [self.delegate downloadWithProgress:0.5];
            }
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(finishDownloadLoadWithUrl:)]) {
                [self.delegate finishDownloadLoadWithUrl:self.config.videoUrl];
            }
        });
    }
    return self;
}

#pragma mark - CCPlayerPluginProtocol

- (void)start {
    [super start];
    NSLog(@"下载开始");
}

- (void)stop {
    [super stop];
    NSLog(@"下载结束");
}

- (void)destroy {
    [super destroy];
    NSLog(@"下载销毁");
}

- (void)setupPluginListener:(id<CCPlayerPluginListenerDelegate>)pluginListener {
    [super setupPluginListener:pluginListener];
}

- (CCPlayerPluginPriority)pluginPriority {
    return CCPlayerPluginPriorityMiddle;
}

- (NSString *)getTag {
    return @"downloadPlugin";
}

@end
