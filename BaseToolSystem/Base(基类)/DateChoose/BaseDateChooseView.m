//
//  BaseDateChooseView.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseDateChooseView.h"

@implementation BaseDateChooseView
{
    NSString * str;
}
-(void)setView:(NSString *)type{
    
    //取消按钮 
    UIButton * cancelBtn = [UIButton btnWithFrame:CGRectMake(0, 0, 40, 40) title:@"取消" titleColor:LAB1_COLOR titleFont:13 backgroundColor:UIColor.clearColor];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
    //选择页面名称
    UILabel * headLab = [UILabel labWithFrame:CGRectMake(self.frame.size.width/2-50, 0, 100, 40) text:type font:14 textColor:LAB2_COLOR textAlignment:1];
    [self addSubview:headLab];
    //确认按钮
    UIButton * confirmBtn = [UIButton btnWithFrame:CGRectMake(self.frame.size.width-40, 0, 40, 40) title:@"确认" titleColor:TABBAR_COLOR titleFont:13 backgroundColor:UIColor.clearColor];
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirmBtn];
    
    //分割线
    UIView * bottomLineView = [UIView viewWithFrame:CGRectMake(10, 39.5, self.frame.size.width-20, .5) backgroundColor:LAB3_COLOR];
    [self addSubview:bottomLineView];
    //时间滚轮
    UIDatePicker *datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(10, 40, self.frame.size.width-20, self.frame.size.height-40)];
    [datePicker setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    //    datePicker.backgroundColor = [UIColor redColor];
    //    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.date=[NSDate date];
    [self addSubview: datePicker];
    self.datePicker=datePicker;
    [self.datePicker addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventValueChanged];
    
    long long timeInterval = self.datePicker.date.timeIntervalSince1970;
    str=[NSString stringWithFormat:@"%lld",timeInterval];
    
}
#pragma mark - 时间选择
-(void)selectDate:(id)sender
{
    // 获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.datePicker date];
    long long timeInterval = selected.timeIntervalSince1970;
    str=[NSString stringWithFormat:@"%lld",timeInterval];
}
#pragma mark - 取消
-(void)clickCancel{
    //选择页面收起
    self.bgView.hidden = YES;
    self.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, ScreenH, ScreenW, 250);
    }];
    NSLog(@"点中了取消");
}
#pragma mark - 确认
- (void)clickConfirm{
    
    _blockCellSeclectStr(str);

    
    //选择页面收起
    self.bgView.hidden = YES;
    self.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, ScreenH, ScreenW, 250);
    }];
    NSLog(@"点中了确认");
    
}

@end
