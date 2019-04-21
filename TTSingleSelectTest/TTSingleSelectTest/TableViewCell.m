//
//  TableViewCell.m
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/21.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLab.font =[UIFont boldSystemFontOfSize:16];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.titleLab.textColor = kColorWithRGB(211, 0, 0);
        [self.selectBtn setImage:[UIImage imageNamed:@"yesSelected"] forState:UIControlStateNormal];
    }else{
        self.titleLab.textColor = kColorWithRGB(51, 51, 51);
        [self.selectBtn setImage:[UIImage imageNamed:@"noSelected"] forState:UIControlStateNormal];
    }
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (void) initView{
    [self addSubview:self.titleLab];
    [self addSubview:self.selectBtn];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.centerY.equalTo(self);
    }];
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = kColorWithRGB(51, 51, 51);
    }
    return _titleLab;
}

- (UIButton *)selectBtn{
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectBtn setImage:[UIImage imageNamed:@"noSelected"] forState:UIControlStateNormal];
        _selectBtn.userInteractionEnabled = NO;
    }
    return _selectBtn;
}
@end
