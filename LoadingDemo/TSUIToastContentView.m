//
//  TSUIToastContentView.m
//  LoadingDemo
//
//  Created by tiens on 2018/12/6.
//  Copyright © 2018年 yjk. All rights reserved.
//

#import "TSUIToastContentView.h"
#import "UIView+TSViewLayout.h"

@implementation TSUIToastContentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.allowsGroupOpacity = NO;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    _textLabel = [[UILabel alloc] init];
    self.textLabel.numberOfLines = 0;
    self.textLabel.opaque = NO;
    [self addSubview:self.textLabel];
    
    _detailTextLabel = [[UILabel alloc] init];
    self.detailTextLabel.numberOfLines = 0;
    self.detailTextLabel.opaque = NO;
    [self addSubview:self.detailTextLabel];
}

#pragma mark - Setters

//当使用customview的时候 同时设置tintcolor
- (void)setCustomView:(UIView *)customView{
    if (self.customView) {
        [self.customView removeFromSuperview];
        _customView = nil;
    }
    _customView = customView;
    [self addSubview:self.customView];
    [self updateCustomViewTintColor];
    [self setNeedsLayout];
}

- (void)setTextLabelText:(NSString *)textLabelText{
    _textLabelText = textLabelText;
    if (textLabelText) {
        self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:textLabelText attributes:self.textLabelAttributes];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self setNeedsLayout];
    }
}

- (void)setDetailTextLabelText:(NSString *)detailTextLabelText{
    _detailTextLabelText = detailTextLabelText;
    if (detailTextLabelText) {
        self.detailTextLabel.attributedText = [[NSAttributedString alloc] initWithString:detailTextLabelText attributes:self.detailTextLabelAttributes];
        self.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    }
}

//会计算出最优的 size 但是不会改变 自己的 size
- (CGSize)sizeThatFits:(CGSize)size{
    return [self sizeThatFits:size shouldConsiderMinimumSize:YES];
}

- (CGSize)sizeThatFits:(CGSize)size shouldConsiderMinimumSize:(BOOL)shouldConsiderMinimumSize{
    BOOL hasCustomView = !!self.customView;
    BOOL hasTextLabel = self.textLabel.text.length > 0;
    BOOL hasDetailTextLabel = self.detailTextLabel.text.length > 0;
    
    CGFloat width = 0;
    CGFloat height = 0;
    
    //宽：MIN(self的最大宽度,各个控件的最大宽度) + self.insets.left + self.insets.right
    //高：customView.height + customViewMarginBottom(cusview的下外边距) +textLabel.height +textLabelMarginBottom(textLabel的下外边距) + detailTextLabel.height + detailTextLabelMarginBottom(detailTextLabel的下外边距) + self.insets.top + self.insets.bottom
    
    
    CGFloat maxContentWidth = size.width - UIEdgeInsetsGetHorizontalValue(self.insets);
    CGFloat maxContentHeight = size.height - UIEdgeInsetsGetVerticalValue(self.insets);
    
    if (hasCustomView) {
        width = MIN(maxContentWidth, MAX(width, CGRectGetWidth(self.customView.frame)));
        height += (CGRectGetHeight(self.customView.frame) + ((hasTextLabel || hasDetailTextLabel) ? self.customViewMarginBottom : 0));
    }
    
    if (hasTextLabel) {
        CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(maxContentWidth, maxContentHeight)];
        width = MIN(maxContentWidth, MAX(width, textLabelSize.width));
        height += (textLabelSize.height + (hasDetailTextLabel ? self.textLabelMarginBottom : 0));
    }
    if (hasDetailTextLabel) {
        CGSize detailTextLabelSize = [self.detailTextLabel sizeThatFits:CGSizeMake(maxContentWidth, maxContentHeight)];
        width = MIN(maxContentWidth, MAX(width, detailTextLabelSize.width));
        height += (detailTextLabelSize.height + self.detailTextLabelMarginBottom);
    }
    
    width += UIEdgeInsetsGetHorizontalValue(self.insets);
    height += UIEdgeInsetsGetVerticalValue(self.insets);
    
    if (shouldConsiderMinimumSize) { //使用手动设置的最小尺寸但是不能比内容的最小尺寸小
        width = MAX(width, self.minimumSize.width);
        height = MAX(height, self.minimumSize.height);
    }
    
    return CGSizeMake(width, height);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    BOOL hasCustomView = !!self.customView;
    BOOL hasTextLabel = self.textLabel.text.length > 0;
    BOOL hasDetailTextLabel = self.detailTextLabel.text.length > 0;
    
    CGFloat contentLimitWidth = CGRectGetWidth(self.frame) - UIEdgeInsetsGetHorizontalValue(self.insets);
    CGSize contentSize = [self sizeThatFits:self.bounds.size shouldConsiderMinimumSize:NO];
    CGFloat minY = self.insets.top + CGFloatGetCenter(CGRectGetHeight(self.frame) - UIEdgeInsetsGetVerticalValue(self.insets), contentSize.height - UIEdgeInsetsGetVerticalValue(self.insets));
    
    if (hasCustomView) {
        self.customView.qmui_left = self.insets.left + CGFloatGetCenter(contentLimitWidth, self.customView.qmui_width);
        self.customView.qmui_top = minY;
        minY = self.customView.qmui_bottom + self.customViewMarginBottom;
    }
    if (hasTextLabel) {
        CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(contentLimitWidth, CGFLOAT_MAX)];
        self.textLabel.qmui_left = self.insets.left;
        self.textLabel.qmui_top = minY;
        self.textLabel.qmui_width = contentLimitWidth;
        self.textLabel.qmui_height = textLabelSize.height;
        minY = self.textLabel.qmui_bottom + self.textLabelMarginBottom;
    }
    if (hasDetailTextLabel) {
        CGSize detailTextLabelSize = [self.detailTextLabel sizeThatFits:CGSizeMake(contentLimitWidth, CGFLOAT_MAX)];
        self.detailTextLabel.qmui_left = self.insets.left;
        self.detailTextLabel.qmui_top = minY;
        self.detailTextLabel.qmui_width = contentLimitWidth;
        self.detailTextLabel.qmui_height = detailTextLabelSize.height;
    }
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    
    if (self.customView) {
        [self updateCustomViewTintColor];
    }
    
    // 如果通过 attributes 设置了文字颜色，则不再响应 tintColor
    if (!self.textLabelAttributes[NSForegroundColorAttributeName]) {
        self.textLabel.textColor = self.tintColor;
    }
    
    if (!self.detailTextLabelAttributes[NSForegroundColorAttributeName]) {
        self.detailTextLabel.textColor = self.tintColor;
    }
}

