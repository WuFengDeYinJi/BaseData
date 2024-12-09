//
//  AppDelegate.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//登录保存信息
@property(copy,nonatomic)NSString *user_id;
@property(copy,nonatomic)NSString *api_token;
@property(copy,nonatomic)NSString *user_name;
@property(copy,nonatomic)NSString *user_passWord;
@property(copy,nonatomic)NSString * isRemember;//是否记住
//页面跳转
@property(copy,nonatomic)NSString *isDismissCurrentVC;//1：返回之前浏览页；0：返回首页
//是否打开APP
@property(copy,nonatomic)NSString *isOpenAPP;//是否是批量 0:否 1:是

//页面监控
@property(copy,nonatomic)NSString *pageType;//页面类型 home:首页 chat:友友会 store:商城 tool:家政

@end

