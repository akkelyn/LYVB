//
//  LYAccount.h
//  LYVB
//
//  Created by lzz on 15-12-5.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYAccount : NSObject<NSCopying>
//"access_token" = "2.00icN5CDpVvCgC3f8a05095alCC1KE";
//"expires_in" = 157679999;
//"remind_in" = 157679999;
//uid = 2783723412;
/**
 *获取数据的访问命令牌
 */
@property(nonatomic,copy)NSString *access_token;

/**
 *  账号的有效期
 */

@property(nonatomic,copy)NSString *expires_in;

/**
 *   账号的有效期
 */
@property(nonatomic,copy)NSString *remind_in;

/**
 *  用户唯一标识符
 */
@property(nonatomic,copy)NSString *uid;

/**
 *   过期时间 = 当前保存时间+有效期
 */
@property (nonatomic, strong) NSDate *expires_date;
/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;


+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
