//
//  ServeHomeChildFirstCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "ServeHomeChildFirstCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeHomeChildFirstCell
{
    UIView* _mainView;
    UILabel* _lab;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _mainView = [UIView viewWithFrame:CGRectMake(0, 0,FrameW,FrameH) backgroundColor:UIColor.whiteColor];
        _mainView.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = FrameW/2;
        _mainView.layer.borderWidth = 0.3;
        _mainView.layer.borderColor = LINE_COLOR.CGColor;
        [self.contentView addSubview:_mainView];
        
        _lab = [UILabel labWithFrame:CGRectMake(0, 0,FrameW,FrameH) text:@"家政" font:13 textColor:TABBAR_COLOR textAlignment:1];
        [_mainView addSubview:_lab];
    }

    return self;
}

-(void)setupWithCell:(NSString *)mainStr{
   
    
    
}
@end
