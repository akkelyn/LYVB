//
//  LYNavigationController.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYNavigationController.h"

@interface LYNavigationController ()

@end

@implementation LYNavigationController

+ (void)initialize
{
    
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
