//
//  AppDelegate.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "AppDelegate.h"
#import "SystemDefine.h"
#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    //设置引导页（没有引导页，直接判断用户是否登录即可用）
    [self isLoginStatusMethod];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BaseToolSystem"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
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
        LoginViewController *vc = [[LoginViewController alloc] init];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
//    }
//    TabBarViewController *tabs = [[TabBarViewController alloc]init];
//    self.window.rootViewController = tabs;
//    [self.window makeKeyAndVisible];
}


#pragma mark - 禁止全局横屏
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
