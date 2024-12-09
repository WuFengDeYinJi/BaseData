//
//  ServeHomeChildThirdCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "ServeHomeChildThirdCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeHomeChildThirdCell
{
    UIView* _mainView;
    UIImageView* _img;
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
        
        _img = [UIImageView imageViewWithFrame:CGRectMake(5, 5,FrameW - 20,FrameH - 50) imageName:@"" contentMode:0];
        _img.backgroundColor = BTN2_COLOR;
        _img.layer.cornerRadius = 5;
        [_mainView addSubview:_img];
        
        _lab = [UILabel labWithFrame:CGRectMake(5, FrameH - 40,FrameW - 20,25) text:@"商品介绍" font:13 textColor:TABBAR_COLOR textAlignment:1];
        [_mainView addSubview:_lab];
    }

    return self;
}


-(void)setupWithCell:(NSString *)mainStr{
    
    
}

@end
