//
//  HomeChildFirstVIew.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "HomeChildFirstVIew.h"

@implementation HomeChildFirstVIew
{
    UILabel* _titleLab;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 5, 3, 20) backgroundColor:TABBAR_COLOR];
        [self addSubview:view];
        
        _titleLab = [UILabel labWithFrame:CGRectMake(10, 0, ScreenW - 10, 30) text:@"" font:14 textColor:LAB1_COLOR textAlignment:0];
        [self addSubview:_titleLab];
    }
    return self;
}
-(void)setupWithSection:(NSInteger)section{
    if (section == 1) {
        _titleLab.text = @"主模块";
    }
    if (section == 2) {
        _titleLab.text = @"推荐模块";
    }
    
}
@end
