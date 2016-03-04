//
//  main.m
//  JSBinding
//
//  Created by wujianqiang on 16/3/1.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        JSContext *context = [[JSContext alloc] init];
        
        NSString * script;
        /* JS异常处理器 */
//        context.exceptionHandler = ^(JSContext *ctxt,JSValue *exception){
//            NSLog(@"%@",exception);
//        };
//        
        context.exceptionHandler = ^(JSContext *jscontext,JSValue *exception){
            NSLog(@"%@",exception);
        };
        
        
        JSValue *result = [context evaluateScript:@"1 + 2 "];
        NSLog(@"%@",result);
        
        // var globalVar = 2 * 3
        [context evaluateScript:@"var globalVar = 2 * 3;"];
        NSLog(@"globalVar = %@",context[@"globalVar"]);
        
        [context evaluateScript:@"var but = 2 + 3;"];
        NSLog(@"but = %d",[context[@"but"] toInt32]);
        
        // 函数
        script = @"function sum(a,b){return a + b;}";
        // 将字符串script塞进 <script></script>
        [context evaluateScript:script];
        JSValue *sum = context[@"sum"];
        JSValue *sumValue = [sum callWithArguments:@[@4,@2]];
        NSLog(@"sum = %d",[sumValue toInt32]);
        
        
        
        // 在script环境创建一个double值
        JSValue *foo = [JSValue valueWithDouble:123.45 inContext:context];
        // 在script环境定义一个foo  var foo = 123.45;
        context[@"foo"] = foo;
        // 将foo++; 塞进script环境
        [context evaluateScript:@"foo++;"];
        // 获取foo的值
        JSValue *fooValue = context[@"foo"];
        // 转换成doubel对象
        NSLog(@"f00 = %f",[fooValue toDouble]);
        
        
        
        // function sub(a,b){return a>b?a-b:b-a;};
        context[@"sub"] = ^(int a, int b){
//            JSContext *currentContext = [JSContext currentContext]; // currentArguments currentThis
            return a>b?a-b:b-a;
        };
        // 1调用函数
        JSValue *subValue = [context evaluateScript:@"sub(7,2);"];
        NSLog(@"%f",[subValue toDouble]);
        // 2调用函数
        JSValue *subbb = [context[@"sub"] callWithArguments:@[@9,@18]];
        NSLog(@"%f",[subbb toDouble]);
        
    }
    return 0;
}

void loadScript(JSContext *context, NSString *fileName){
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],fileName];
    NSString *script =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:script];
}
