//
//  ViewController.m
//  Runtimetest
//
//  Created by wujianqiang on 16/3/2.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "SecondViewController.h"
#import "MyClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"self.class = %@",self.class);
    NSLog(@"super.class = %@",super.class);
    

    [self performSelector:@selector(dosomething)];
    [self performSelector:@selector(showtext)];
    [self performSelector:@selector(nextText)];
    [self ex_regiserClassPair];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 第一步
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(dosomething)) {
        NSLog(@"hehe");
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        class_addMethod([self class], sel, (IMP)newMethod,"i@:");
        return YES;
    }
    NSLog(@"-123");
    return [super resolveInstanceMethod:sel];
}

// 第二步
- (id)forwardingTargetForSelector:(SEL)aSelector{
    Class class = NSClassFromString(@"SecondViewController");
    UIViewController *secondVC = class.new;
    if (aSelector == NSSelectorFromString(@"showtext")) {

        return secondVC;
    }
    return nil;
}

// 第三步
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    if ([SecondViewController instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:secondVC];
    }
}
/* 重写这个方法 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([SecondViewController instancesRespondToSelector:aSelector]) {
            signature = [SecondViewController instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}


void dynamicMethodIMP (id self, SEL _cmd){
    NSLog(@"doSomething SEL");
}

int newMethod (id self,SEL _cmd){
    NSLog(@"new method");
    return 100;
}

void TestMetaClass(id self,SEL _cmd){
    NSLog(@"this object is %p",self);
    NSLog(@"class is %@ , super class is %@",[self class],[self superclass]);
    
    Class currentClass = [self class];
    for (int i = 0; i < 4; i ++) {
        NSLog(@"following the isa pointer %d times gives %p  class is %@",i,currentClass,[currentClass class]);
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    
    NSLog(@"NSObject's class is %p",[NSObject class]);
    // 打印NSObject的元类
    NSLog(@"NSObject's meta class is %p",objc_getClass((__bridge void *)[NSObject class]));
}


- (void)ex_regiserClassPair{
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(TestMetaClass),(IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(TestMetaClass)];
    
}

//static char kDTActionHandlerTapGestureKey;
//- (void)setTapActionWithBlock:(void(^)())block{
//    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
//    if (!tap) {
//        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
//        [self addGestureRecognizer:tap];
//        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, tap, OBJC_ASSOCIATION_RETAIN);
//    }
//    objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, block, OBJC_ASSOCIATION_COPY);
//}
//
//- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)tap{
//    if (tap.state == UIGestureRecognizerStateRecognized) {
//        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
//        if (action) {
//            action();
//        }
//    }
//}


@end
