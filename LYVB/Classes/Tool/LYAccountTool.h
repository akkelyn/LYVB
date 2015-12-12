//
//  LYAccountTool.h
//  LYVB
//
//  Created by lzz on 15-12-5.
//  用户账号存储取

#import <Foundation/Foundation.h>

@class LYAccount;
@interface LYAccountTool : NSObject

+ (void)saveAccount:(LYAccount *)account;

+ (LYAccount *)account;

+ (void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;
@end

