//
//  LYRetweetView.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYRetweetView.h"
#import "LYStatus.h"
#import "LYStatusFrame.h"

@interface LYRetweetView ()

// 昵称
@property (nonatomic, weak) UILabel *nameView;


// 正文
@property (nonatomic, weak) UILabel *textView;

@end
@implementation LYRetweetView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_retweet_background"];
    }
    return self;
}


- (void)setUpAllChildView
{
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = LYNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
   
    UILabel *textView = [[UILabel alloc] init];
    textView.font = LYTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}

- (void)setStatusF:(LYStatusFrame *)statusF
{
    _statusF = statusF;
    
    
    LYStatus *status = statusF.status;
    
    _nameView.frame = statusF.retweetNameFrame;
    _nameView.text = status.retweeted_status.user.name;
   
    _textView.frame = statusF.retweetTextFrame;
    _textView.text = status.retweeted_status.text;
}

@end
