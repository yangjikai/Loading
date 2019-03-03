//
//  UIView+TSViewLayout.h
//  LoadingDemo
//
//  Created by tiens on 2018/12/6.
//  Copyright © 2018年 yjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSUICommonDefines.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIView (TSViewLayout)

/// 等价于 CGRectGetMinY(frame)
@property(nonatomic, assign) CGFloat qmui_top;

/// 等价于 CGRectGetMinX(frame)
@property(nonatomic, assign) CGFloat qmui_left;

/// 等价于 CGRectGetMaxY(frame)
@property(nonatomic, assign) CGFloat qmui_bottom;

/// 等价于 CGRectGetMaxX(frame)
@property(nonatomic, assign) CGFloat qmui_right;

/// 等价于 CGRectGetWidth(frame)
@property(nonatomic, assign) CGFloat qmui_width;

/// 等价于 CGRectGetHeight(frame)
@property(nonatomic, assign) CGFloat qmui_height;

/// 保持其他三个边缘的位置不变的情况下，将顶边缘拓展到某个指定的位置，注意高度会跟随变化。
@property(nonatomic, assign) CGFloat qmui_extendToTop;

/// 保持其他三个边缘的位置不变的情况下，将左边缘拓展到某个指定的位置，注意宽度会跟随变化。
@property(nonatomic, assign) CGFloat qmui_extendToLeft;

/// 保持其他三个边缘的位置不变的情况下，将底边缘拓展到某个指定的位置，注意高度会跟随变化。
@property(nonatomic, assign) CGFloat qmui_extendToBottom;

/// 保持其他三个边缘的位置不变的情况下，将右边缘拓展到某个指定的位置，注意宽度会跟随变化。
@property(nonatomic, assign) CGFloat qmui_extendToRight;

/// 获取当前 view 在 superview 内水平居中时的 left
@property(nonatomic, assign, readonly) CGFloat qmui_leftWhenCenterInSuperview;

/// 获取当前 view 在 superview 内垂直居中时的 top
@property(nonatomic, assign, readonly) CGFloat qmui_topWhenCenterInSuperview;


/**
 在 iOS 11 及之后的版本，此属性将返回系统已有的 self.safeAreaInsets。在之前的版本此属性返回 UIEdgeInsetsZero
 */
@property(nonatomic, assign, readonly) UIEdgeInsets qmui_safeAreaInsets;

/**
 将要设置的 frame 自定用 CGRectApplyAffineTransformWithAnchorPoint 处理后再设置
 */
@property(nonatomic, assign) CGRect qmui_frameApplyTransform;


@end

NS_ASSUME_NONNULL_END
