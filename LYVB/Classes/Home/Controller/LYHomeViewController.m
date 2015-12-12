//
//  LYHomeViewController.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYHomeViewController.h"
#import "LYOneViewController.h"
#import "UIBarButtonItem+Item.h"

#import "LYTitleButton.h"
#import "LYPopMenu.h"
#include "LYView.h"

#import "LYStatusTool.h"
#import "LYAccountTool.h"
#import "LYAccount.h"

#import "LYStatus.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

#import "LYHttpTool.h"
#import "UIView+Frame.h"
#import "LYUserTool.h"

#import "LYStatusFrame.h"
#import "LYStatusCell.h"

@interface LYHomeViewController ()<LYViewDelegate>

@property (nonatomic, weak) LYTitleButton *titleButton;

@property (nonatomic, strong) LYOneViewController *one;

@property (nonatomic, strong) NSMutableArray *statusFrameArr;

@end

@implementation LYHomeViewController

- (LYOneViewController *)one
{
    if (_one == nil) {
        _one = [[LYOneViewController alloc] init];
    }
    
    return _one;
}

- (NSMutableArray *)statusFrameArr
{
    if (_statusFrameArr == nil) {
        _statusFrameArr = [NSMutableArray array];
    }
    return _statusFrameArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setUpNavgationBar];
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatues)];
    
    [self.tableView headerBeginRefreshing];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatues)];

    [LYUserTool userInfoWithSuccess:^(LYUser *user) {
        
        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
 
        LYAccount *account = [LYAccountTool account];
        account.name = user.name;
        
        [LYAccountTool saveAccount:account];
        
        
    } failure:^(NSError *error) {
        
    }];

}

/**
 MJ友情提示：
 1. 添加头部控件的方法
 [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
 或者
 [self.tableView addHeaderWithCallback:^{ }];
 
 2. 添加尾部控件的方法
 [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
 或者
 [self.tableView addFooterWithCallback:^{ }];
 
 3. 可以在MJRefreshConst.h和MJRefreshConst.m文件中自定义显示的文字内容和文字颜色
 
 4. 本框架兼容iOS6\iOS7，iPhone\iPad横竖屏
 
 5.自动进入刷新状态
 1> [self.tableView headerBeginRefreshing];
 2> [self.tableView footerBeginRefreshing];
 
 6.结束刷新
 1> [self.tableView headerEndRefreshing];
 2> [self.tableView footerEndRefreshing];
 */
- (void)refresh{
    
    [self.tableView headerBeginRefreshing];
}
#pragma-下拉刷新
- (void)loadNewStatues
{
    NSString *sinceId = nil;
    if (self.statusFrameArr.count) {
        LYStatus *ST = [self.statusFrameArr[0] status];
        sinceId = ST.idstr;
    }
    
    [LYStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses) {
        
        [self showNewStatusCount:statuses.count];
     
        [self.tableView headerEndRefreshing];
   
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (LYStatus *status in statuses) {
            LYStatusFrame *statusF = [[LYStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
        }
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statusFrameArr insertObjects:statusFrames atIndexes:indexSet];
 
        [self.tableView reloadData];

    } failure:^(NSError *error) {
        
    }];
    
}
-(void)showNewStatusCount:(int)count
{
    if (count == 0) return;

    CGFloat h = 35;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - h;
    CGFloat x = 0;
    CGFloat w = self.view.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"最新微博数%d",count];
    
    label.textAlignment = NSTextAlignmentCenter;
  
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];

    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
        
    } completion:^(BOOL finished) {

        [UIView animateWithDuration:0.25 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
  
            label.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
        
    }];
    
}


#pragma-上拉
-(void)loadMoreStatues
{
    NSString *maxIdStr = nil;
    if (self.statusFrameArr.count) {
        LYStatus *ST = [[self.statusFrameArr lastObject] status];
        long long maxId = [ST.idstr longLongValue] - 1;
        maxIdStr = [NSString stringWithFormat:@"%lld",maxId];
    }
 
    [LYStatusTool moreStatusWithMaxId:maxIdStr success:^(NSArray *statuses) {
       
        [self.tableView footerEndRefreshing];

        NSMutableArray *statusFrames = [NSMutableArray array];
        for (LYStatus *status in statuses) {
           LYStatusFrame *statusF = [[LYStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
        }

        [self.statusFrameArr addObjectsFromArray:statusFrames];
     
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];;
        
}

- (void)setUpNavgationBar
{
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    // 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    // titleView
    LYTitleButton *titleButton = [LYTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    
    NSString *title = [LYAccountTool account].name?:@"首页";
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    titleButton.adjustsImageWhenHighlighted = NO;
    
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}


- (void)titleClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    // 弹出蒙板
    LYView *cover = [LYView show];
    cover.delegate = self;
    
    
    // 弹出pop菜单
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200) * 0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    LYPopMenu *menu = [LYPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.one.view;
    
    
}

#pragma-点击蒙板的时候调用
- (void)coverDidClickCover:(LYView *)cover
{
    [LYPopMenu hide];
    
    _titleButton.selected = NO;
    
}

- (void)friendsearch
{
    
}

- (void)pop
{
    //    [_titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [_titleButton setImage:nil forState:UIControlStateNormal];
    //    [_titleButton sizeToFit];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

   return self.statusFrameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYStatusFrame *statusF = self.statusFrameArr[indexPath.row];
    
     return statusF.cellHeight;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYStatusCell *cell = [LYStatusCell cellWithTableView:tableView];

    LYStatusFrame *statusF = self.statusFrameArr[indexPath.row];
    
    cell.statusF = statusF;
 
    
    return cell;

}



@end
