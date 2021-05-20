//
//  YCPlayerBuilder.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCPlayerBuilder : NSObject

@property (nonatomic, weak) id<YCPlayerPluginListenerDelegate> pluginListener;

/** 获取所有插件 */
- (NSMutableSet *)getPlugins;

/** 移除所有插件 */
- (void)removeAllPlugin;

/** 根据tag获取插件 */
- (YCPlayerPlugin *)getPluginWithTag:(NSString *)tag;

/** 添加插件 */
- (void)addPlugin:(YCPlayerPlugin *)plugin;

/// 移除插件
/// @param tag 插件名称
- (void)removePluginWithTag:(NSString *)tag;

/** 移除插件 */
- (void)removePlugin:(YCPlayerPlugin *)plugin;

/** 是否包含某个插件 */
- (BOOL)isContainPlugin:(YCPlayerPlugin *)plugin;

@end

NS_ASSUME_NONNULL_END
