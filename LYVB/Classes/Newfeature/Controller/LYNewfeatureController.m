//
//  LYNewfeatureController.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYNewfeatureController.h"
#import "LYNewFeatureCell.h"

@interface LYNewfeatureController ()
@property (nonatomic, weak) UIPageControl *control;

@end

@implementation LYNewfeatureController

static NSString *ID = @"cell";
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
   
    layout.itemSize = [UIScreen mainScreen].bounds.size;
  
    layout.minimumLineSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[LYNewFeatureCell class] forCellWithReuseIdentifier:ID];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    
    [self setUpPageControl];
}
// 添加pageController
- (void)setUpPageControl
{
        UIPageControl *control = [[UIPageControl alloc] init];
    
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    

    control.center = CGPointMake(self.view.width * 0.5, self.view.height);
    _control = control;
    [self.view addSubview:control];
}

#pragma mark - UIScrollView代理
// 只要一滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    
    _control.currentPage = page;
}
#pragma mark - UICollectionView代理和数据源

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",indexPath.row + 1];
//    if (screenH > 480) { // 5 , 6 , 6 plus
//        imageName = [NSString stringWithFormat:@"new_feature_%d-568h",indexPath.row + 1];
//    }
    
    cell.image = [UIImage imageNamed:imageName];
    LYLog(@"%@",cell.image);
    [cell setIndexPath:indexPath count:4];
    
    
    return cell;
    
}


@end
