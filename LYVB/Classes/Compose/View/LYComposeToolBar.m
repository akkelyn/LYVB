//
//  LYComposeToolBar.m
//  LYVB
//
//  Created by lzz on 15-12-12.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYComposeToolBar.h"

@implementation LYComposeToolBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpChildView];
    }
    return self;
}

-(void)setUpChildView
{
    [self setUpButtonWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] highImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(btnClick)];
    
    [self setUpButtonWithImage:[UIImage imageNamed:@"compose_mentionbutton_background"] highImage:[UIImage imageNamed:@"compose_mentionbutton_background_highlighted"] target:self action:@selector(btnClick)];

    [self setUpButtonWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] highImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(btnClick)];
    
    [self setUpButtonWithImage:[UIImage imageNamed:@"compose_emoticonbutton_background" ]highImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] target:self action:@selector(btnClick)];

}
- (void)setUpButtonWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];


}
#pragma marak - 工具条按钮点击
- (void)btnClick
{


}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.width / self.subviews.count;
    CGFloat h = self.height;
    CGFloat x = 0;
    CGFloat y = 0;
        
    for (int i = 0 ; i < self.subviews.count; i++)
    {
        UIButton *btn = self.subviews[i];
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
    }
        
}

@end
