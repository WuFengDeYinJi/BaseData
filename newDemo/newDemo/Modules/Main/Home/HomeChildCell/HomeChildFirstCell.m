//
//  HomeChildFirstCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/13.
//

#import "HomeChildFirstCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation HomeChildFirstCell
{
    UIView* _mainView;
    UIImageView* _img;
    UILabel* _lab;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
    }

    return self;
}


-(void)setupWithCell:(NSString *)mainStr{

    [_mainView removeFromSuperview];
    _mainView = [UIView viewWithFrame:CGRectMake(5, 5,FrameW - 10,FrameH - 10) backgroundColor:UIColor.whiteColor];
    _mainView.layer.masksToBounds = YES;
    _mainView.layer.cornerRadius = 5;
    _mainView.layer.borderWidth = 0.3;
    _mainView.layer.borderColor = LINE_COLOR.CGColor;
    [self.contentView addSubview:_mainView];
    
    _img = [UIImageView imageViewWithFrame:CGRectMake(5, 5,FrameW - 20,FrameH - 20) imageName:@"" contentMode:0];
    _img.backgroundColor = BTN2_COLOR;
    _img.layer.cornerRadius = 5;
    [_mainView addSubview:_img];
    //加阴影
    _img.layer.shadowOffset = CGSizeMake(4, 4);
    _img.layer.shadowColor = BTN_COLOR.CGColor;
    _img.layer.shadowOpacity = 1;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-4, -4, FrameW - 20 + 8, FrameH - 20 + 8)];
    _img.layer.shadowPath = path.CGPath;
    
    
    _lab = [UILabel labWithFrame:CGRectMake(5, 5,FrameW - 20,FrameH - 20) text:mainStr font:13 textColor:TABBAR_COLOR textAlignment:1];
    [_mainView addSubview:_lab];
    
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction animations:^{
        self->_mainView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    } completion:nil];
    
}

@end
