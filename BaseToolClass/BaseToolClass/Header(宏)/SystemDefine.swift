//
//  SystemDefine.swift
//  PlantingAndFarming
//
//  Created by 靳建南 on 2018/5/16.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height


//控制器view的背景颜色
let BG_COLOR = RGBACOLOR(246, 246, 246, 1)
//Navigation 和 tabbarItem的选择颜色
let TABBAR_COLOR = RGBACOLOR(45, 149, 204, 1)
/*
 *** Label的字体颜色 LAB1_COLOR：正常颜色；LAB2_COLOR：一级灰；LAB3_COLOR：二级灰；
 */
let LAB1_COLOR = RGBACOLOR(51, 51, 51, 1)
let LAB2_COLOR = RGBACOLOR(102, 102, 102, 1)
let LAB3_COLOR = RGBACOLOR(153, 153, 153, 1)
//自定义cell分割线颜色
let LINE_COLOR = RGBACOLOR(237, 238, 239, 1)
//主按钮颜色
let MAINBTN_COLOR = RGBACOLOR(49, 180, 205, 1)
//边框颜色
let BORDER_COLOR = RGBACOLOR(229, 230, 231, 1)
//按钮灰色
let BTN_COLOR = RGBACOLOR(202, 202, 202, 1)
//按钮绿色
let BTN2_COLOR = RGBACOLOR(0, 160, 233, 1)
//按钮红色
let BTNRED_COLOR = RGBACOLOR(222, 66, 66, 1)
//按钮淡蓝
let BTN_LIGHT_GREEN_COLOR = RGBACOLOR(88,168,249,1)
//按钮蓝
let BTN_GREEN_COLOR = RGBACOLOR(66,156,250,1)
//判断 Phone 版本
let PHONE_MODEL_NAME = UIDevice.current.modelName


//状态栏的高度
let StatusHight = UIApplication.shared.statusBarFrame.size.height
//导航栏的高度
let NavHight = UINavigationController.init().navigationBar.frame.size.height
//状态栏+导航栏的高度
let NavAndStatusHight = StatusHight+NavHight
//内容高度
let MainHight = ScreenH-StatusHight-NavHight

/// iPhone设备
let isIPhone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
/// iPad设备
let isIPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)

//颜色
func RGBACOLOR(_ R:CGFloat,_ G:CGFloat,_ B:CGFloat,_ A:CGFloat) -> UIColor{
    return UIColor(red: (R)/255.0, green: (G)/255.0, blue: (B)/255.0, alpha: (A))
}

