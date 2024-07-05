//
//  NSObject+Crash.m
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

#import "NSObject+Crash.h"
#import "MethodSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Crash)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleInstanceMethod([NSObject class], @selector(methodSignatureForSelector:), @selector(hook_methodSignatureForSelector:));
        swizzleInstanceMethod([NSObject class], @selector(forwardInvocation:), @selector(hook_forwardInvocation:));
    });
}

- (NSMethodSignature *)hook_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sign = [self hook_methodSignatureForSelector:aSelector];
    if (!sign) {
        if (class_getMethodImplementation([NSObject class], @selector(methodSignatureForSelector:)) != class_getMethodImplementation(self.class, @selector(methodSignatureForSelector:))) {
            return nil;
        }
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return sign;
}

- (void)hook_forwardInvocation:(NSInvocation *)anInvocation {
    NSString *info = [NSString stringWithFormat:@"类为:%@的对象:%@调用了方法%@，但是该方法没有实现，请检查",NSStringFromClass(self.class),anInvocation.target, NSStringFromSelector(anInvocation.selector)];
    NSString *stackString = [[NSThread callStackSymbols] componentsJoinedByString:@"\n"];
    NSLog(@"%@", info);
    NSLog(@"%@", stackString);
}

@end
