//
//  DetailViewController.m
//  Start
//
//  Created by anywhere on 15/8/12.
//  Copyright (c) 2015年 anywhere. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIWebViewDelegate>
{
    UIWebView *_startWebView;
    UIActivityIndicatorView *_activityIV;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _titleStr;
    [self makeTwoNav];
    [self makeWebView];
    // Do any additional setup after loading the view.
}

-(void)makeTwoNav{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 22, 22);
//    [leftButton setTitle:@"back" forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"nav_back_image"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backToTopView) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(leftButton.right, 0, 40, 22);
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeViewC) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    NSArray *items = @[leftItem,closeItem];
    
    self.navigationItem.leftBarButtonItems = items;
    
    
    
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(leftButton.right, 0, 20, 22);
//    [shareButton setTitle:@"back" forState:UIControlStateNormal];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"shareNew"] forState:UIControlStateNormal];
//    [shareButton setBackgroundColor:[UIColor redColor]];
    [shareButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareToOther) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = shareItem;
    
    
}

-(void)backToTopView{
    if ([_startWebView canGoBack]) {
        [_startWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)closeViewC{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)shareToOther{
    
}

-(void)makeWebView{
    _startWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _startWebView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
    [_startWebView loadRequest:request];
    _startWebView.scalesPageToFit = YES;
    [self.view addSubview:_startWebView];
    [self makeActivityIV];
}


-(void)makeActivityIV{
    _activityIV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIV.frame = CGRectMake(0, 0, 32, 32);
    _activityIV.center = _startWebView.center;
    [_activityIV isAnimating];
    [_startWebView addSubview:_activityIV];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_activityIV stopAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIV stopAnimating];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIV startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
