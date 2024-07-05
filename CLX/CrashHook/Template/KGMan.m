//
//  KGMan.m
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

#import "KGMan.h"
#import "MethodSwizzle.h"

@implementation KGMan

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleClassMethod([KGMan class], @selector(classMethod), @selector(kg_man_classMethod));
        swizzleInstanceMethod([KGMan class], @selector(instanceMethod), @selector(kg_man_instanceMethod));
    });
}

+ (void) kg_man_classMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
    [self kg_man_classMethod];
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

- (void)kg_man_instanceMethod {
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
    [self kg_man_instanceMethod];
    NSLog(@"========%@\n        %@\n        %f",NSStringFromSelector(_cmd),NSStringFromClass([self class]),[NSDate now].timeIntervalSince1970);
}

@end
