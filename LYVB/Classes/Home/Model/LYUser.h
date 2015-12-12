//
//  LYUser.h
//  LYVB
//
//  Created by lzz on 15-12-6.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYUser : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSURL *profile_image_url;

@property (nonatomic, assign) int mbtype;

@property (nonatomic, assign) int mbrank;

@property (nonatomic, assign,getter=isVip) BOOL vip;@end
