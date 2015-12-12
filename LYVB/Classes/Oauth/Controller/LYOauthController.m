//
//  LYOauthController.m
//  LYVB
//
//  Created by lzz on 15-12-4.
//  Copyright (c) 2015年 lyn. All rights reserved.
//

#import "LYOauthController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

#import "LYAccount.h"
#import "LYAccountTool.h"
#import "LYRootTool.h"

#define LYAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define LYClient_id     @"2453569513"
#define LYRedirect_uri  @"http://www.baidu.com"
#define LYClient_secret @"b1b4da206d2797e874a761469834764e"
@interface LYOauthController ()<UIWebViewDelegate>

@end

@implementation LYOauthController

//https://api.weibo.com/oauth2/authorize  ？client_id=&redirect_uri=
//
//参数：client_id  申请应用时分配的AppKey:2453569513
//redirect_uri  授权回调地址  http://www.baidu.com
//
//App Secret：b1b4da206d2797e874a761469834764e

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *baseUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"2453569513";
    NSString *redirect_uri = @"http://www.baidu.com";
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    NSString *str = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    NSURL  *url = [NSURL URLWithString:str];
    NSURLRequest *URlRequest = [NSURLRequest requestWithURL:url];
   
    [webView loadRequest:URlRequest];
    
    webView.delegate = self;
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在下载"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

//https://api.weibo.com/oauth2/authorize?client_id=2453569513&redirect_uri=http://www.baidu.com
//code = 6bbb0ef7ae275c6cce94afdcff41fc18
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *reStr = request.URL.absoluteString;
    
    NSRange range = [reStr rangeOfString:@"code="];
    
    if (range.length) {
        NSString *code = [reStr substringFromIndex:range.length+range.location];
//        NSLog(@"%@",code);
       [self accessTokenWithCode:code];
        return NO;
    }
//    NSLog(@"%@",reStr);

    return YES;
}

//"access_token" = "2.00icN5CDpVvCgC3f8a05095alCC1KE";
//"expires_in" = 157679999;
//"remind_in" = 157679999;
//uid = 2783723412;

- (void)accessTokenWithCode:(NSString *)code
{
    [LYAccountTool accountWithCode:code success:^{
        // 进入主页或者新特性,选择窗口的根控制器
        [LYRootTool chooseRootViewController:LYKeyWindow];
    } failure:^(NSError *error) {
        
    }];
    
}

@end
