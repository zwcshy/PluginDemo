//
//  CCPlayerShareConfig.h
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCPlayerShareConfig : NSObject

+ (CCPlayerShareConfig *)defaultConfig;

/** 应用id */
@property (nonatomic, copy) NSString *appId;
/** 引用密码 */
@property (nonatomic, copy) NSString *appSecret;

@end

NS_ASSUME_NONNULL_END
