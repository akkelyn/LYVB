//
//  LYUser.m
//  LYVB
//
//  Created by lzz on 15-12-6.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYUser.h"

@implementation LYUser

- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}
@end
