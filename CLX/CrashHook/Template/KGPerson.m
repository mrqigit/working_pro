//
//  KGPerson.m
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

#import "KGPerson.h"
#import "MethodSwizzle.h"

@implementation KGPerson

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleClassMethod([KGPerson class], @selector(classMethod), @selector(kg_classMethod));
        swizzleInstanceMethod([KGPerson class], @selector(instanceMethod), @selector(kg_instanceMethod));
    });
}

+ (void) classMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

+ (void) kg_classMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
    [self kg_classMethod];
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

- (void)instanceMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

- (void)kg_instanceMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
    [self kg_instanceMethod];
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

@end
