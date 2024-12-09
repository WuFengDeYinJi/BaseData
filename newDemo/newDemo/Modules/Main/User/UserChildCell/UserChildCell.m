//
//  UserChildCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "UserChildCell.h"

@implementation UserChildCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.bgView = [[UIView alloc]init];
        self.titleLab = [[UILabel alloc]init];
        self.lineView = [[UIView alloc]init];
        self.markImg = [[UIImageView alloc]init];
    }
    return self;
}
#pragma mark - 创建cell，分配尺寸
-(void)setCellContent:(NSInteger)section withRow:(NSInteger)row{
    
    self.bgView.frame = CGRectMake(0, 0, ScreenW, 50);
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;
    [self.contentView addSubview:self.bgView];
    
    
    self.markImg.frame = CGRectMake(10, 15, 20, 20);
    [self.markImg setImage:[UIImage imageNamed:@"home"]];
    [self.bgView addSubview:self.markImg];
    
    self.titleLab.frame = CGRectMake(50, 0, ScreenW-60, 50);
    
    
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textColor = LAB1_COLOR;
    [self.bgView addSubview:self.titleLab];
    
    self.lineView.frame = CGRectMake(10, 49.7, ScreenW-20, 0.3);
    self.lineView.backgroundColor = LINE_COLOR;
    self.lineView.hidden = NO;
    [self.bgView addSubview:self.lineView];
    
    if (section == 0){
        if (row == 0){
            self.titleLab.text = @"我的订单";
        }else{
            self.titleLab.text = @"我的收藏";
        }
    }else{
        if (row == 0){
            self.titleLab.text = @"隐私协议";
        }else if (row == 1){
            self.titleLab.text = @"关于我们";
        }else{
            self.titleLab.text = @"意见反馈";
            self.lineView.hidden = YES;
        }
    }
    
}

@end
