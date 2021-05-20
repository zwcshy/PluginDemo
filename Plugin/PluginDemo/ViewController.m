//
//  ViewController.m
//  PluginDemo
//
//  Created by zwcshy on 2021/5/20.
//  Copyright © 2021 蘑菇头. All rights reserved.
//

#import "ViewController.h"
#import "CCPlayer.h"
#import "CCPlayerBuilder.h"
#import "CCPlayerSharePlugin.h"
#import "CCPlayerDownloadPlugin.h"

@interface ViewController ()<CCPlayerPluginListenerDelegate, CCPlayerSharePluginDelegate, CCPlayerDownloadPluginDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    // 测试插件
    CCPlayer *player = [CCPlayer sharedInstance];
    CCPlayerBuilder *playerBuilder = [[CCPlayerBuilder alloc] init];
    playerBuilder.pluginListener = self; // pluginListener 回调 plugin 的相关事件
        
    CCPlayerSharePlugin *sharePlugin = [[CCPlayerSharePlugin alloc] init];
    sharePlugin.delegate = self;
    [playerBuilder addPlugin:sharePlugin];
    
    // 配置下载插件
    CCPlayerDownloadPlugin *downloadPlugin = [[CCPlayerDownloadPlugin alloc] init];
    
    CCPlayerDownloadConfig *config = [[CCPlayerDownloadConfig alloc] init];
    config.videoUrl = @"http://www.baidu.com";
    config.saveFilePath = @"/usr/download/video";
    downloadPlugin.config = config;
    
    downloadPlugin.delegate = self;
    [playerBuilder addPlugin:downloadPlugin];

    [player addPlayerBuilder:playerBuilder];
    [sharePlugin start];
    [downloadPlugin start];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(100 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 移除插件
        [playerBuilder removePlugin:downloadPlugin];
        NSLog(@"插件%@", [player getPlugins]);
    });

    NSLog(@"插件个数%@", [player getPlugins]);
    NSLog(@"tag获取的插件是%@", [playerBuilder getPluginWithTag:@"downloadPlugin"]);
    NSLog(@"是否包含分享插件----%@", @([playerBuilder isContainPlugin:sharePlugin]));
}

#pragma mark - CCPlayerPluginListenerDelegate
- (void)onInit:(id<CCPlayerPluginProtocol>)plugin {
    
}

- (void)onStart:(id<CCPlayerPluginProtocol>)plugin {
    NSLog(@"插件是啥%@", plugin);
}

- (void)onStop:(id<CCPlayerPluginProtocol>)plugin {
    
}

- (void)onDestroy:(id<CCPlayerPluginProtocol>)plugin {
    
}

- (void)onPriority:(id<CCPlayerPluginProtocol>)plugin {
    
}

#pragma mark - CCPlayerSharePluginDelegate
- (void)sharePlatform:(NSString *)platform {
    NSLog(@"分享平台---%@", platform);
}

- (void)shareError:(NSString *)error {
    NSLog(@"错误信息是---%@", error);
}

#pragma mark - CCPlayerDownloadPluginDelegate

- (void)startDownLoadWithUrl:(NSString *)url {
    NSLog(@"开始下载--%@", url);
}

- (void)downloadWithProgress:(float)process {
    NSLog(@"下载进度--%@", @(process));
}

- (void)finishDownloadLoadWithUrl:(NSString *)url {
    NSLog(@"下载完成--%@", url);
}

@end
