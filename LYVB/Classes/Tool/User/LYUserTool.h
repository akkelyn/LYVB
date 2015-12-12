//
//  LYUserTool.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LYUserResult,LYUser;
@interface LYUserTool : NSObject
+ (void)unreadWithSuccess:(void(^)(LYUserResult *result))success failure:(void(^)(NSError *error))failure;

/**
 *  请求用户的信息
 *
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)userInfoWithSuccess:(void(^)(LYUser *user))success failure:(void(^)(NSError *error))failure;
@end
