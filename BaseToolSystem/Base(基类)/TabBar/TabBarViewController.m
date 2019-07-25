//
//  TabBarViewController.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"
//#import "YM_SortViewController.h"
//#import "YM_FindViewController.h"
//#import "YM_ShopCarViewController.h"
//#import "YM_PersonalViewController.h"

#import "SystemDefine.h"
@interface TabBarViewController ()
{
    NSMutableArray *_VCArr;
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
    
    UITabBarItem *tabBar = [UITabBarItem appearance];
    //设置titleText属性
    [tabBar setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_COLOR} forState:UIControlStateSelected];
    
    
//    //首页
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addViewController:home andTitle:@"首页" andImage:@"home" andSelectImage:@"home_fill"];
//
//    //分类
//    YM_SortViewController *sort = [[YM_SortViewController alloc]init];
//    [self addViewController:sort andTitle:@"分类" andImage:@"list" andSelectImage:@"list_fill"];
//
//    //发现
//    YM_FindViewController *find = [[YM_FindViewController alloc] init];
//    [self addViewController:find andTitle:@"发现" andImage:@"find" andSelectImage:@"find_fill"];
//
//    //购物车
//    YM_ShopCarViewController *shopCar = [[YM_ShopCarViewController alloc] init];
//    [self addViewController:shopCar andTitle:@"购物车" andImage:@"car" andSelectImage:@"car_fill"];
//
//    //我的
//    YM_PersonalViewController *personal = [[YM_PersonalViewController alloc] init];
//    [self addViewController:personal andTitle:@"我的" andImage:@"people" andSelectImage:@"people_fill"];
    
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
