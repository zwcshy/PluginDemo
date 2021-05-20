//
//  YCPlayerBuilder.m
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import "YCPlayerBuilder.h"
#import "YCPlayerPlugin.h"

@interface YCPlayerBuilder ()

/** 这个集合会自动去重 */
@property (nonatomic, strong) NSMutableSet *plugins;

@end

@implementation YCPlayerBuilder

- (id)init {
    if (self = [super init]) {
        self.pluginListener = nil;
        self.plugins = [[NSMutableSet alloc] init];
    }
    return self;
}

- (NSMutableSet *)getPlugins {
    return self.plugins;
}

- (void)removeAllPlugin {
    [self.plugins removeAllObjects];
}

- (YCPlayerPlugin *)getPluginWithTag:(NSString *)tag {
    NSMutableSet *plugins = self.plugins;
    YCPlayerPlugin *retPlugin = nil;
    for (YCPlayerPlugin *plugin in plugins) {
        if ([[plugin getTag] isEqualToString:tag]) {
            retPlugin = plugin;
            break;
        }
    }
    if (retPlugin == nil) {
        NSLog(@"Plugin[%@] 不存在", tag);
    }
    return retPlugin;
}

- (void)addPlugin:(YCPlayerPlugin *)plugin {
    if (nil == plugin) {
        return;
    }
    [self.plugins addObject:plugin];
}

- (void)removePlugin:(YCPlayerPlugin *)plugin {
    if (!plugin) {
        return;
    }
    
    for (YCPlayerPlugin *plugin in self.plugins) {
        if ([plugin isMemberOfClass:[plugin class]]) {
            [self.plugins removeObject:plugin];
            break;
        }
    }
}

- (void)removePluginWithTag:(NSString *)tag {
    NSMutableSet *plugins = self.plugins;
    for (YCPlayerPlugin *plugin in plugins) {
        if ([[plugin getTag] isEqualToString:@""]) {
            [self.plugins removeObject:plugin];
            break;
        }
    }
}

- (BOOL)isContainPlugin:(YCPlayerPlugin *)plugin {
    for (YCPlayerPlugin *plugin in self.plugins) {
        if ([plugin isMemberOfClass:[plugin class]]) {
            return YES;
        }
    }
    return NO;
}

@end


