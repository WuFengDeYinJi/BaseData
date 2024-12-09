//
//  ServeAllChildRightView.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeAllChildRightReusableView.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeAllChildRightReusableView
{
    UILabel* _titleLab;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = UIColor.clearColor;
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, FrameW, FrameH) backgroundColor:UIColor.clearColor];
        [self addSubview:view];
        
        _titleLab = [UILabel labWithFrame:CGRectMake(0, 0, FrameW, FrameH) text:@"—————  分类1  —————" font:12 textColor:LAB3_COLOR textAlignment:1];
        [self addSubview:_titleLab];
    }
    return self;
}
-(void)setupWithSection:(NSInteger)section withMainStr:(NSString *)mainStr{
    
    _titleLab.text = [NSString stringWithFormat:@"—————  %@ 分类%ld  —————",mainStr,section+1];
    
}

@end
