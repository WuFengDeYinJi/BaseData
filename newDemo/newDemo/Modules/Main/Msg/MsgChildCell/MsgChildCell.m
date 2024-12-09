//
//  MsgChildCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "MsgChildCell.h"

@implementation MsgChildCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.bgView = [[UIView alloc]init];
        self.titleLab = [[UILabel alloc]init];
        self.lineView = [[UIView alloc]init];
        self.timeLab = [[UILabel alloc]init];
    }
    return self;
}
#pragma mark - 创建cell，分配尺寸
-(void)setCellContent{
    
    self.bgView.frame = CGRectMake(0, 0, ScreenW, 50);
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;
    [self.contentView addSubview:self.bgView];
    
    self.titleLab.frame = CGRectMake(10, 0, ScreenW-20, 50);
    self.titleLab.text = @"系统消息";
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textColor = LAB1_COLOR;
    [self.bgView addSubview:self.titleLab];
    
    self.timeLab.frame = CGRectMake(10, 0, ScreenW-20, 50);
    self.timeLab.text = @"昨天";
    self.timeLab.textAlignment = NSTextAlignmentRight;
    self.timeLab.font = [UIFont systemFontOfSize:12];
    self.timeLab.textColor = LAB2_COLOR;
    [self.bgView addSubview:self.timeLab];
    
    self.lineView.frame = CGRectMake(10, 49.7, ScreenW-20, 0.3);
    self.lineView.backgroundColor = LINE_COLOR;
    [self.bgView addSubview:self.lineView];
    
}

@end
