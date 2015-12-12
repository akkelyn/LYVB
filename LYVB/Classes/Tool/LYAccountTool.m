//
//  LYAccountTool.m
//  LYVB
//
//  Created by lzz on 15-12-5.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYAccountTool.h"
#import "LYAccount.h"
#import "LYAccountParam.h"

#import "LYHttpTool.h"
#import "MJExtension.h"

#define LYAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define LYClient_id     @"2453569513"
#define LYRedirect_uri  @"http://www.baidu.com"
#define LYClient_secret @"b1b4da206d2797e874a761469834764e"
#define LYAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation LYAccountTool

static LYAccount *_account;
+ (void)saveAccount:(LYAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:LYAccountFileName];
}

+ (LYAccount *)account
{
    if (_account == nil) {
        
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:LYAccountFileName];
        
        // 判断下账号是否过期，如果过期直接返回Nil
                if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) { // 过期
            return nil;
        }
    }
    
    return _account;
}

+ (void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    LYAccountParam *param = [[LYAccountParam alloc] init];
    param.client_id = LYClient_id;
    param.client_secret = LYClient_secret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = LYRedirect_uri;
    
    [LYHttpTool Post:@"https://api.weibo.com/oauth2/access_token" parameters:param.mj_keyValues success:^(id responseObject) {
        // 字典转模型
        LYAccount *account = [LYAccount accountWithDict:responseObject];
        
        // 保存账号信息:
        // 数据存储一般我们开发中会搞一个业务类，专门处理数据的存储
        // 以后我不想归档，用数据库，直接改业务类
        [LYAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end


