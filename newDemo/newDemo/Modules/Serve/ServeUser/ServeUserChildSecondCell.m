//
//  ServeUserChildSecondCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeUserChildSecondCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeUserChildSecondCell
{
    UIView* _mainView;
    UILabel* _lab;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.bgView = [[UIView alloc]init];
        self.titleLab = [[UILabel alloc]init];
        self.lineView = [[UIView alloc]init];
        self.markImg = [[UIImageView alloc]init];
        
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
    }

    return self;
}

-(void)setCellContent:(NSInteger)section withItem:(NSInteger)item{
    if (section == 1){
        if (item == 0){
            self.titleLab.text = @"我的收藏";
        }else{
            self.titleLab.text = @"历史记录";
            self.lineView.hidden = YES;
        }
    }
}

@end
