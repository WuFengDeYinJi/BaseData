//
//  ServeUserChildFirstCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeUserChildFirstCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeUserChildFirstCell
{
    UIView* _mainView;
    UILabel* _lab;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _mainView = [UIView viewWithFrame:CGRectMake(0, 0,FrameW,FrameH) backgroundColor:UIColor.whiteColor];
        _mainView.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = 5;
        _mainView.layer.borderWidth = 0.3;
        _mainView.layer.borderColor = LINE_COLOR.CGColor;
        [self.contentView addSubview:_mainView];
        
        _lab = [UILabel labWithFrame:CGRectMake(0, 0,FrameW,FrameH) text:@"家政" font:13 textColor:TABBAR_COLOR textAlignment:1];
        [_mainView addSubview:_lab];
    }

    return self;
}

-(void)setupWithCell:(NSInteger )item{
    if (item == 0){
        _lab.text = @"待付款";
    }else if (item == 1){
        _lab.text = @"待发货";
    }else if (item == 2){
        _lab.text = @"待收货";
    }else if (item == 3){
        _lab.text = @"待评价";
    }else{
        _lab.text = @"售后";
    }
    
    
}

@end
