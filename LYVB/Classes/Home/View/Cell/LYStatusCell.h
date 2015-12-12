//
//  LYStatusCell.h
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYStatusFrame;

@interface LYStatusCell : UITableViewCell

@property (nonatomic, strong) LYStatusFrame *statusF;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
