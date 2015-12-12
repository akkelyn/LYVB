//
//  LYAccountParam.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYAccountParam : NSObject

@property(nonatomic, copy) NSString *client_id;

@property(nonatomic, copy) NSString *client_secret;

@property(nonatomic, copy) NSString *grant_type;

@property(nonatomic, copy) NSString *code;

@property(nonatomic, copy) NSString *redirect_uri;

@end
