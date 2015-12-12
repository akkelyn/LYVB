//
//  LYView.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYView.h"

@implementation LYView
//
//- (void)setDimBackground:(BOOL)dimBackground
//{
//    _dimBackground = dimBackground;
//    
//    if (dimBackground) {
//        
//        self.backgroundColor = [UIColor blackColor];
//        self.alpha = 0.5;
//    }else{
//        self.alpha = 1;
//        self.backgroundColor = [UIColor clearColor];
//    }
//}
// 显示蒙板
+ (instancetype)show
{
    LYView *cover = [[LYView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor yellowColor];
    
    [LYKeyWindow addSubview:cover];
    
    return cover;
    
}
// 点击蒙板的时候做事情
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 移除蒙板
    [self removeFromSuperview];
    
    // 通知代理移除菜单
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        
        [_delegate coverDidClickCover:self];
        
    }
    
}

@end