- (void)updateCustomViewTintColor {
    if (!self.customView) {
        return;
    }
    self.customView.tintColor = self.tintColor;
    if ([self.customView isKindOfClass:[UIActivityIndicatorView class]]) {
        UIActivityIndicatorView *customView = (UIActivityIndicatorView *)self.customView;
        customView.color = self.tintColor;
    }
}

#pragma mark - UIAppearance

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [self setNeedsLayout];
}

- (void)setMinimumSize:(CGSize)minimumSize {
    _minimumSize = minimumSize;
    [self setNeedsLayout];
}

- (void)setCustomViewMarginBottom:(CGFloat)customViewMarginBottom {
    _customViewMarginBottom = customViewMarginBottom;
    [self setNeedsLayout];
}

- (void)setTextLabelMarginBottom:(CGFloat)textLabelMarginBottom {
    _textLabelMarginBottom = textLabelMarginBottom;
    [self setNeedsLayout];
}

- (void)setDetailTextLabelMarginBottom:(CGFloat)detailTextLabelMarginBottom {
    _detailTextLabelMarginBottom = detailTextLabelMarginBottom;
    [self setNeedsLayout];
}

- (void)setTextLabelAttributes:(NSDictionary *)textLabelAttributes {
    _textLabelAttributes = textLabelAttributes;
    if (self.textLabelText && self.textLabelText.length > 0) {
        // 刷新label的attributes
        self.textLabelText = self.textLabelText;
    }
}

- (void)setDetailTextLabelAttributes:(NSDictionary *)detailTextLabelAttributes {
    _detailTextLabelAttributes = detailTextLabelAttributes;
    if (self.detailTextLabelText && self.detailTextLabelText.length > 0) {
        // 刷新label的attributes
        self.detailTextLabelText = self.detailTextLabelText;
    }
}

@end


@interface TSUIToastContentView (UIAppearance)

@end

@implementation TSUIToastContentView (UIAppearance)

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setDefaultAppearance];
    });
}

+ (void)setDefaultAppearance {
    TSUIToastContentView *appearance = [TSUIToastContentView appearance];
    appearance.insets = UIEdgeInsetsMake(16, 16, 16, 16);
    appearance.minimumSize = CGSizeZero;
    appearance.customViewMarginBottom = 8;
    appearance.textLabelMarginBottom = 4;
    appearance.detailTextLabelMarginBottom = 0;
    
    NSMutableParagraphStyle *text_paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    text_paragraphStyle.minimumLineHeight = 22;
    text_paragraphStyle.maximumLineHeight = 22;
    text_paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    text_paragraphStyle.alignment = NSTextAlignmentCenter;
    appearance.textLabelAttributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16], NSParagraphStyleAttributeName:text_paragraphStyle};
    
    
    NSMutableParagraphStyle *detail_paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    detail_paragraphStyle.minimumLineHeight = 18;
    detail_paragraphStyle.maximumLineHeight = 18;
    detail_paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    detail_paragraphStyle.alignment = NSTextAlignmentCenter;
    appearance.detailTextLabelAttributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:12], NSParagraphStyleAttributeName: detail_paragraphStyle};
}

@end

