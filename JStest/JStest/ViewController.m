//
//  ViewController.m
//  JStest
//
//  Created by wujianqiang on 16/5/25.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"


@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIWebView *)webView{
    if (_webView == nil) {
        self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//        _webView.scalesPageToFit = NO;
//        NSURL *url = [[NSBundle mainBundle] URLForResource:@"testNative" withExtension:@"html"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        [_webView loadRequest:request];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.3.194/h5/uc/activity/testNative.html"]]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"warning = %@", exceptionValue);
    };
    
//    __weak __typeof(self) weakSelf = self;
//    self.jsContext[@"jsCallLogin"] = ^(){
//        LoginViewController *loginVC = [[LoginViewController alloc] init];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf.navigationController pushViewController:loginVC animated:YES];
//        });
//    };
    
//    self.jsContext[@"setToken"] = ^(){
//    [self.jsContext evaluateScript:[NSString stringWithFormat:@"var argument = ",@"1212312342134"]];

    [self.jsContext evaluateScript:[NSString stringWithFormat:@"setJavaScriptToken('%@')",@"12123123qwe42134"]];
//        [currentValue callWithArguments:@[@"123"]];
//    };
    

}


@end
