//
//  CCPlayerPlugin.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayerPlugin.h"

@interface CCPlayerPlugin ()

@property (nonatomic, weak) id<CCPlayerPluginListenerDelegate> pluginListener;

@end

@implementation CCPlayerPlugin

@synthesize pluginConfig;

- (void)setupPluginListener:(id<CCPlayerPluginListenerDelegate>)pluginListener {
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

- (CCPlayerPluginPriority)pluginPriority {
    return CCPlayerPluginPriorityLow;
}

@end
