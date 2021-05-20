//
//  YCPlayerSharePlugin.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPlayerPlugin.h"
#import "YCPlayerShareConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YCPlayerSharePluginDelegate <NSObject>

/** 分享平台 */
- (void)sharePlatform:(NSString *)platform;

- (void)shareError:(NSString *)error;

@end

@interface YCPlayerSharePlugin : YCPlayerPlugin

/** 添加分享平台 */
- (void)addPlatform:(NSArray *)platforms;

@property (nonatomic, assign) id<YCPlayerSharePluginDelegate> delegate;

@property (nonatomic, strong) YCPlayerShareConfig *config;

@end

NS_ASSUME_NONNULL_END
