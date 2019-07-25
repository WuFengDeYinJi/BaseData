//
//  BaseViewController.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var hud:MBProgressHUD!
    var _window:UIWindow!
    var _coverView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = BG_COLOR
    }
    
    //创建collectionView
    func createCVFrame(frame:CGRect,backgroundColor:UIColor) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout.init()
        let vc = UICollectionView.init(frame: frame, collectionViewLayout: flowLayout)
        vc.backgroundColor = backgroundColor
        return vc
    }
    
    //HUD加载提示
    func showHud(title:String,animated:Bool,time:TimeInterval){
        
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
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
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.animationType = .zoomIn
        hud.removeFromSuperViewOnHide = animated
        hud.hide(animated: true, afterDelay: time)
    }
    //隐藏HUD
    func hideHud(){
        hud.hide(animated: true)
    }
    //覆盖涂层
    func setCoverView(){
        _window = UIApplication.shared.keyWindow
        //灰色覆盖背景
        _coverView = UIView.viewWithFrame(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH), backgroundColor: RGBACOLOR(0,0,0,0.5))
        _window.addSubview(_coverView)
        
        //背景添加点击事件，点击背景关闭视图
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        tap.numberOfTouchesRequired = 1
        tap.numberOfTapsRequired = 1
        _coverView.addGestureRecognizer(tap)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "coverView"), object: "1", userInfo: nil)
        
    }
    //点击手势的回调方法
    @objc func tapAction(){
        _coverView.removeFromSuperview()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "coverView"), object: "0", userInfo: nil)
    }
    //popVC
    func popVC(){
        let leftButton = UIBarButtonItem.init(image: UIImage(named:"返回"), style: .plain, target: self, action: #selector(popPreviousVC))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    @objc func popPreviousVC(){
        self.navigationController?.popViewController(animated:true)
    }
    
    func pushVC(vc:UIViewController,andTitle:String){
        vc.navigationItem.title = andTitle
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setLeftViewWithTextField(textField:UITextField,imageName:String) {
        let img = UIImageView.imageViewWithFrame(frame: CGRect.init(x: 10, y: 10, width: textField.frame.height, height: textField.frame.height-20), imageName: imageName, contentMode: 1)
        textField.leftView = img
        textField.leftViewMode = .always
        
    }
    func setRightViewWithTextField(textField:UITextField,imageName:String) {
        let img = UIImageView.imageViewWithFrame(frame: CGRect.init(x: 10, y: 10, width: textField.frame.height, height: textField.frame.height-20), imageName: imageName, contentMode: 1)
        textField.rightView = img
        textField.rightViewMode = .always
        
    }
    //重新登录
    func presentVCLogin() {
        let alertVC = UIAlertController(title: nil, message: "登录失效，重新登录", preferredStyle: UIAlertController.Style.alert)
        let acSure = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive) { (UIAlertAction) -> Void in
            let vc = HomeViewController()
            let nav = BaseNavigationViewController(rootViewController: vc)
//            APPDELEGATE.sessionId = nil
//            APPDELEGATE.userId = nil
//            APPDELEGATE.userName = nil
//            APPDELEGATE.roleCode = nil
//            APPDELEGATE.departmentId = nil
//            APPDELEGATE.userRealName = nil
//            APPDELEGATE.departmentName = nil
//            APPDELEGATE.sonId = nil
//            
//            let defaults = UserDefaults.standard
//            defaults.removeSuite(named: "sessionId")
//            defaults.removeSuite(named: "userId")
//            defaults.removeSuite(named: "userName")
//            defaults.removeSuite(named: "roleCode")
//            defaults.removeSuite(named: "departmentId")
//            defaults.removeSuite(named: "userRealName")
//            defaults.removeSuite(named: "departmentName")
//            defaults.removeSuite(named: "sonId")
            
            self.present(nav, animated: true, completion: nil)
            
        }
        
        alertVC.addAction(acSure)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    //获取文件路径
    func getFiler(filerName:String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filer = path.appendingPathComponent("Documents") as NSString;
        return filer as String
    }
    //跳转到QQ
    func jump(qq:String){
        if (self.haveQQ()) {
            self.chatWithQQ(QQ: qq)
        }else{
            let alert = UIAlertController(title: "温馨提示", message:"您的设备尚未安装QQ客户端,不能进行QQ临时会话", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func haveQQ() -> Bool {
        return UIApplication.shared.canOpenURL(NSURL.fileURL(withPath: "mqq://"))
    }
    func chatWithQQ(QQ:String) {
        let url = "mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web\(QQ)"
        UIApplication.shared.canOpenURL(NSURL.fileURL(withPath: url))
    }
    //观察者销毁
    deinit {
        // 移除通知
        print("\(self) 被释放了")
        NotificationCenter.default.removeObserver(self)
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
