//
//  LYRootTool.m
//  LYVB
//
//  Created by lzz on 15-12-5.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYRootTool.h"
#import "LYTabBarController.h"
#import "LYNewFeatureController.h"

#define LYVersionKey @"version"
@implementation LYRootTool

+ (void)chooseRootViewController:(UIWindow *)window
{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:LYVersionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) { // 没有最新的版本
        
        LYTabBarController *tabBarVc = [[LYTabBarController alloc] init];
        
        window.rootViewController = tabBarVc;
        
        
    }else{ // 有最新的版本号
        
        
        LYNewfeatureController *vc = [[LYNewfeatureController alloc]init];
        window.rootViewController = vc;
    
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:LYVersionKey];
    }
}
@end
