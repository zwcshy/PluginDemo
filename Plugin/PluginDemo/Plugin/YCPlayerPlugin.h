//
//  YCPlayerPlugin.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPluginConfig.h"

NS_ASSUME_NONNULL_BEGIN

/** 设置优先级 */
typedef NS_OPTIONS(NSUInteger, YCPlayerPluginPriority) {
    YCPlayerPluginPriorityHigh,
    YCPlayerPluginPriorityMiddle,
    YCPlayerPluginPriorityLow
};

#pragma mark - YCPlayerPluginListenerDelegate
@protocol YCPlayerPluginProtocol;

// 添加时间监听代理
@protocol YCPlayerPluginListenerDelegate <NSObject>

@optional

- (void)onInit:(id<YCPlayerPluginProtocol>)plugin;
- (void)onStart:(id<YCPlayerPluginProtocol>)plugin;
- (void)onStop:(id<YCPlayerPluginProtocol>)plugin;
- (void)onDestroy:(id<YCPlayerPluginProtocol>)plugin;

/** 插件的优先级 */
- (void)onPriority:(id<YCPlayerPluginProtocol>)plugin;

@end


#pragma mark - YCPlayerPluginProtocol

@protocol YCPlayerPluginProtocol <NSObject>

@required

/** 开始 */
- (void)start;

/** 结束 */
- (void)stop;

/** 销毁 */
- (void)destroy;

/** 添加监听 */
- (void)setupPluginListener:(id<YCPlayerPluginListenerDelegate>)pluginListener;

/** 获取插件tag */
- (NSString *)getTag;

/** 插件的优先级 */
- (YCPlayerPluginPriority)pluginPriority;

@end


#pragma mark - YCPlayerPlugin

@interface YCPlayerPlugin : NSObject <YCPlayerPluginProtocol>

/** 插件配置类 */
@property (nonatomic, strong) YCPlayerPluginConfig *pluginConfig;

@end

NS_ASSUME_NONNULL_END
