//
//  YCPlayerPlugin.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerPlugin.h"

@interface YCPlayerPlugin ()

@property (nonatomic, weak) id<YCPlayerPluginListenerDelegate> pluginListener;

@end

@implementation YCPlayerPlugin

@synthesize pluginConfig;

- (void)setupPluginListener:(id<YCPlayerPluginListenerDelegate>)pluginListener {
    _pluginListener = pluginListener;
}

- (void)start {
    if ([_pluginListener respondsToSelector:@selector(onStart:)]) {
        [_pluginListener onStart:self];
    }
}

- (void)stop {
    if ([_pluginListener respondsToSelector:@selector(onStop:)]) {
        [_pluginListener onStop:self];
    }
}

- (void)destroy {
    if ([_pluginListener respondsToSelector:@selector(onDestroy:)]) {
        [_pluginListener onDestroy:self];
    }
}

- (NSString *)getTag {
    NSLog(@"base class has no tag");
    return nil;
}

- (YCPlayerPluginPriority)pluginPriority {
    return YCPlayerPluginPriorityLow;
}

@end
