//
//  ChooseOperateTableViewCell.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "ChooseOperateTableViewCell.h"

@implementation ChooseOperateTableViewCell
{
    UILabel * _contentLab;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //title
        _titleLab = [[UILabel alloc]init];
        //img
        _chooseImg = [[UIImageView alloc]init];
    }
    return self;
}
-(void)setContent{
    _titleLab.frame = CGRectMake(10, 0, ScreenW-80, 45);
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.textColor = LAB1_COLOR;
    _titleLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLab];
    
    _chooseImg.frame = CGRectMake(ScreenW-70-27/2, 45/2-20/4, 27/2, 20/2);
    [self.contentView addSubview:_chooseImg];
    
    //分割线
    UILabel * bottomLineLab = [[UILabel alloc]init];
    bottomLineLab.frame = CGRectMake(10, 45-0.5, ScreenW-80, 0.5);
    bottomLineLab.backgroundColor = RGBACOLOR(225, 225, 225, 1);
    [self.contentView addSubview:bottomLineLab];
}

@end
