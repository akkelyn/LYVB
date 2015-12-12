//
//  LYView.h
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LYView;
@protocol LYViewDelegate <NSObject>

@optional
// 点击蒙板的时候调用
- (void)coverDidClickCover:(LYView *)cover;

@end

@interface LYView : UIView
/**
 *  显示蒙板
 */
+ (instancetype)show;

//// 设置浅灰色蒙板
//@property (nonatomic, assign) BOOL dimBackground;

@property (nonatomic, weak) id<LYViewDelegate> delegate;
@end
