//
//  CCPlayer.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@class CCPlayerBuilder;
@interface CCPlayer : NSObject

/** 单例 */
+ (id)sharedInstance;

/** 添加构造器 */
- (void)addPlayerBuilder:(CCPlayerBuilder *)builder;

/** 开启插件 */
- (void)startPlugins;

/** 停止插件 */
- (void)stopPlugins;

/** 获取所有插件 */
- (NSMutableSet *)getPlugins;

/** 移除所有插件 */
- (void)removeAllPlugin;

@end

NS_ASSUME_NONNULL_END
