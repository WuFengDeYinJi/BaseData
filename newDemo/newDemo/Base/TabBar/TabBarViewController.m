//
//  TabBarViewController.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"

#import "LoginVC.h"

#import "HomeVC.h"
#import "MsgVC.h"
#import "UserVC.h"

#import "ChatVC.h"
#import "CircleVC.h"
#import "FindVC.h"
#import "ChatUserVC.h"

#import "StoreHomeVC.h"
#import "StoreMsgVC.h"
#import "StoreShopCarVC.h"
#import "StoreUserVC.h"

#import "ServeHomeVC.h"
#import "ServeAllVC.h"
#import "ServeUserVC.h"

#import "SystemDefine.h"
@interface TabBarViewController ()
{
    NSMutableArray *_VCArr;
    UITabBar * tabBar;
}
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _VCArr = [[NSMutableArray alloc] init];
    
    //添加子控制器
    [self setUpAllChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark  ——————— 初始化VC ———————
-(void)setUpAllChildViewController{
    
    if (@available(iOS 13.0, *)) {

        UITabBarAppearance *bar = [UITabBarAppearance new];

        bar.backgroundColor = [UIColor whiteColor];
        
        bar.stackedLayoutAppearance.selected.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:TABBAR_COLOR};

       

        if (@available(iOS 15.0, *)) {
            self.tabBar.scrollEdgeAppearance = bar;
        } else {
            // Fallback on earlier versions
        }

        self.tabBar.standardAppearance = bar;

    } else {

        self.tabBar.backgroundColor = [UIColor whiteColor];

        self.tabBar.barTintColor = [UIColor whiteColor];

        self.tabBar.translucent = NO;

        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_COLOR} forState:UIControlStateSelected];

    }
    
    
    if ([APPDELEGATE.pageType isEqualToString:@"home"]) {
        
        HomeVC *home = [[HomeVC alloc]init];
        [self addViewController:home andTitle:@"首页" andImage:@"home" andSelectImage:@"home_fill"];
        
        MsgVC *msg = [[MsgVC alloc]init];
        [self addViewController:msg andTitle:@"消息" andImage:@"home" andSelectImage:@"home_fill"];
        
        UserVC *user = [[UserVC alloc]init];
        [self addViewController:user andTitle:@"个人中心" andImage:@"home" andSelectImage:@"home_fill"];
    }else if ([APPDELEGATE.pageType isEqualToString:@"chat"]){
        
        ChatVC *chat = [[ChatVC alloc]init];
        [self addViewController:chat andTitle:@"聊天" andImage:@"home" andSelectImage:@"home_fill"];
        
        CircleVC *circle = [[CircleVC alloc]init];
        [self addViewController:circle andTitle:@"社区" andImage:@"home" andSelectImage:@"home_fill"];
        
        FindVC *find = [[FindVC alloc]init];
        [self addViewController:find andTitle:@"发现" andImage:@"home" andSelectImage:@"home_fill"];
        
        ChatUserVC *chatUser = [[ChatUserVC alloc]init];
        [self addViewController:chatUser andTitle:@"我的" andImage:@"home" andSelectImage:@"home_fill"];
    }else if ([APPDELEGATE.pageType isEqualToString:@"store"]){
        
        StoreHomeVC *chat = [[StoreHomeVC alloc]init];
        [self addViewController:chat andTitle:@"商城" andImage:@"home" andSelectImage:@"home_fill"];
        
        StoreMsgVC *circle = [[StoreMsgVC alloc]init];
        [self addViewController:circle andTitle:@"消息" andImage:@"home" andSelectImage:@"home_fill"];
        
        StoreShopCarVC *find = [[StoreShopCarVC alloc]init];
        [self addViewController:find andTitle:@"购物车" andImage:@"home" andSelectImage:@"home_fill"];
        
        StoreUserVC *chatUser = [[StoreUserVC alloc]init];
        [self addViewController:chatUser andTitle:@"我的" andImage:@"home" andSelectImage:@"home_fill"];
    }else if ([APPDELEGATE.pageType isEqualToString:@"serve"]){
        
        ServeHomeVC *chat = [[ServeHomeVC alloc]init];
        [self addViewController:chat andTitle:@"家政" andImage:@"home" andSelectImage:@"home_fill"];
        
        ServeAllVC *circle = [[ServeAllVC alloc]init];
        [self addViewController:circle andTitle:@"全部服务" andImage:@"home" andSelectImage:@"home_fill"];
        
        ServeUserVC *chatUser = [[ServeUserVC alloc]init];
        [self addViewController:chatUser andTitle:@"我的" andImage:@"home" andSelectImage:@"home_fill"];
    }

    
    //设置Tabber默认显示页面（不设置默认为0）
    self.selectedIndex = 0;
}
#pragma mark  ——————— 添加vc到tabbar中，并设置tabbaritem属性 ———————
-(void)addViewController:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)imageName andSelectImage:(NSString *)selectImageName {
    vc.view.backgroundColor = BG_COLOR;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectImageName];
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    
    
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
