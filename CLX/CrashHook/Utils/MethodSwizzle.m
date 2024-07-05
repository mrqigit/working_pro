//
//  MethodSwizzle.m
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

#import "MethodSwizzle.h"
#import <objc/runtime.h>

@implementation MethodSwizzle

/// hook类方法
/// - Parameters:
///   - cls: 需要hook的类
///   - originSelector: 目标方法
///   - newSelector: 替换方法
void swizzleClassMethod(Class cls, SEL originSelector, SEL newSelector) {
    if (!cls) return;
    
    Class resCls = getClassMethodOriginClass(cls, originSelector);
    
    if (resCls == nil) return;
    
    Method originMethod = class_getClassMethod(resCls, originSelector);
    Method newMethod = class_getClassMethod(resCls, newSelector);
    
    BOOL canAddMethod = class_addMethod(resCls, newSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    if (canAddMethod) {
        class_replaceMethod(resCls, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    } else {
        method_exchangeImplementations(originMethod, newMethod);
    }
}

/// hook对象方法
/// - Parameters:
///   - cls: 需要hook的类
///   - originSelector: 目标方法
///   - newSelector: 替换方法
void swizzleInstanceMethod(Class cls, SEL originSelector, SEL newSelector) {
    if (!cls) return;
    
    Class resCls = getInstanceMethodOriginClass(cls, originSelector);
    
    if (resCls == nil) return;
    
    Method originMethod = class_getInstanceMethod(resCls, originSelector);
    Method newMethod = class_getInstanceMethod(resCls, newSelector);
    
    BOOL canAddMethod = class_addMethod(resCls, newSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    if (canAddMethod) {
        class_replaceMethod(resCls, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    } else {
        method_exchangeImplementations(originMethod, newMethod);
    }
}

Class getInstanceMethodOriginClass(Class cls,SEL selector) {
    Class resCls = cls;
    BOOL canContiun = YES;
    do {
        BOOL hasMethod = class_respondsToSelector(resCls, selector);
        if (hasMethod) {
            canContiun = NO;
        } else if (resCls == class_getSuperclass(resCls)) {
            resCls = nil;
            canContiun = NO;
        } else {
            resCls = class_getSuperclass(resCls);
        }
        
    } while (canContiun);
    
    if (resCls == nil) NSLog(@"方法继承链，不存在该方法，请检查%@",NSStringFromSelector(selector));
    return resCls;
}

Class getClassMethodOriginClass(Class cls,SEL selector) {
    Class resCls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    BOOL canContiun = YES;
    do {
        BOOL hasMethod = class_respondsToSelector(resCls, selector);
        if (hasMethod) {
            canContiun = NO;
        } else if (resCls == class_getSuperclass(resCls)) {
            resCls = nil;
            canContiun = NO;
        } else {
            resCls = class_getSuperclass(resCls);
        }
        
    } while (canContiun);
    
    if (resCls == nil) NSLog(@"方法继承链，不存在该方法，请检查%@",NSStringFromSelector(selector));
    return resCls;
}

@end
