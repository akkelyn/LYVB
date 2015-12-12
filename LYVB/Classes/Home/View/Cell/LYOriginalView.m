//
//  LYOriginalView.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYOriginalView.h"
#import "LYStatusFrame.h"
#import "LYStatus.h"

#import "UIImageView+WebCache.h"

@interface LYOriginalView ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *nameView;

@property (nonatomic, weak) UIImageView *vipView;

@property (nonatomic, weak) UILabel *timeView;

@property (nonatomic, weak) UILabel *sourceView;

@property (nonatomic, weak) UILabel *textView;


@end


@implementation LYOriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_card_top_background"];
        
    }
    return self;
}

- (void)setUpAllChildView
{
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = LYNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
   
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    _vipView = vipView;
   
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = LYTimeFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
   
    UILabel *sourceView = [[UILabel alloc] init];
    sourceView.font = LYSourceFont;
    [self addSubview:sourceView];
    _sourceView = sourceView;
  
    UILabel *textView = [[UILabel alloc] init];
    textView.font = LYTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}

- (void)setStatusF:(LYStatusFrame *)statusF
{
    _statusF = statusF;
    
    [self setUpFrame];
    
    [self setUpData];
    
}

- (void)setUpData
{
    LYStatus *status = _statusF.status;
    
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    if (status.user.vip) {
        _nameView.textColor = [UIColor redColor];
    }else{
        _nameView.textColor = [UIColor blackColor];
    }
    _nameView.text = status.user.name;
    
    NSString *imageName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    UIImage *image = [UIImage imageNamed:imageName];
    
    _vipView.image = image;
    
    _timeView.text = status.created_at;
   
    _sourceView.text = status.source;
    
    _textView.text = status.text;
}

- (void)setUpFrame
{
    _iconView.frame = _statusF.originalIconFrame;
    
    _nameView.frame = _statusF.originalNameFrame;
   
    if (_statusF.status.user.vip) {
        _vipView.hidden = NO;
        _vipView.frame = _statusF.originalVipFrame;
    }else{
        _vipView.hidden = YES;
    }
   
    _timeView.frame = _statusF.originalTimeFrame;
    
    _sourceView.frame = _statusF.originalSourceFrame;
    
    _textView.frame = _statusF.originalTextFrame;
    
    
}

@end
