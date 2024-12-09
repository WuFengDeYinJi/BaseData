//
//  AppDelegate.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "AppDelegate.h"
#import "SystemDefine.h"
#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "LoginVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    APPDELEGATE.pageType = @"home";
    
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = [[UIViewController alloc]init];
        [self.window makeKeyAndVisible];

        //设置引导页（没有引导页，直接判断用户是否登录即可用）
        [self isLoginStatusMethod];
        
        return YES;
    
    
}


#pragma mark - 是否登录
-(void)isLoginStatusMethod{
//    APPDELEGATE.isOpenAPP = @"1";
//    NSString *loginState = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginState"];
//    //登录状态
//    if ([loginState isEqualToString:@"1"]){
//
        APPDELEGATE.user_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
        APPDELEGATE.api_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"api_token"];
        
//        APPDELEGATE.user_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
//        NSLog(@"%@",APPDELEGATE.user_id);
//        NSLog(@"%@",APPDELEGATE.api_token);
//        NSLog(@"%@",APPDELEGATE.user_name);
//
//        TabBarViewController *tabs = [[TabBarViewController alloc]init];
//        self.window.rootViewController = tabs;
//        [self.window makeKeyAndVisible];
//    }
    
//    else{
//
//        LoginVC *vc = [[LoginVC alloc] init];
//        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
//        self.window.rootViewController = nav;
//        [self.window makeKeyAndVisible];
//    }
    TabBarViewController *tabs = [[TabBarViewController alloc]init];
    self.window.rootViewController = tabs;
    [self.window makeKeyAndVisible];
}


#pragma mark - 禁止全局横屏
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    return UIInterfaceOrientationMaskPortrait;
}
@end
