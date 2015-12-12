//
//  LYBaseParam.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYBaseParam.h"
#import "LYAccountTool.h"
#import "LYAccount.h"

@implementation LYBaseParam


+ (instancetype)baseParam{
    LYBaseParam *param = [[self alloc]init];

    param.access_token = [LYAccountTool account].access_token;
    
    return param;
}
@end
