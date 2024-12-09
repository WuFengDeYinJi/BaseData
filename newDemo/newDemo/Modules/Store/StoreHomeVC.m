//
//  StoreHomeVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "StoreHomeVC.h"
#import "TabBarViewController.h"
@interface StoreHomeVC ()

@end

@implementation StoreHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"商城";
    
    [self popVC];
}
-(void)popPreviousVC{
    APPDELEGATE.pageType = @"home";
    TabBarViewController *tabs = [[TabBarViewController alloc]init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabs;
    [self.window makeKeyAndVisible];
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
