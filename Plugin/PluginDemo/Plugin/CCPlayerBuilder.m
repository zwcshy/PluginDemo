//
//  CCPlayerBuilder.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "CCPlayerBuilder.h"
#import "CCPlayerPlugin.h"

@interface CCPlayerBuilder ()

/** 这个集合会自动去重 */
@property (nonatomic, strong) NSMutableSet *plugins;

@end

@implementation CCPlayerBuilder

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

- (CCPlayerPlugin *)getPluginWithTag:(NSString *)tag {
    NSMutableSet *plugins = self.plugins;
    CCPlayerPlugin *retPlugin = nil;
    for (CCPlayerPlugin *plugin in plugins) {
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

- (void)addPlugin:(CCPlayerPlugin *)plugin {
    if (nil == plugin) {
        return;
    }
    [self.plugins addObject:plugin];
}

- (void)removePlugin:(CCPlayerPlugin *)plugin {
    if (!plugin) {
        return;
    }
    
    for (CCPlayerPlugin *plugin in self.plugins) {
        if ([plugin isMemberOfClass:[plugin class]]) {
            [self.plugins removeObject:plugin];
            break;
        }
    }
}

- (void)removePluginWithTag:(NSString *)tag {
    NSMutableSet *plugins = self.plugins;
    for (CCPlayerPlugin *plugin in plugins) {
        if ([[plugin getTag] isEqualToString:@""]) {
            [self.plugins removeObject:plugin];
            break;
        }
    }
}

- (BOOL)isContainPlugin:(CCPlayerPlugin *)plugin {
    for (CCPlayerPlugin *plugin in self.plugins) {
        if ([plugin isMemberOfClass:[plugin class]]) {
            return YES;
        }
    }
    return NO;
}

@end


