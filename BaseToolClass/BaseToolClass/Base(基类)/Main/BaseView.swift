//
//  BaseView.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
// 

import UIKit

class BaseView: UIView {

    var hud:MBProgressHUD!
    
    //view跳转vc
    func viewController(view:UIView) -> UIViewController?{
        var next:UIResponder?
        next = self.next!
        repeat {
            //2.判断响应者对象是否是视图控制器类型
            if ((next as?UIViewController) != nil) {
                return (next as! UIViewController)
                
            }else {
                next = next?.next
            }
            
        } while next != nil
        
        return UIViewController()
    }
    
    //HUD加载提示
    func showHud(title:String,animated:Bool,time:TimeInterval){
        
        hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .text
        hud.animationType = .zoomIn
        hud.label.text = title;
        hud.label.font = UIFont.systemFont(ofSize: 14)
        hud.label.numberOfLines = 0
        hud.removeFromSuperViewOnHide = animated
        hud.hide(animated: true, afterDelay: time)
    }
    //显示图片
    func showHudImgName(imgName:String,animated:Bool,time:TimeInterval){
        hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .indeterminate
        hud.animationType = .zoomIn
        hud.removeFromSuperViewOnHide = animated
        hud.hide(animated: true, afterDelay: time)
    }
    //隐藏HUD
    func hideHud(){
        hud.hide(animated: true)
    }

}
