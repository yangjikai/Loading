//
//  TSUIToastBackgroundView.m
//  LoadingDemo
//
//  Created by tiens on 2018/12/6.
//  Copyright © 2018年 yjk. All rights reserved.
//

#import "TSUIToastBackgroundView.h"
#import "TSUICommonDefines.h"
@interface TSUIToastBackgroundView()

@property(nonatomic, strong) UIView *effectView; //毛玻璃效果的view

@end

@implementation TSUIToastBackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        //开启CALayer的 allowsGroupOpacity 属性后，子 layer 在视觉上的透明度的上限是其父 layer 的 opacity (对应UIView的 alpha )，并且从 iOS 7 以后默认全局开启了这个功能，这样做是为了让子视图与其容器视图保持同样的透明度。
        self.layer.allowsGroupOpacity = NO;
        self.backgroundColor = self.styleColor;
        self.layer.cornerRadius = self.cornerRadius;
    }
    return self;
}

- (void)setShouldBlurBackgroundView:(BOOL)shouldBlurBackgroundView{
    _shouldBlurBackgroundView = shouldBlurBackgroundView;
    //如果需要磨砂效果 添加UIVisualEffectView
    if (shouldBlurBackgroundView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.layer.cornerRadius = self.cornerRadius;
        effectView.layer.masksToBounds = YES;
        [self addSubview:effectView];
        self.effectView = effectView;
    } else {
        if (self.effectView) {
            [self.effectView removeFromSuperview];
            self.effectView = nil;
        }
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.effectView) {
        self.effectView.frame = self.bounds;
    }
}

#pragma mark - UIAppearance

- (void)setStyleColor:(UIColor *)styleColor{
    _styleColor = styleColor;
    self.backgroundColor = styleColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    if (self.effectView) {
        self.effectView.layer.cornerRadius = cornerRadius;
    }
}

@end


@interface TSUIToastBackgroundView (UIAppearance)

@end

@implementation TSUIToastBackgroundView (UIAppearance)

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setDefaultAppearance];
    });
}

+ (void)setDefaultAppearance{
    TSUIToastBackgroundView *toastBGView = [TSUIToastBackgroundView appearance];
    toastBGView.styleColor = UIColorMakeWithRGBA(0, 0, 0, 0.8);
    toastBGView.cornerRadius = 10.0;
}

@end
