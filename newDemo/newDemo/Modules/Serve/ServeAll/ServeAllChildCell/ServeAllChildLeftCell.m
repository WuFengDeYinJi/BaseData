//
//  ServeAllChildLeftCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "ServeAllChildLeftCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeAllChildLeftCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.bgView = [[UIView alloc]init];
        self.markView = [[UIView alloc]init];
        self.titleLab = [[UILabel alloc]init];

    }
    return self;
}
#pragma mark - 创建cell，分配尺寸
-(void)setCellContent:(NSString *)leftInfoStr withRow:(NSInteger)row withSelectRow:(NSInteger)selectRow{
    
    NSLog(@"www---%f,hhh---%f",FrameW,FrameH);
    
    self.bgView.frame = CGRectMake(0, 0, FrameW, FrameH);
    self.bgView.backgroundColor = [UIColor whiteColor];
    
    
    
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 5;
    [self.contentView addSubview:self.bgView];
    
    self.markView.frame = CGRectMake(5, 10, 3, FrameH-20);
    self.markView.backgroundColor = TABBAR_COLOR;
    [self.bgView addSubview:self.markView];
    
    self.titleLab.frame = CGRectMake(15, 0, FrameW-20, FrameH);
    self.titleLab.text = leftInfoStr;
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textColor = LAB1_COLOR;
    [self.bgView addSubview:self.titleLab];
    
    if (row == selectRow){
        self.markView.hidden = NO;
        self.titleLab.textColor = TABBAR_COLOR;
        self.bgView.backgroundColor = BG_COLOR;
    }else{
        self.markView.hidden = YES;
        self.titleLab.textColor = LAB1_COLOR;
        self.bgView.backgroundColor = [UIColor whiteColor];
    }
    
    
}

@end
