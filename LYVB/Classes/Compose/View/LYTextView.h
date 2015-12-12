//
//  LYTextView.h
//  LYVB
//
//  Created by lzz on 15-12-12.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LYTextView : UITextView
@property(nonatomic,copy)NSString *placeHolder;

@property (nonatomic, assign) BOOL hidePlaceHolder;
@end
