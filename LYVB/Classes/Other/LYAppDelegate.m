//
//  LYAppDelegate.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYAppDelegate.h"
#import "LYOneViewController.h"
#import "LYTabBarController.h"

#import "LYOauthController.h"
#import "LYNewfeatureController.h"
#import "LYRootTool.h"

#import "LYAccountTool.h"
#import "UIImageView+WebCache.h"

@interface LYAppDelegate ()

@end
@implementation LYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([LYAccountTool account]) {
        
        [LYRootTool chooseRootViewController:self.window];
        
    }else{
        LYOauthController *oauth = [[LYOauthController alloc]init];
        
        self.window.rootViewController = oauth;
        
    }
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [[SDWebImageManager sharedManager] cancelAll];
    
    [[SDWebImageManager sharedManager].imageCache clearMemory];

}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
