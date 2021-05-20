//
//  CCPlayerPlugin.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPluginConfig.h"

NS_ASSUME_NONNULL_BEGIN

/** 设置优先级 */
typedef NS_OPTIONS(NSUInteger, CCPlayerPluginPriority) {
    CCPlayerPluginPriorityHigh,
    CCPlayerPluginPriorityMiddle,
    CCPlayerPluginPriorityLow
};

#pragma mark - CCPlayerPluginListenerDelegate
@protocol CCPlayerPluginProtocol;

// 添加时间监听代理
@protocol CCPlayerPluginListenerDelegate <NSObject>

@optional

- (void)onInit:(id<CCPlayerPluginProtocol>)plugin;
- (void)onStart:(id<CCPlayerPluginProtocol>)plugin;
- (void)onStop:(id<CCPlayerPluginProtocol>)plugin;
- (void)onDestroy:(id<CCPlayerPluginProtocol>)plugin;

/** 插件的优先级 */
- (void)onPriority:(id<CCPlayerPluginProtocol>)plugin;

@end


#pragma mark - CCPlayerPluginProtocol

@protocol CCPlayerPluginProtocol <NSObject>

@required

/** 开始 */
- (void)start;

/** 结束 */
- (void)stop;

/** 销毁 */
- (void)destroy;

/** 添加监听 */
- (void)setupPluginListener:(id<CCPlayerPluginListenerDelegate>)pluginListener;

/** 获取插件tag */
- (NSString *)getTag;

/** 插件的优先级 */
- (CCPlayerPluginPriority)pluginPriority;

@end


#pragma mark - CCPlayerPlugin

@interface CCPlayerPlugin : NSObject <CCPlayerPluginProtocol>

/** 插件配置类 */
@property (nonatomic, strong) CCPlayerPluginConfig *pluginConfig;

@end

NS_ASSUME_NONNULL_END
