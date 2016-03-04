//
//  UIViewController+extence.m
//  Runtimetest
//
//  Created by wujianqiang on 16/3/2.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "UIViewController+extence.h"
#import <objc/runtime.h>

typedef void (* _VIMP)(id,SEL,...);
typedef id (* _IMP)(id,SEL,...);

@implementation UIViewController (extence)


//+ (void)load{
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method viewDidLoad = class_getClassMethod(self, @selector(viewDidLoad));
//        _VIMP viewDidLoad_imp = (_VIMP)method_getImplementation(viewDidLoad);
//        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL action){
//            viewDidLoad_imp(target,@selector(viewDidLoad));
//            NSLog(@"%@  ----did load",target);
//        }));
//    });
//}

//+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method viewDidLoad = class_getClassMethod(self, @selector(viewDidLoad));
//        _IMP viewDidLoad_IMP = (_IMP)method_getImplementation(viewDidLoad);
//        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL action){
//            viewDidLoad_IMP(target,@selector(viewDidLoad));
//            NSLog(@"%@ did load",target );
//        }));
//    });
//}


//+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method viewDidLoad = class_getClassMethod(self,@selector(viewDidLoad));
//        Method viewDidLoaded = class_getInstanceMethod(self, @selector(viewDidLoaded));
//        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
//    });
//}
//
//- (void)viewDidLoaded{
//    [self viewDidLoad];
//    NSLog(@"11111 ");
//}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod(class,swizzledSelector,method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear--------: %@", self);
}


@end
