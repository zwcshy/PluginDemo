//
//  CCPlayerBuilder.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerBuilder : NSObject

@property (nonatomic, weak) id<CCPlayerPluginListenerDelegate> pluginListener;

/** 获取所有插件 */
- (NSMutableSet *)getPlugins;

/** 移除所有插件 */
- (void)removeAllPlugin;

/** 根据tag获取插件 */
- (CCPlayerPlugin *)getPluginWithTag:(NSString *)tag;

/** 添加插件 */
- (void)addPlugin:(CCPlayerPlugin *)plugin;

/// 移除插件
/// @param tag 插件名称
- (void)removePluginWithTag:(NSString *)tag;

/** 移除插件 */
- (void)removePlugin:(CCPlayerPlugin *)plugin;

/** 是否包含某个插件 */
- (BOOL)isContainPlugin:(CCPlayerPlugin *)plugin;

@end

NS_ASSUME_NONNULL_END
