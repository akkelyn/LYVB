//
//  LYUserTool.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYUserTool.h"
#import "LYUserParam.h"
#import "LYUserResult.h"

#import "LYHttpTool.h"
#import "LYAccountTool.h"
#import "LYAccount.h"

#import "MJExtension.h"
#import "LYUser.h"

@implementation LYUserTool

+ (void)unreadWithSuccess:(void (^)(LYUserResult *))success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    LYUserParam *param = [LYUserParam baseParam];
    param.uid = [LYAccountTool account].uid;
    
    [LYHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.mj_keyValues success:^(id responseObject) {
        
        // 字典转换模型
        LYUserResult *result = [LYUserResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)userInfoWithSuccess:(void (^)(LYUser *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    LYUserParam *param = [LYUserParam baseParam];
    param.uid = [LYAccountTool account].uid;
    
    [LYHttpTool GET:@"https://api.weibo.com/2/users/show.json" parameters:param.mj_keyValues success:^(id responseObject) {
        
        // 用户字典转换用户模型
        LYUser *user = [LYUser mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(user);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

@end
