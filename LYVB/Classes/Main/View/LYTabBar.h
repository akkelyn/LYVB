//
//  LYTabBar.h
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LYTabBar;

@protocol LYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LYTabBar *)tabBar didClickButton:(NSInteger)index;

- (void)tabBarDidClickPlusButton:(LYTabBar *)tabBar;
@end


@interface LYTabBar : UIView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<LYTabBarDelegate> delegate;

@end
