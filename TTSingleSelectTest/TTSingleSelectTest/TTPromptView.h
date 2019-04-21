//
//  TTPromptView.h
//  TTSingleSelectTest
//
//  Created by 宁小陌 on 2019/4/21.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TTPromptView;
@protocol TTPromptViewDelegate<NSObject>

-(void)ttPromptView:(TTPromptView *)promptView titleText:(NSString *)titleText;


@end
@interface TTPromptView : UIView
@property(nonatomic,copy)NSString * title;
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,weak)id<TTPromptViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title dataArray:(NSArray *)dataArray;
@end

NS_ASSUME_NONNULL_END
