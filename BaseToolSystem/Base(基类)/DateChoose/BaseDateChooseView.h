//
//  BaseDateChooseView.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseDateChooseView : BaseView

-(void)setView:(NSString *)type;
@property(strong, nonatomic)UIView * bgView;

@property(retain,nonatomic)UIDatePicker *datePicker;
@property(nonatomic,copy)void(^blockCellSeclectStr) (NSString *);

@end

NS_ASSUME_NONNULL_END
