//
//  LYStatus.h
//  LYVB
//
//  Created by lzz on 15-12-6.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "LYUser.h"

@interface LYStatus : NSObject<MJKeyValue>


/**
 *  转发微博
 */
@property (nonatomic, strong) LYStatus *retweeted_status;

/**
 *  用户
 */
@property (nonatomic, strong) LYUser *user;

/**
 *  微博创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博信息内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *  微博来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  转发数
 */
@property (nonatomic, assign) int reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign) int comments_count;

/**
 *  表态数(赞)
 */
@property (nonatomic, assign) int attitudes_count;

/**
 *  配图数组(LYPhotoes)
 */
@property (nonatomic, strong) NSArray *pic_urls;
/**
 *  转发微博昵称
 */
@property (nonatomic, copy) NSString *retweetName;

@end
