//
//  EnlargeImageBrowser.m
//  ymMallSeller
//
//  Created by hai lin on 2017/7/19.
//  Copyright © 2017年 jiannan jin. All rights reserved.
//

#import "EnlargeImageBrowser.h"
#import "SystemDefine.h"
#import "URLDefine.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation EnlargeImageBrowser
static CGRect oldframe;
#pragma mark -图片放大
+ (void)showImage:(UIImageView *)avatarImageView showArr:(NSMutableArray*)imgArr seclectedIndex:(int)seclectedInt{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //创建背景
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    oldframe = [avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0;
    //创建ScrollView
    UIScrollView *scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    [backgroundView addSubview:scr];
    scr.pagingEnabled = YES;
    scr.bounces = NO;
    scr.showsHorizontalScrollIndicator = NO;
    scr.contentSize = CGSizeMake(ScreenW * imgArr.count, 0);
    scr.contentOffset = CGPointMake(seclectedInt * ScreenW, 0);
    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView
    for (int i = 0; i < imgArr.count; i ++)
    {
        UIImageView * imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(i *ScreenW, 0, ScreenW, ScreenH);
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        NSString *imgPath = imgArr[i];
        [imgView sd_setImageWithURL:[NSURL URLWithString:imgPath] placeholderImage:[UIImage imageNamed:@"添加图片"]];
        
        [scr addSubview:imgView];
        
        imgView.userInteractionEnabled = YES;
    }
    
    [backgroundView addSubview:scr];
    [window addSubview:backgroundView];
    //点击方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.2 animations:^{
        backgroundView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark - 图片消失
+ (void)hideImage:(UITapGestureRecognizer *)tap{
    UIView *backgroundView = tap.view;
    UIImageView *imageView=(UIImageView *)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.2 animations:^{
        imageView.frame = oldframe;
        backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}
@end
