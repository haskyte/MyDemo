//
//  main.m
//  runtime
//
//  Created by wujianqiang on 16/3/2.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "MyClass.h"

void imp_submethod1(id self, IMP _cmd){
    NSLog(@"call  submethod1");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MyClass *myClass = [[MyClass alloc] init];
        unsigned int outCount = 0;
        
        Class cls = myClass.class;
        // 类名
        NSLog(@"class name is %s",class_getName(cls));
        
        // 父类
        NSLog(@"super class name is %s",class_getName(class_getSuperclass(cls)));
        
        //是否元类
        NSLog(@"MyClass is %s a meta-class",(class_isMetaClass(cls)?"":"not"));
        Class meta_class = objc_getMetaClass(class_getName(cls));
        NSLog(@"%s's meta-class is %s",class_getName(cls),class_getName(meta_class));
        
        // 变量实例大小
        NSLog(@"instance size = %zu",class_getInstanceSize(cls));
        
        // 成员变量
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        for (int i = 0; i < outCount; i ++) {
            Ivar ivar = ivars[i];
            NSLog(@"ivar -----%s------%d",ivar_getName(ivar),i);
        }
        free(ivars);  // 必须释放
        
        Ivar string = class_getInstanceVariable(cls, "_string");
        if (string != NULL) {
            NSLog(@"intance variable %s",ivar_getName(string));
        }
        
        // 属性操作
        objc_property_t *properties = class_copyPropertyList(cls, &outCount);
        for (int i = 0 ; i < outCount; i ++) {
            objc_property_t property = properties[i];
            NSLog(@"property ------ %s ------- %d",property_getName(property),i);
        }
        free(properties);
        
        objc_property_t array = class_getProperty(cls, "array");
        if (array != NULL) {
            NSLog(@"property %s ",property_getName(array));
        }
        
        // 方法操作
        Method *methods = class_copyMethodList(cls, &outCount);
        for (int i = 0; i < outCount; i ++) {
            Method method = methods[i];
            NSLog(@"mothod ----- %s ---%d ",method_getName(method),i);
        }
        free(methods);
       
        Method method1 = class_getInstanceMethod(cls, @selector(method3WithArg1:arg2:));
        if (method1 != NULL) {
            NSLog(@"method is %s ",method_getName(method1));
        }
        
        
        NSLog(@" method3WithArg1:arg2: %s",class_respondsToSelector(cls, @selector(method3WithArg1:arg2:))?"":"not");
        
        IMP imp = class_getMethodImplementation(cls, @selector(method1));
        imp();
        
        // 协议
        Protocol *__unsafe_unretained * protocols = class_copyProtocolList(cls, &outCount);
        Protocol *protocol;
        for (int i = 0; i < outCount; i ++) {
            protocol = protocols[i];
            NSLog(@"protocol name %s ",protocol_getName(protocol));
        }
        
        NSLog(@"myclass is %@responsed to protocol %s ",class_conformsToProtocol(cls, protocol)?@"":@"not",protocol_getName(protocol));
        
        // 创建类
        
        Class subclass = objc_allocateClassPair(myClass.class, "MySubClass", 0);
        // 创建submethod1方法
        class_addMethod(subclass,@selector(submethod1), (IMP)imp_submethod1, "v@:");
        // 用submethod1方法替换父类的method1方法
        class_replaceMethod(subclass, @selector(method1), (IMP)imp_submethod1, "v@:");
        // 添加实例变量
        class_addIvar(subclass, "ivar1", sizeof(NSString *), log(sizeof(NSString *)), "i");
        

        objc_property_attribute_t type = {"T","@\"NSString\""};
        objc_property_attribute_t ownership = {"C",""};
        objc_property_attribute_t backingivar = {"V","_ivar1"};
        objc_property_attribute_t attrs[] = {type,ownership,backingivar};
        class_addProperty(subclass, "property2", attrs, 3);
        
        objc_registerClassPair(subclass);
        
        id instance = [[subclass alloc] init];
        [instance performSelector:@selector(submethod1)];
        [instance performSelector:@selector(method1)];
        
        
        // 创建对象

    }
    return 0;
}



