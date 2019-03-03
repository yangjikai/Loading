//
//  ViewController.m
//  LoadingDemo
//
//  Created by tiens on 2018/12/6.
//  Copyright © 2018年 yjk. All rights reserved.
//

#import "ViewController.h"
#import "TSTipsView.h"
#import "TSUIToastContentView.h"
#import "TSUIToastBackgroundView.h"
#import "TSUIToastAnimator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(100, 100, 50, 30);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dddddd) forControlEvents:(UIControlEventTouchUpInside)];
    
//    [TSTipsView showLoadingInView:self.view];
    [TSTipsView showLoading:@"加载中，请稍后..." inView:self.view];
//    [TSTipsView showLoading:@"tips Title\n tips Title" detailText:@"这是\n详细信息" inView:self.view];
//    [TSTipsView showLoadingInView:self.view hideAfterDelay:3];
//    [TSTipsView showLoading:@"loading..." inView:self.view hideAfterDelay:2];
//    [TSTipsView showLoading:@"title..." detailText:@"这是详细信息" inView:self.view hideAfterDelay:3];
    
//    [TSTipsView showWithText:@"cusview上的纯文字描述" inView:self.view];
//    [TSTipsView showWithText:@"纯文字描述" detailText:@"纯文字详情" inView:self.view];
//    [TSTipsView showWithText:@"计时隐藏的toast" inView:self.view hideAfterDelay:4];
//    [TSTipsView showWithText:@"计时隐藏toast" detailText:@"详细信息" inView:self.view hideAfterDelay:4];
    
//    [TSTipsView showSucceed:@"succeed" detailText:@"detail" inView:self.view hideAfterDelay:4];
    
//    [TSTipsView showError:nil detailText:@"失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述\n不带标题" inView:self.view hideAfterDelay:40];
    
    
//    TSTipsView *tips = [TSTipsView createTipsToView:self.view];
//    TSUIToastContentView*contentView = (TSUIToastContentView *)tips.contentView;
//    contentView.minimumSize = CGSizeMake(90, 90);
//    tips.willShowBlock = ^(UIView *showInView, BOOL animated) {
//        NSLog(@"tips calling willShowBlock");
//    };
//    tips.didShowBlock = ^(UIView *showInView, BOOL animated) {
//        NSLog(@"tips calling didShowBlock");
//    };
//    tips.willHideBlock = ^(UIView *hideInView, BOOL animated) {
//        NSLog(@"tips calling willHideBlock");
//    };
//    tips.didHideBlock = ^(UIView *hideInView, BOOL animated) {
//        NSLog(@"tips calling didHideBlock");
//    };
//    [tips showLoadingHideAfterDelay:2];
    
    
//    TSTipsView *tipsView = [TSTipsView showError:nil detailText:@"失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述失败详细描述\n不带标题" inView:self.view hideAfterDelay:40];
//    tipsView.tintColor = [UIColor orangeColor];
    
//    TSUIToastBackgroundView *bgView = (TSUIToastBackgroundView *)tipsView.backgroundView;
//    bgView.shouldBlurBackgroundView = YES;
//    bgView.styleColor = [UIColor cyanColor];
//    bgView.cornerRadius = 5;
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [TSTipsView hideAllToastInView:self.view animated:YES];
//    });
    
    
}

- (void)dddddd{
    
//    [TSTipsView showWithText:@"window上的纯文字描述"];
//    [TSTipsView showWithText:@"window·标题" detailText:@"详细描述详细描述详细描述详细描述详细描述详细描述详细描述详细描述详细描述详细描述详细描述详细描述\n详细描述详细描述详细描述详细描述详细描述详细描述\n详细描述详细描述详细描述\n详细描述n详细描述详细描述详细描述详细描述详细描述\n"];
    
//    [TSTipsView showSucceed:@"window`cucceed"];
    
//    [TSTipsView showInfo:@"info"];
    
//    [TSTipsView showError:@"error"];
    
    TSTipsView *tips = [TSTipsView createTipsToView:self.view];
    tips.toastPosition = TSUIToastViewPositionTop;
    UIView *aa = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    aa.backgroundColor = [UIColor darkGrayColor];
    UILabel *abc = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 70)];
    abc.text = @"自动移content";
    [aa addSubview:abc];
    
    tips.contentView = aa;
    [tips showAnimated:YES];
    [tips hideAnimated:YES afterDelay:4];
}


@end
