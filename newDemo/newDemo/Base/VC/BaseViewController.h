//
//  BaseViewController.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//
#import <UIKit/UIKit.h>
//全局宏
#import "AppDelegate.h"
#import "URLDefine.h"
#import "SystemDefine.h"

//基础类
#import "MD5Encryption.h"
#import "HttpRequest.h"
//第三方
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <MJRefresh/MJRefresh.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

//分类
#import "NSString+Category.h"
#import "UIImageView+Category.h"
#import "UILabel+Category.h"
#import "UITextField+Category.h"
#import "UIView+Category.h"
#import "UIButton+Category.h"
#import "UITextView+Category.h"
#import "UIImage+Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic,retain)MBProgressHUD *hud;
@property(strong,nonatomic)UIWindow * window;
@property(strong,nonatomic)UIView * coverView;


#pragma mark - 创建collectionView
-(UICollectionView *)createCVFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;

#pragma mark - 生成token的方法
-(NSString *)setTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action;
#pragma mark - 获取请求头的token的方法
-(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime;

#pragma mark - HUD加载提示
-(void)showHud:(NSString *)title animated:(BOOL)animated afterHiden:(NSTimeInterval)time;
-(void)hideHud;
#pragma mark - 显示图片
-(void)showHudImgName:(NSString *)imgName animated:(BOOL)animated afterHiden:(NSTimeInterval)time;

#pragma mark - popVC
-(void)popVC;
-(void)pushVC:(UIViewController *)vc andTitle:(NSString *)title;

#pragma mark - 覆盖涂层的方法
-(void)setCoverView;

#pragma mark - 获取文件路径的方法
-(NSString *)getFiler:(NSString *)filerName;

#pragma mark - 创建空白页的方法
-(UIButton *)createBlankImgName:(NSString *)imgName btnFrame:(CGRect)frame;

#pragma mark - 跳转到登录页面的方法
-(void)presentVCLogin;


#pragma mark - 扫码
-(void)setScanClick;




@end

NS_ASSUME_NONNULL_END
