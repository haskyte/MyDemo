//
//  WebViewController.m
//  ZBartest
//
//  Created by wujianqiang on 15/11/9.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)webView{
    if (!_webView) {
        self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [_webView setScalesPageToFit:NO];
        NSString *url = [NSString stringWithFormat:@"%@",self.data];
        [_webView loadHTMLString:url baseURL:[NSURL URLWithString:self.data]];
    }
    return _webView;
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
