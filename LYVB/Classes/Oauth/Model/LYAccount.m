//
//  LYAccount.m
//  LYVB
//
//  Created by lzz on 15-12-5.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYAccount.h"
#import "MJExtension.h"

#define LYAccountTokenKey @"token"
#define LYUidKey @"uid"
#define LYExpires_inKey @"expires"
#define LYExpires_dateKey @"date"
#define LYNameKey @"name"


@implementation LYAccount


+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    LYAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dict];
    
    return account;
}

- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    
    // 计算过期的时间
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:LYAccountTokenKey];
    [aCoder encodeObject:_expires_in forKey:LYExpires_inKey];
    [aCoder encodeObject:_uid forKey:LYUidKey];
    [aCoder encodeObject:_expires_date forKey:LYExpires_dateKey];
    [aCoder encodeObject:_name forKey:LYNameKey];
}



- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        _access_token =  [aDecoder decodeObjectForKey:LYAccountTokenKey];
        _expires_in = [aDecoder decodeObjectForKey:LYExpires_inKey];
        _uid = [aDecoder decodeObjectForKey:LYUidKey];
        _expires_date = [aDecoder decodeObjectForKey:LYExpires_dateKey];
        _name = [aDecoder decodeObjectForKey:LYNameKey];
    }
    return self;
}



@end
