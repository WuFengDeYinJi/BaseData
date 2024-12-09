//
//  SystemDefine.h
//  firstDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#ifndef SystemDefine_h
#define SystemDefine_h

//APPDELEGATE单例类
#define APPDELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])
//屏幕的宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
//屏幕的高
#define ScreenH [UIScreen mainScreen].bounds.size.height
//颜色
#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]
//控制器view的背景颜色
#define BG_COLOR RGBACOLOR(246, 246, 246, 1)
//Navigation 和 tabbarItem的选择颜色
#define TABBAR_COLOR RGBACOLOR(222, 66, 66, 1)
/*
 *** Label的字体颜色 LAB1_COLOR：正常颜色；LAB2_COLOR：一级灰；LAB3_COLOR：二级灰；
 */
#define LAB1_COLOR RGBACOLOR(51, 51, 51, 1)
#define LAB2_COLOR RGBACOLOR(102, 102, 102, 1)
#define LAB3_COLOR RGBACOLOR(153, 153, 153, 1)
//自定义cell分割线颜色
#define LINE_COLOR RGBACOLOR(211, 212, 212, 1)
//边框颜色
#define BORDER_COLOR RGBACOLOR(229, 230, 231, 1)
//mark颜色
#define MARK_COLOR RGBACOLOR(21, 101, 251, 1)
//按钮灰色
#define BTN_COLOR RGBACOLOR(202, 202, 202, 1)
//按钮浅灰色
#define BTN2_COLOR RGBACOLOR(227, 228, 229, 1)
//按钮红色
#define BTN3_COLOR RGBACOLOR(222, 66, 66, 1)
//按钮蓝色
#define BTN4_COLOR RGBACOLOR(8, 111, 207, 1)
//按钮绿色
#define BLUE_COLOR RGBACOLOR(23, 99, 42, 1)
//按钮浅绿色
#define BLUE2_COLOR RGBACOLOR(88, 154, 76, 1)
//按钮橘色
#define ORNRGE_COLOR RGBACOLOR(231, 84, 34, 1)
//Navigation颜色
#define NAV_COLOR RGBACOLOR(255, 255, 255, 1)


//状态栏高度
//状态栏的高度
#ifdef __IPHONE_13_0 //判断是否是13以上系统
#define StatusHight [[UIApplication sharedApplication] windows].firstObject.windowScene.statusBarManager.statusBarFrame.size.height
#else
#define StatusHight [[UIApplication sharedApplication] statusBarFrame].size.height
#endif
//导航栏高度
#define NavHight self.navigationController.navigationBar.frame.size.height
//导航栏高度
#define TabBarHight self.tabBarController.tabBar.frame.size.height
//导航栏高度+状态栏高度
#define NavAndStatusHight StatusHight+NavHight
//导航栏高度+状态栏高度+tabbar高度
#define NavAndStatusAndTabBarHight StatusHight+NavHight+TabBarHight
//内容高度
#define MainNoTabBarHight ScreenH-StatusHight-NavHight

//内容高度
#define MainAndTabBarHight ScreenH-StatusHight-NavHight-TabBarHight

/*
 *** property 属性快速声明
 */
#define PropertyString(s) @property (nonatomic,copy) NSString * s
#define PropertyNSInteger(s) @property (nonatomic,assign) NSInteger  s
#define PropertyInt(s) @property (nonatomic,assign) int  s
#define PropertyFloat(s) @property (nonatomic,assign) float  s
#define PropertyLong(s) @property(nonatomic,assign)long  s
#define PropertyNSDictionary(s) @property (nonatomic,strong) NSDictionary * s
#define PropertyNSArray(s) @property (nonatomic,copy) NSArray * s
#define PropertyNSMutableArray(s) @property (nonatomic,copy) NSMutableArray * s

//model中字符串属性的声明
#define PropertyModelString(s) @property (copy, nonatomic) NSString<Optional> * s
#define PropertyModelNSArray(s) @property (copy, nonatomic) NSArray<Optional> * s
#define PropertyModelInt(s) @property (assign, nonatomic) int s
//控件属性的声明
#define PropertyLab(s) @property(strong,nonatomic)UILabel * s
#define PropertyBtn(s) @property(strong,nonatomic)UIButton * s
#define PropertyImg(s) @property(strong,nonatomic)UIImageView * s
#define PropertyTextField(s) @property(strong,nonatomic)UITextField * s


#endif /* SystemDefine_h */
