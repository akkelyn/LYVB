//
//  LYTabBarController.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYTabBarController.h"
#import "UIImage+Image.h"
#import "LYTabBar.h"

#import "LYHomeViewController.h"
#import "LYDiscoverViewController.h"
#import "LYProfileViewController.h"

#import "LYMesageViewController.h"
#import "LYNavigationController.h"
#import "LYUserTool.h"

#import "LYUserResult.h"
#import "LYComposeViewController.h"

@interface LYTabBarController ()<LYTabBarDelegate>
@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, weak) LYHomeViewController *home;
@property (nonatomic, weak) LYMesageViewController *message;
@property (nonatomic, weak) LYProfileViewController *profile;
@end

@implementation LYTabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
        
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpAllChildViewController];
    
    [self setUpTabBar];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(requestUnread) userInfo:nil repeats:YES];
}
#pragma-mark 蠢如狗啊，居然没倒tou文件，也能写出
- (void)requestUnread
{
    
    
  
    [LYUserTool unreadWithSuccess:^(LYUserResult *result) {
        
        _home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
        
        _message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.messageCount];
        
        _profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.follower];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totoalCount;
     
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - 设置tabBar
- (void)setUpTabBar
{
   
    LYTabBar *tabBar = [[LYTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.backgroundColor = [UIColor whiteColor];
    
    tabBar.delegate = self;
    
    tabBar.items = self.items;
    
    [self.view addSubview:tabBar];
    
    [self.tabBar removeFromSuperview];
}


#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(LYTabBar *)tabBar didClickButton:(NSInteger)index
{
    if (index == 0 && self.selectedIndex == index) {
        [_home refresh];
    }
}

- (void)tabBarDidClickPlusButton:(LYTabBar *)tabBar
{
    LYComposeViewController *composeVC = [[LYComposeViewController alloc]init];
    LYNavigationController *navc = [[LYNavigationController alloc]initWithRootViewController:composeVC];

    [self presentViewController:navc animated:YES completion:nil];
}

#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
   
    LYHomeViewController *home = [[LYHomeViewController alloc] init];
    
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    _home = home;


   LYMesageViewController *message = [[LYMesageViewController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];
    

    LYDiscoverViewController *discover = [[LYDiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    
    LYProfileViewController *profile = [[LYProfileViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    
}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self.items addObject:vc.tabBarItem];
    
    LYNavigationController *nav = [[LYNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}
@end