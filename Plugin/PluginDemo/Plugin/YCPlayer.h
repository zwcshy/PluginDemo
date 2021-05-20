//
//  YCPlayer.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@class YCPlayerBuilder;
@interface YCPlayer : NSObject

/** 单例 */
+ (id)sharedInstance;

/** 添加构造器 */
- (void)addPlayerBuilder:(YCPlayerBuilder *)builder;

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
