//
//  SceneDelegate.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "SceneDelegate.h"
#import "SystemDefine.h"
#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "LoginVC.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.windowScene = (UIWindowScene*)scene;
    self.window.rootViewController = [[UIViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    
    //设置引导页（没有引导页，直接判断用户是否登录即可用）
    [self isLoginStatusMethod];

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
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

@end
