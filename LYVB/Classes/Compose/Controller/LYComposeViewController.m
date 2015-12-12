//
//  LYComposeViewController.m
//  LYVB
//
//  Created by lzz on 15-12-11.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYComposeViewController.h"
#import "LYTextView.h"
#import "LYComposeToolBar.h"

@interface LYComposeViewController ()<UITextViewDelegate>

@property(nonatomic,weak)UIButton *btnCompose;

@property(nonatomic,weak)LYTextView *txView;

@property(nonatomic,weak) LYComposeToolBar *toolBar;
@end

@implementation LYComposeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpNavigationBar];
    
    [self setUpTextView];
    
    [self setUpToolBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_txView becomeFirstResponder];
    
}

- (void)setUpToolBar{
    CGFloat h = 35;
    CGFloat y = self.view.height - h;
    LYComposeToolBar *toolBar = [[LYComposeToolBar alloc] initWithFrame:CGRectMake(0, y, self.view.width, h)];
    _toolBar = toolBar;
    [self.view addSubview:toolBar];

}
#pragma mark - 键盘改变
- (void)keyboardFrameChange:(NSNotification *)note
{
    
    CGFloat durtion = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (frame.origin.y == self.view.height) {
        [UIView animateWithDuration:durtion animations:^{
            
            _toolBar.transform =  CGAffineTransformIdentity;
        }];
    }else{
        [UIView animateWithDuration:durtion animations:^{
            
            _toolBar.transform = CGAffineTransformMakeTranslation(0, -frame.size.height);
        }];
    }
    
}

- (void)setUpTextView
{
    LYTextView *txView = [[LYTextView alloc]initWithFrame:self.view.bounds];
    
    txView.placeHolder = @"分享新鲜事";
    txView.font = [UIFont systemFontOfSize:15];
    txView.alwaysBounceVertical = YES;
    
    _txView = txView;
    [self.view addSubview:txView];
//注意通知得使用UITextViewTextDidChangeNotification，使用UITextViewTextDidBeginEditingNotification没有效果
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:nil];
    
     _txView.delegate = self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 拖拽调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)textChange
{
    if (_txView.text.length) {
        _txView.hidePlaceHolder = YES;
    }else{
        _txView.hidePlaceHolder = NO;
}
}

- (void)setUpNavigationBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissBack)];
 
    UIButton *btnCompose = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCompose setTitle:@"发送" forState:UIControlStateNormal];
    [btnCompose setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnCompose setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btnCompose sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btnCompose];
    rightItem.enabled = NO;
    
    _btnCompose = btnCompose;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.title = @"发送微博";

}
    
- (void)dismissBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)compose
{

}
    
@end
