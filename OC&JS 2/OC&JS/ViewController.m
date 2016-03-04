//
//  ViewController.m
//  OC&JS
//
//  Created by wujianqiang on 16/2/24.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,JSObjecDelegate>
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

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//        _webView.scalesPageToFit = YES;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"text" withExtension:@"html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        _webView.delegate = self;
    }
    
    return _webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"ocmodel"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
}

/* js 调用 OC*/
- (void)touchMe:(NSDictionary *)paramater{
    NSLog(@"%@",paramater);
    
    /* OC 调用 js*/
    JSValue *jsfunction = self.jsContext[@"changeValue"];
    [jsfunction callWithArguments:@[paramater]];
}


@end
