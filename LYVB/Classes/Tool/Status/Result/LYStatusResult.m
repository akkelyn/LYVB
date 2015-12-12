//
//  LYStatusResult.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYStatusResult.h"
#import "LYStatus.h"
@implementation LYStatusResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[LYStatus class]};
}
@end
