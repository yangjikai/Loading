//
//  NSString+StringKit.h
//  LoadingDemo
//
//  Created by 杨冀凯 on 2019/1/26.
//  Copyright © 2019 yjk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (StringKit)

/**
 *  按照中文 2 个字符、英文 1 个字符的方式来计算文本长度
 */
- (NSUInteger)lengthWhenCountingNonASCIICharacterAsTwo;

@end

NS_ASSUME_NONNULL_END
