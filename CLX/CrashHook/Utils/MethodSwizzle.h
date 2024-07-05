//
//  MethodSwizzle.h
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MethodSwizzle : NSObject

/// hook类方法
/// - Parameters:
///   - cls: 需要hook的类
///   - originSelector: 目标方法
///   - newSelector: 替换方法
void swizzleClassMethod(Class cls, SEL originSelector, SEL newSelector);

/// hook对象方法
/// - Parameters:
///   - cls: 需要hook的类
///   - originSelector: 目标方法
///   - newSelector: 替换方法
void swizzleInstanceMethod(Class cls, SEL originSelector, SEL newSelector);

@end

NS_ASSUME_NONNULL_END
