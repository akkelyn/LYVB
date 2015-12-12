//
//  LYStatusFrame.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYStatus.h"

@interface LYStatusFrame : NSObject

@property (nonatomic, strong) LYStatus *status;

// 原创微博frame及子控件
@property (nonatomic, assign) CGRect originalViewFrame;

@property (nonatomic, assign) CGRect originalIconFrame;

@property (nonatomic, assign) CGRect originalNameFrame;

@property (nonatomic, assign) CGRect originalVipFrame;

@property (nonatomic, assign) CGRect originalTimeFrame;

@property (nonatomic, assign) CGRect originalSourceFrame;

@property (nonatomic, assign) CGRect originalTextFrame;

@property (nonatomic, assign) CGRect originalPhotosFrame;


// 转发微博frame及子控件
@property (nonatomic, assign) CGRect retweetViewFrame;

@property (nonatomic, assign) CGRect retweetNameFrame;

@property (nonatomic, assign) CGRect retweetTextFrame;

@property (nonatomic, assign) CGRect retweetPhotosFrame;

@property (nonatomic, assign) CGRect toolBarFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@end
