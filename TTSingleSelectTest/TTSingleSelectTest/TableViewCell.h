//
//  TableViewCell.h
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/21.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton *lastButton;
@property (nonatomic, assign) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *selectBtn;

@end

NS_ASSUME_NONNULL_END
