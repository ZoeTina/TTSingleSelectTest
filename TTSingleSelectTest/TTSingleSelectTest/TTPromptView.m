//
//  TTPromptView.m
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/21.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTPromptView.h"
#import "TableViewCell.h"

@interface TTPromptView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIView * promptView;
@property (nonatomic,assign) NSIndexPath *selectedIndexPath;//单选，当前选中的行

@property(nonatomic,copy)NSString * titleText;//单元格内容

@end
@implementation TTPromptView
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title dataArray:(NSArray *)dataArray{
    if (self =[super initWithFrame:frame]) {
        self.dataArray = dataArray;
        self.titleText=@"";
        self.title=title;
        self.backgroundColor = [[UIColor blackColor ]colorWithAlphaComponent:0.4];
        UIView * promptView = [UIView new];
        UIView * footerView = [UIView new];

        [self addSubview:promptView];
        self.promptView = promptView;
        [promptView addSubview:footerView];
        footerView.backgroundColor = [UIColor whiteColor];
        footerView.userInteractionEnabled = YES;
        [promptView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.height.mas_equalTo(kScreenHeight/2);
            make.bottom.equalTo(self.mas_bottom).offset(-kSafeAreaBottomHeight);
        }];
        [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(self);
            make.height.equalTo(@(kSafeAreaBottomHeight));
        }];
        
        UILabel * titleLab= [[UILabel alloc]init];
        titleLab.backgroundColor = [UIColor whiteColor];
        titleLab.font =[UIFont boldSystemFontOfSize:19];
        titleLab.textAlignment=NSTextAlignmentCenter;
        titleLab.text=title;
        titleLab.textColor = [UIColor blackColor];
        
        [promptView addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(promptView);
            make.height.mas_equalTo(50);
        }];
        
        UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        submitBtn.backgroundColor = kColorWithRGB(228, 52, 61);
        [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        submitBtn.titleLabel.font=[UIFont boldSystemFontOfSize:17];
        [submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
        [promptView addSubview:submitBtn];
        [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(promptView);
            make.height.mas_equalTo(60);
        }];
        
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        tableView.delegate =self;
        tableView.dataSource=self;
        [promptView addSubview:tableView];
        self.tableView = tableView;
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLab.mas_bottom);
            make.left.right.mas_equalTo(promptView);
            make.bottom.mas_equalTo(submitBtn.mas_top).offset(0);
        }];
        tableView.tableFooterView= [[UIView alloc]initWithFrame:CGRectZero];
        
        //设置你想选中的某一行,我这里是第一行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        //执行此方法,表明表视图要选中这一行
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        // 如果要让默认 cell 选中同时触发选中事件,需要手动调用 didSelectRowAtIndexPath
        [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    }
    return self;
}

#pragma mark ----提交
- (void)submitAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(ttPromptView:titleText:)]) {
        [_delegate ttPromptView:self titleText:self.titleText];
    }
    self.hidden =YES;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.titleLab.text=self.dataArray[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /// 切记不能添加这行代码
//    [tableView deselectRowAtIndexPath:indexPath animated:NO] ;
    self.titleText = self.dataArray[indexPath.row];
}

// 点击提示框视图以外的其他地方时隐藏弹框
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    point = [self.promptView.layer convertPoint:point fromLayer:self.layer];
    if (![self.promptView.layer containsPoint:point]) {
        self.hidden = YES;
    }
}

@end
