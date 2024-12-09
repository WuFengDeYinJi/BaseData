//
//  ServeAllChildNextLevelCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeAllChildNextLevelCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeAllChildNextLevelCell
{
    UIView* _mainView;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        _mainView = [UIView viewWithFrame:CGRectMake(0, 0,FrameW,FrameH) backgroundColor:UIColor.brownColor];
        _mainView.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = 5;
        _mainView.layer.borderWidth = 0.3;
        _mainView.layer.borderColor = LINE_COLOR.CGColor;
        [self.contentView addSubview:_mainView];
        
    }

    return self;
}

-(void)setupWithCell:(NSString *)mainStr{
   
    
    
}
@end
