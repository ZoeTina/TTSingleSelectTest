//
//  TTMainViewController.m
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/21.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTMainViewController.h"
#import "TTViewController.h"
#import "TTPromptView.h"

@interface TTMainViewController ()<TTPromptViewDelegate>
@end

@implementation TTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    TTViewController *vc = [[TTViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    NSArray * dataArray = @[@"多拍/拍错/不想要",@"未按约定时间发货",@"空包裹/少货",@"质量问题",@"卖家发错货",@"快递破损",@"其他",@"其他1",@"其他2",@"其他3",@"其他4",@"其他5",@"其他6",@"其他7",@"其他8",@"其他9",@"其他10",@"其他11",@"其他12"];
    TTPromptView * kproptView = [[TTPromptView alloc]initWithFrame:window.frame title:@"退款原因" dataArray:dataArray];
    kproptView.delegate = self;
    [window addSubview:kproptView];
}

- (void)ttPromptView:(TTPromptView *)promptView titleText:(NSString *)titleText{
    self.title = titleText;
}
@end
