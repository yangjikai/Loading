//
//  NSString+StringKit.m
//  LoadingDemo
//
//  Created by 杨冀凯 on 2019/1/26.
//  Copyright © 2019 yjk. All rights reserved.
//

#import "NSString+StringKit.h"

@implementation NSString (StringKit)

- (NSUInteger)lengthWhenCountingNonASCIICharacterAsTwo {
    NSUInteger length = 0;
    for (NSUInteger i = 0, l = self.length; i < l; i++) {
        unichar character = [self characterAtIndex:i];
        if (isascii(character)) {
            length += 1;
        } else {
            length += 2;
        }
    }
    return length;
}

@end
