//
//  TTBaseViewController.m
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTBaseViewController.h"

@interface TTBaseViewController ()
@property(nonatomic, assign) CGRect reminderBtnFrame;
@end

@implementation TTBaseViewController
- (TTNavigationBar *)ttNavigationBar {
    if (!_ttNavigationBar) {
        _ttNavigationBar = [[TTNavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavBarHeight)];
    }
    return _ttNavigationBar;
}

- (UINavigationItem *)ttNavigationItem {
    if (!_ttNavigationItem) {
        _ttNavigationItem = [[UINavigationItem alloc] init];
    }
    return _ttNavigationItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.reminderBtn];
    if (CGRectGetMaxY(self.reminderBtnFrame) > 0.0) {
        self.reminderBtn.frame = self.reminderBtnFrame;
    }else{
        self.reminderBtn.frame = CGRectMake(0, self.ttNavigationBar.sc_height, kScreenWidth, kScreenHeight-self.ttNavigationBar.sc_height);
    }
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        self.reminderBtn.hidden = false;
    }
//    [self setUPUI];
}

/// 设置界面
- (void)setUPUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.ttNavigationBar];
    self.ttNavigationBar.items = @[self.ttNavigationItem];
    
    // 背景颜色
    self.ttNavigationBar.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc]  init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(kNavBarHeight-44));
    }];
    if (@available(iOS 11.0, *)) {
        topView.hidden = false;
    }else{
        topView.hidden = true;
    }
    
    self.baseTopView = topView;
    
    [self setupNavigationBar];
    
    [self.view addSubview:self.reminderBtn];
    if (CGRectGetMaxY(self.reminderBtnFrame) > 0.0) {
        self.reminderBtn.frame = self.reminderBtnFrame;
    }else{
        self.reminderBtn.frame = CGRectMake(0, self.ttNavigationBar.sc_height, kScreenWidth, kScreenHeight-self.ttNavigationBar.sc_height);
    }
    
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
                self.reminderBtn.hidden = false;
    }
}

- (void)setupNavigationBar {
    
    //TODO: - Test
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - ScreenWidth * 0.5) * 0.5, 0, ScreenWidth * 0.5, 20)];
    //    imageView.image = [UIImage imageNamed:@"邀请码-文字"];
    //    self.scNavigationItem.titleView = imageView;
}

#pragma mark - 设置导航栏
- (void)setLeftNavBarItemWithString:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor sc_colorWithHex:0X000000] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor sc_colorWithHex:0X000000] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont fontWithName:@".PingFangSC-Regular" size:16];
    [button addTarget:self action:@selector(leftItemClick:) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    [button sizeToFit];
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.ttNavigationItem.leftBarButtonItem = leftItem;
    
}


- (void)setLeftNavBarItemWithImage:(NSString *)imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftItemClick:) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = YES;
    [button sizeToFit];
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.ttNavigationItem.leftBarButtonItem = leftItem;
}

- (void)setRightNavBarItemWithString:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor sc_colorWithHex:0X000000] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor sc_colorWithHex:0X000000]forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont fontWithName:@".PingFangSC-Regular" size:16];
    [button addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    [button sizeToFit];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.ttNavigationItem.rightBarButtonItem = rightItem;
}

- (void)setRightNavBarItemWithImage:(NSString *)imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = YES;
    [button sizeToFit];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.ttNavigationItem.rightBarButtonItem = rightItem;
    
}

- (void)leftItemClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)rightItemClick:(UIButton *)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDWebImageManager sharedManager] cancelAll];
    [[SDImageCache sharedImageCache] clearMemory];
}

- (UIButton *)reminderBtn{
    if (!_reminderBtn) {
        _reminderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _reminderBtn.hidden = YES;
        _reminderBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_reminderBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        _reminderBtn.backgroundColor = [UIColor clearColor];
        [_reminderBtn addTarget:self action:@selector(reminderBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_reminderBtn setTitle:@"点击这里重新加载" forState:UIControlStateNormal];
    }
    return _reminderBtn;
}

- (void)reminderBtnClicked{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        self.reminderBtn.hidden = false;
    }else{
        self.reminderBtn.hidden = true;
    }
    if ([self respondsToSelector:@selector(tt_reloadData)]) {
        [self tt_reloadData];
    }
    NSLog(@"重新加载");
}
- (void)tt_reloadData{
    
}
- (void)adjustmentReminderBtnFrame:(CGRect)frame{
    self.reminderBtnFrame = frame;
}

@end
