//
//  LYStatusCell.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYStatusCell.h"
#import "LYOriginalView.h"
#import "LYStatusToolbar.h"

#import "LYRetweetView.h"
#import "LYStatusFrame.h"

@interface LYStatusCell ()

@property (nonatomic, weak) LYOriginalView *originalView;
@property (nonatomic, weak) LYRetweetView *retweetView ;
@property (nonatomic, weak) LYStatusToolbar *toolBar;

@end

@implementation LYStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
    
}

- (void)setUpAllChildView
{
    LYOriginalView *originalView = [[LYOriginalView alloc] init];
    [self addSubview:originalView];
    _originalView = originalView;
    
    LYRetweetView *retweetView = [[LYRetweetView alloc] init];
    [self addSubview:retweetView];
    _retweetView = retweetView;
    
  LYStatusToolbar *toolBar = [[LYStatusToolbar alloc] init];
    [self addSubview:toolBar];
    _toolBar = toolBar;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        
    }
    
    return cell;
}


- (void)setStatusF:(LYStatusFrame *)statusF
{
    _statusF = statusF;
    
    _originalView.frame = statusF.originalViewFrame;
    _originalView.statusF = statusF;
    
    _retweetView.frame = statusF.retweetViewFrame;
    _retweetView.statusF = statusF;
    
    _toolBar.frame = statusF.toolBarFrame;
}
@end
