//
//  BaseNavigationController.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseNavigationController.h"
#import "SystemDefine.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化视图（首页）
    [[UINavigationBar appearance] setBarTintColor:NAV_COLOR];
    //设置状态栏字体颜色
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18],NSForegroundColorAttributeName:LAB1_COLOR}];
    [[UINavigationBar appearance] setTintColor:LAB1_COLOR];
    //取消透明度，没有色差，但是self.view的原点的y值计算从原来的64变为0；
    [[UINavigationBar appearance] setTranslucent:NO];
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
