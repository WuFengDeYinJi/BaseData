//
//  TabBarViewController.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setUpAllChildViewController()
    }
    
    func setUpAllChildViewController() {
        let tabBar = UITabBarItem.appearance()
//        tabBar.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor : TABBAR_COLOR], for: .selected)
        tabBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : TABBAR_COLOR], for: .selected)
        let homeVC = HomeViewController.init()
        self.addViewController(homeVC, title: "首页", imageName: "home", selectImageName: "home_fill")
        
        
        self.selectedIndex = 0
    }
    //MARK:  ——————— 添加vc到tabbar中，并设置tabbaritem属性 ———————
    func addViewController(_ vc:UIViewController , title:String , imageName:String , selectImageName:String) {
        vc.view.backgroundColor = BG_COLOR
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named:selectImageName)?.withRenderingMode(.alwaysOriginal)
        
        let nav = BaseNavigationViewController.init(rootViewController: vc)
        self.addChild(nav)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
