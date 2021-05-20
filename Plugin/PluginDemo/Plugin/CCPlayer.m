//
//  CCPlayer.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayer.h"
#import "CCPlayerBuilder.h"

@interface CCPlayer ()

@property (nonatomic, strong) CCPlayerBuilder *builder;

@end

@implementation CCPlayer

+ (id)sharedInstance {
    static CCPlayer *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CCPlayer alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)addPlayerBuilder:(CCPlayerBuilder *)builder {
    self.builder = builder;
    NSMutableSet *buildPlugins = [builder getPlugins];
    for (CCPlayerPlugin *plugin in buildPlugins) {
        [plugin setupPluginListener:[builder pluginListener]];
    }
}

- (void)startPlugins {
    NSMutableSet *plugins = [self.builder getPlugins];
    for (CCPlayerPlugin *plugin in plugins) {
        [plugin start];
    }
}

- (void)stopPlugins {
    NSMutableSet *plugins = [self.builder getPlugins];
    for (CCPlayerPlugin *plugin in plugins) {
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
