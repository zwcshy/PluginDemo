//
//  YCPlayer.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayer.h"
#import "YCPlayerBuilder.h"

@interface YCPlayer ()

@property (nonatomic, strong) YCPlayerBuilder *builder;

@end

@implementation YCPlayer

+ (id)sharedInstance {
    static YCPlayer *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[YCPlayer alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)addPlayerBuilder:(YCPlayerBuilder *)builder {
    self.builder = builder;
    NSMutableSet *buildPlugins = [builder getPlugins];
    for (YCPlayerPlugin *plugin in buildPlugins) {
        [plugin setupPluginListener:[builder pluginListener]];
    }
}

- (void)startPlugins {
    NSMutableSet *plugins = [self.builder getPlugins];
    for (YCPlayerPlugin *plugin in plugins) {
        [plugin start];
    }
}

- (void)stopPlugins {
    NSMutableSet *plugins = [self.builder getPlugins];
    for (YCPlayerPlugin *plugin in plugins) {
        [plugin stop];
    }
}

- (NSMutableSet *)getPlugins {
    return [self.builder getPlugins];
}

- (void)removeAllPlugin {
    [self.builder removeAllPlugin];
}

@end
