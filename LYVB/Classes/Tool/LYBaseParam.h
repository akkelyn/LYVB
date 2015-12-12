//
//  LYBaseParam.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBaseParam : NSObject
@property(nonatomic,copy)NSString *access_token;

+ (instancetype)baseParam;


@end
