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

#pragma mark - 生成tocken
-(NSString *)setTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action;
#pragma mark - 获取请求头的tocken
-(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime;

#pragma mark - HUD加载提示
-(void)showHud:(NSString *)title animated:(BOOL)animated afterHiden:(NSTimeInterval)time;
-(void)hideHud;
#pragma mark - 显示图片
-(void)showHudImgName:(NSString *)imgName animated:(BOOL)animated afterHiden:(NSTimeInterval)time;

#pragma mark - popVC
-(void)popVC;
-(void)pushVC:(UIViewController *)vc andTitle:(NSString *)title;

#pragma mark - 覆盖涂层
-(void)setCoverView;

#pragma mark - 获取文件路径
-(NSString *)getFiler:(NSString *)filerName;

#pragma mark - 创建空白页
-(UIButton *)createBlankImgName:(NSString *)imgName btnFrame:(CGRect)frame;

#pragma mark - 跳转到登录页面
-(void)presentVCLogin;


#pragma mark - 获取地区信息
-(NSArray*)getRegionInfo;

#pragma mark - 扫码
-(void)setScanClick;

#pragma mark - 共享信息库
-(NSMutableArray *)makeDbShareInfoList;
#pragma mark - 基础信息管理
-(NSMutableArray *)makeDbBaseInfoList;
#pragma mark - 台账管理
-(NSMutableArray *)makeDbReportManageList;
#pragma mark - 追溯管理
-(NSMutableArray *)makeDbRetrospectManageList;


@end

NS_ASSUME_NONNULL_END
