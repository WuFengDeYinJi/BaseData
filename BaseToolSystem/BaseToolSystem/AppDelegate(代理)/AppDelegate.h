//
//  AppDelegate.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

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


- (void)saveContext;


@end

