//
//  TTBaseViewController.h
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTBaseViewController : UIViewController

/** 自定义导航栏 */
@property (nonatomic, strong) TTNavigationBar   *ttNavigationBar;
/** 自定义导航条 统一使用ttNavigationItem */
@property (nonatomic, strong) UINavigationItem  *ttNavigationItem;
/** 可选择表格tableView */
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UIButton          *reminderBtn;
@property (nonatomic, strong) UIView            *baseTopView;

/**
 *  用字符串设置用左边导航栏
 *
 *  @param title 标题
 */
- (void)setLeftNavBarItemWithString:(NSString *)title;
/**
 *  用图片名字设置用左边导航栏
 *
 *  @param imageName 图片名字
 */
- (void)setLeftNavBarItemWithImage:(NSString *)imageName;
/**
 *  用字符串设置用右边导航栏
 *
 *@param title 标题
 */
- (void)setRightNavBarItemWithString:(NSString *)title;

/**
 用图片名字设置用右边导航栏
 
 @param imageName 图片名字
 */
- (void)setRightNavBarItemWithImage:(NSString *)imageName;
/**
 *  左侧item点击事件
 *
 *  @param sender UIButton
 */
- (void)leftItemClick:(UIButton *)sender;
/**
 *  右侧item点击事件
 *
 *  @param sender UIButton
 */
- (void)rightItemClick:(UIButton *)sender;
/// 如果不使用BaseViewController中的setupNavigationBar，只需重写次方法不调用super即可
- (void)setupNavigationBar;

/// 重新加载数据
- (void)tt_reloadData;
/// 调整按钮位置
- (void)adjustmentReminderBtnFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
