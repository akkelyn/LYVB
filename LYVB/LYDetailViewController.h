//
//  LYDetailViewController.h
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
