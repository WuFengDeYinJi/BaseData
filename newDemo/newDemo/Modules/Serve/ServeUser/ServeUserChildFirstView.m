//
//  ServeUserChildFirstView.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeUserChildFirstView.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@implementation ServeUserChildFirstView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = UIColor.clearColor;
        UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, FrameW, FrameH) backgroundColor:UIColor.clearColor];
        [self addSubview:view];
    }
    return self;
}
@end
