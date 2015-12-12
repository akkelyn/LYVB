//
//  LYTextView.m
//  LYVB
//
//  Created by lzz on 15-12-12.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYTextView.h"

@interface LYTextView ()
@property (nonatomic, weak) UILabel *placeHolderLabel;

@end


@implementation LYTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (UILabel *)placeHolderLabel
{
    if (_placeHolderLabel == nil) {
        
        UILabel *label = [[UILabel alloc] init];
        
        
        [self addSubview:label];
        
        _placeHolderLabel = label;
        
    }
    
    return _placeHolderLabel;
}


- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    
    self.placeHolderLabel.text = placeHolder;
    self.placeHolderLabel.textColor = [UIColor lightGrayColor];
    [self.placeHolderLabel sizeToFit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeHolderLabel.x = 5;
    self.placeHolderLabel.y = 8;
    
//    LYLog(@"%@",self.font);
  
}

- (void)setHidePlaceHolder:(BOOL)hidePlaceHolder
{
    _hidePlaceHolder = hidePlaceHolder;
    
    self.placeHolderLabel.hidden = hidePlaceHolder;
    
}


@end
