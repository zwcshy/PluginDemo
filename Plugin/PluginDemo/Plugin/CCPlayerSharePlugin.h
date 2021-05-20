//
//  CCPlayerSharePlugin.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayerPlugin.h"
#import "CCPlayerShareConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CCPlayerSharePluginDelegate <NSObject>

/** 分享平台 */
- (void)sharePlatform:(NSString *)platform;

- (void)shareError:(NSString *)error;

@end

@interface CCPlayerSharePlugin : CCPlayerPlugin

/** 添加分享平台 */
- (void)addPlatform:(NSArray *)platforms;

@property (nonatomic, assign) id<CCPlayerSharePluginDelegate> delegate;

@property (nonatomic, strong) CCPlayerShareConfig *config;

@end

NS_ASSUME_NONNULL_END
