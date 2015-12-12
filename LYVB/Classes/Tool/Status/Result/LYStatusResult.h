//
//  LYStatusResult.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface LYStatusResult : NSObject<MJKeyValue>
/**
 *  用户的微博数组（CZStatus）
 */
@property (nonatomic, strong) NSArray *statuses;
/**
 *  用户最近微博总数
 */
@property (nonatomic, assign) int total_number;
@end
