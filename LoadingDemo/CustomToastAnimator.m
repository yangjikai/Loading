//
//  CustomToastAnimator.m
//  LoadingDemo
//
//  Created by 杨冀凯 on 2019/1/26.
//  Copyright © 2019 yjk. All rights reserved.
//

#import "CustomToastAnimator.h"

@interface CustomToastAnimator ()

@property(nonatomic, assign) BOOL isShowing;
@property(nonatomic, assign) BOOL isAnimating;

@end

@implementation CustomToastAnimator
- (void)showWithCompletion:(void (^)(BOOL finished))completion {
    self.isShowing = YES;
    self.isAnimating = YES;
//    self.toastView.abackgroundView.layer.transform = CATransform3DMakeTranslation(0, -30, 0);
//    self.toastView.contentView.layer.transform = CATransform3DMakeTranslation(0, -30, 0);
//    [UIView animateWithDuration:0.25 delay:0.0 options:(7<<16) animations:^{
//        self.toastView.backgroundView.alpha = 1.0;
//        self.toastView.contentView.alpha = 1.0;
//        self.toastView.backgroundView.layer.transform = CATransform3DIdentity;
//        self.toastView.contentView.layer.transform = CATransform3DIdentity;
//    } completion:^(BOOL finished) {
//        self.isAnimating = NO;
//        if (completion) {
//            completion(finished);
//        }
//    }];
}

- (void)hideWithCompletion:(void (^)(BOOL finished))completion {
    self.isShowing = NO;
    self.isAnimating = YES;
//    [UIView animateWithDuration:0.25 delay:0.0 options:(7<<16) animations:^{
//        self.toastView.backgroundView.alpha = 0.0;
//        self.toastView.contentView.alpha = 0.0;
//        self.toastView.backgroundView.layer.transform = CATransform3DMakeTranslation(0, -30, 0);
//        self.toastView.contentView.layer.transform = CATransform3DMakeTranslation(0, -30, 0);
//    } completion:^(BOOL finished) {
//        self.isAnimating = NO;
//        self.toastView.backgroundView.layer.transform = CATransform3DIdentity;
//        self.toastView.contentView.layer.transform = CATransform3DIdentity;
//        if (completion) {
//            completion(finished);
//        }
//    }];
}

- (BOOL)isShowing {
    return self.isShowing;
}

- (BOOL)isAnimating {
    return self.isAnimating;
}
@end
