//
//  YCPlayerDownloadPlugin.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerDownloadPlugin.h"

@interface YCPlayerDownloadPlugin ()

@end

@implementation YCPlayerDownloadPlugin

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

#pragma mark - YCPlayerPluginProtocol

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

- (void)setupPluginListener:(id<YCPlayerPluginListenerDelegate>)pluginListener {
    [super setupPluginListener:pluginListener];
}

- (YCPlayerPluginPriority)pluginPriority {
    return YCPlayerPluginPriorityMiddle;
}

- (NSString *)getTag {
    return @"downloadPlugin";
}

@end
