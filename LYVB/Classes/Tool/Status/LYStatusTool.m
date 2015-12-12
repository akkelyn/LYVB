//
//  LYStatusTool.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYStatusTool.h"
#import "LYHttpTool.h"
#import "LYStatus.h"

#import "LYAccountTool.h"
#import "LYAccount.h"
#import "LYStatusParam.h"

#import "LYStatusResult.h"
#import "MJExtension.h"

@implementation LYStatusTool

+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    LYStatusParam *param = [[LYStatusParam alloc] init];
    param.access_token = [LYAccountTool account].access_token;
    if (sinceId) { // 有微博数据，才需要下拉刷新
        param.since_id = sinceId;
        
    }
    
    [LYHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.mj_keyValues success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        
        LYStatusResult *result = [LYStatusResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    LYStatusParam *param = [[LYStatusParam alloc] init];
    
    param.access_token = [LYAccountTool account].access_token;
    if (maxId) { // 有微博数据，才需要下拉刷新
        param.max_id = maxId;
        
    }
    
    [LYHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.mj_keyValues success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        
        // 把结果字典转换结果模型
        LYStatusResult *result = [LYStatusResult mj_objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
