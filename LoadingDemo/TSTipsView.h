//
//  TSTipsView.h
//  LoadingDemo
//
//  Created by tiens on 2018/12/7.
//  Copyright © 2018年 yjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSUIToastView.h"

// 自动计算秒数的标志符，在 delay 里面赋值 TipsAutomaticallyHideToastSeconds 即可通过自动计算 tips 消失的秒数
extern const NSInteger TipsAutomaticallyHideToastSeconds;

/// 默认的 parentView
#define DefaultTipsParentView [[[UIApplication sharedApplication] delegate] window]

@interface TSTipsView : TSUIToastView

NS_ASSUME_NONNULL_BEGIN

/// 实例方法：需要自己addSubview，hide之后不会自动removeFromSuperView

- (void)showLoading;
- (void)showLoading:(nullable NSString *)text;
- (void)showLoadingHideAfterDelay:(NSTimeInterval)delay;
- (void)showLoading:(nullable NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (void)showLoading:(nullable NSString *)text detailText:(nullable NSString *)detailText;
- (void)showLoading:(nullable NSString *)text detailText:(nullable NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;

- (void)showWithText:(nullable NSString *)text;
- (void)showWithText:(nullable NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (void)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText;
- (void)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;

- (void)showSucceed:(nullable NSString *)text;
- (void)showSucceed:(nullable NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (void)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText;
- (void)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;

- (void)showError:(nullable NSString *)text;
- (void)showError:(nullable NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (void)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText;
- (void)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;

- (void)showInfo:(nullable NSString *)text;
- (void)showInfo:(nullable NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (void)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText;
- (void)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText hideAfterDelay:(NSTimeInterval)delay;


/// 类方法：主要用在局部一次性使用的场景，hide之后会自动removeFromSuperView
+ (TSTipsView *)createTipsToView:(UIView *)view;

+ (TSTipsView *)showLoadingInView:(UIView *)view;
+ (TSTipsView *)showLoading:(nullable NSString *)text inView:(UIView *)view;
+ (TSTipsView *)showLoadingInView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showLoading:(nullable NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showLoading:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view;
+ (TSTipsView *)showLoading:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

+ (TSTipsView *)showWithText:(nullable NSString *)text;
+ (TSTipsView *)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText;
+ (TSTipsView *)showWithText:(nullable NSString *)text inView:(UIView *)view;
+ (TSTipsView *)showWithText:(nullable NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view;
+ (TSTipsView *)showWithText:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

+ (TSTipsView *)showSucceed:(nullable NSString *)text;
+ (TSTipsView *)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText;
+ (TSTipsView *)showSucceed:(nullable NSString *)text inView:(UIView *)view;
+ (TSTipsView *)showSucceed:(nullable NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view;
+ (TSTipsView *)showSucceed:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

+ (TSTipsView *)showError:(nullable NSString *)text;
+ (TSTipsView *)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText;
+ (TSTipsView *)showError:(nullable NSString *)text inView:(UIView *)view;
+ (TSTipsView *)showError:(nullable NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view;
+ (TSTipsView *)showError:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

+ (TSTipsView *)showInfo:(nullable NSString *)text;
+ (TSTipsView *)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText;
+ (TSTipsView *)showInfo:(nullable NSString *)text inView:(UIView *)view;
+ (TSTipsView *)showInfo:(nullable NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;
+ (TSTipsView *)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view;
+ (TSTipsView *)showInfo:(nullable NSString *)text detailText:(nullable NSString *)detailText inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay;

/// 隐藏 tips
+ (void)hideAllTipsInView:(UIView *)view;
+ (void)hideAllTips;

/// 自动隐藏 toast 可以使用这个方法自动计算秒数
+ (NSTimeInterval)smartDelaySecondsForTipsText:(NSString *)text;

NS_ASSUME_NONNULL_END
@end
