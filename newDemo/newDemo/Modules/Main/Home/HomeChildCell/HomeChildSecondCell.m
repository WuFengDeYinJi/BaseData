//
//  HomeChildSecondCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/13.
//

#import "HomeChildSecondCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation HomeChildSecondCell
{
    UIView* _mainView;
    UILabel* _lab;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        _mainView = [UIView viewWithFrame:CGRectMake(5, 5,FrameW - 10,FrameH - 10) backgroundColor:UIColor.whiteColor];
        _mainView.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = 5;
        _mainView.layer.borderWidth = 0.3;
        _mainView.layer.borderColor = LINE_COLOR.CGColor;
        [self.contentView addSubview:_mainView];
        
        _lab = [UILabel labWithFrame:CGRectMake(5, 5,FrameW - 20,FrameH - 20) text:@"推荐标题" font:13 textColor:LAB1_COLOR textAlignment:1];
        [_mainView addSubview:_lab];
        
    }

    return self;
}
@end
