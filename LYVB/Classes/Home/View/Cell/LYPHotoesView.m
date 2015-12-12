//
//  LYPHotoesView.m
//  LYVB
//
//  Created by lzz on 15-12-10.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYPHotoesView.h"
#import "LYPhotoes.h"
#import "UIImageView+WebCache.h"

@implementation LYPHotoesView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        
        [self setUpAllChildView];
        
    }
    return self;
}



- (void)setUpAllChildView
{
    for (int i = 0; i < 9; i++) {
#warning TODO：设置配图的内容模式
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
      
        imageV.clipsToBounds = YES;
        [self addSubview:imageV];
    }
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    // 4
    _pic_urls = pic_urls;
    int count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        
        UIImageView *imageV = self.subviews[i];
        
        if (i < _pic_urls.count) {
            imageV.hidden = NO;
            
            LYPhotoes *photo = _pic_urls[i];
          
            [imageV sd_setImageWithURL:photo.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            
        }else{
            imageV.hidden = YES;
        }
        
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    int col = 0;
    int rol = 0;
    int cols = _pic_urls.count==4?2:3;
   
    for (int i = 0; i < _pic_urls.count; i++) {
        col = i % cols;
        rol = i / cols;
        UIImageView *imageV = self.subviews[i];
        x = col * (w + margin);
        y = rol * (h + margin);
        imageV.frame = CGRectMake(x, y, w, h);
    }
    
    
}@end
