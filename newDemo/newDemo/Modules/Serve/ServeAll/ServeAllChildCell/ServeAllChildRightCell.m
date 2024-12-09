//
//  ServeAllChildRightCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeAllChildRightCell.h"
#import "ServeAllChildNextLevelView.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeAllChildRightCell
{
    UIView* _mainView;
    ServeAllChildNextLevelView * _levelView;
}
-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        _mainView = [UIView viewWithFrame:CGRectMake(10, 0,FrameW-20,FrameH) backgroundColor:UIColor.whiteColor];
        _mainView.layer.masksToBounds = YES;
        _mainView.layer.cornerRadius = 5;
        _mainView.layer.borderWidth = 0.3;
        _mainView.layer.borderColor = LINE_COLOR.CGColor;
        [self.contentView addSubview:_mainView];
        
        _levelView =[[ServeAllChildNextLevelView alloc]init];
        _levelView.frame = CGRectMake(0, 0,FrameW-20,FrameH);
        [_mainView addSubview:_levelView];
    }

    return self;
}

-(void)setupWithSection:(NSInteger)section withMainStr:(NSString *)mainStr{
   
    [_levelView setupWithSection:section+1 withMainStr:mainStr];
    
}

@end
