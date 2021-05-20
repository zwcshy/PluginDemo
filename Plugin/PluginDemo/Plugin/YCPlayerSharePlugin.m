//
//  YCPlayerSharePlugin.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerSharePlugin.h"
#import "YCPlayerPlugin.h"

@interface YCPlayerSharePlugin ()

/** 分享平台 */
@property (nonatomic, strong) NSArray *platform;

@end

@implementation YCPlayerSharePlugin

#pragma mark - YCPlayerPluginProtocol

- (void)start {
    [super start];
    NSLog(@"分享开始");
    
    // 模拟分享到微信
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.config.appId.length > 0
            && self.config.appSecret.length > 0) {
            if ([self.delegate respondsToSelector:@selector(sharePlatform:)]) {
                [self.delegate sharePlatform:@"微信"];
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(shareError:)]) {
                [self.delegate shareError:@"请配置分享信息"];
            }
        }
    });
}

- (void)stop {
    [super stop];
    NSLog(@"分享结束");
}

- (void)destroy {
    [super destroy];
    NSLog(@"分享销毁");
}

- (void)setupPluginListener:(id<YCPlayerPluginListenerDelegate>)pluginListener {
    [super setupPluginListener:pluginListener];
}

+ (NSString *)getTag {
    return @"sharePlugin";
}

- (YCPlayerPluginPriority)pluginPriority {
    return YCPlayerPluginPriorityHigh;
}

- (void)addPlatform:(NSArray *)platforms {
    self.platform = platforms;
}

@end
