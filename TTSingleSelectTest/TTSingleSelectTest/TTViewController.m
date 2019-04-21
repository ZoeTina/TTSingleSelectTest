//
//  TTViewController.m
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()
@property (nonatomic, strong) UIButton          *reminderBtn;

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"详情";
    [self.view addSubview:self.reminderBtn];
    self.reminderBtn.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWordSatus:) name:NetworkReachabilityStatus object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TTViewController *vc = [[TTViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)netWordSatus:(NSNotification*)notification{
    NSInteger status = ((NSNumber*)notification.userInfo[@"status"]).integerValue;
    if(status == AFNetworkReachabilityStatusReachableViaWWAN) {
        self.reminderBtn.hidden = YES;
    }else if(status == AFNetworkReachabilityStatusNotReachable) {
        self.reminderBtn.hidden = NO;
    } else {
        self.reminderBtn.hidden = YES;
    }
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

@end
