//
//  YCPlayerShareConfig.h
//  PluginDemo
//
//  Created by 周文超 on 2021/5/20.
//  Copyright © 2021 zhouwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCPlayerShareConfig : NSObject

+ (YCPlayerShareConfig *)defaultConfig;

/** 应用id */
@property (nonatomic, copy) NSString *appId;
/** 引用密码 */
@property (nonatomic, copy) NSString *appSecret;

@end

NS_ASSUME_NONNULL_END
