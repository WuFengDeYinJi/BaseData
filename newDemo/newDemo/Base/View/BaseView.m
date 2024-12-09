//
//  BaseView.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

#pragma mark - 通过响应者链返回view的controller
- (UIViewController *)viewController:(UIView *)view{
    //将view放入响应者链中
    UIResponder *responder = view;
    //响应者链把事件不断上传
    while ((responder = [responder nextResponder]))
        //当传至viewController时，返回viewController
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    return nil;
}
-(void)showHud:(NSString *)title animated:(BOOL)animated afterHiden:(NSTimeInterval)time
{
    _hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    //    if(title.length > 0) {
    //        _hud.mode = MBProgressHUDModeText;
    //        _hud.animationType = MBProgressHUDAnimationZoomIn;
    //        _hud.label.text = title;
    //        _hud.removeFromSuperViewOnHide = animated;
    //        [_hud hideAnimated:YES afterDelay:time];
    //    }
    _hud.mode = MBProgressHUDModeText;
    _hud.animationType = MBProgressHUDAnimationZoomIn;
    _hud.label.text = title;
    _hud.label.font = [UIFont systemFontOfSize:13];
    _hud.label.numberOfLines = 0;
    _hud.removeFromSuperViewOnHide = animated;
    [_hud hideAnimated:YES afterDelay:time];
    
}
-(void)showHudImgName:(NSString *)imgName animated:(BOOL)animated afterHiden:(NSTimeInterval)time
{
    _hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    _hud.mode = MBProgressHUDModeIndeterminate;
    //    _hud.mode = MBProgressHUDModeCustomView;
    //    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    _hud.animationType = MBProgressHUDAnimationZoomIn;
    _hud.removeFromSuperViewOnHide = animated;
    [_hud hideAnimated:YES afterDelay:time];
    
}
-(void)hideHud{
    [_hud hideAnimated:YES];
}
-(NSString *)setTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action{
    
    //当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    //拼接tocken
    NSString *md5Str = [NSString stringWithFormat:@"%@@%@@%@@%@",module,controller,action,dateStr];
    //md5加密
    NSString *token = [MD5Encryption md5:md5Str];
    return token;
}
//获取请求头的tocken
-(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime{
    
    //拼接tocken
    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@%@",module,controller,action,currentTime];
    //md5加密
    NSString *token = [MD5Encryption md5:md5Str];
    return token;
}

@end
