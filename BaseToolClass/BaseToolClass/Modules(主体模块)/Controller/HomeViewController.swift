//
//  HomeViewController.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var _chooseOperateView:ChooseOperateOtherView!
    var _numStr:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.popVC()
//        _numStr = "1"
//        let btn = UIButton.btn(btnWithFrame: CGRect.init(x: 10, y: 10, width: 100, height: 50), title: "", titleColor: .clear, titleFont: 13, backgroundColor: BTNRED_COLOR)
//        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
//        self.view.addSubview(btn)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(coverView(_:)), name: NSNotification.Name(rawValue: "coverView"), object: nil)
        
    }
    
    @objc func click(){
        self.setCoverView()
        let midArr = ["1000","2100","3200","4300","5400","6500"]
        _chooseOperateView = ChooseOperateOtherView.init()
        if (midArr.count < 5) {
            let y2:CGFloat = CGFloat((70+midArr.count*45)/2)
            let yy:CGFloat = ScreenH/2-y2
            _chooseOperateView.frame = CGRect.init(x: CGFloat(30), y: yy, width: ScreenW-60, height: CGFloat(70+midArr.count*45))
        }else{
            _chooseOperateView.frame = CGRect.init(x: 30, y: ScreenH/2-(70+5*45)/2, width: ScreenW-60, height: 70+5*45);
            
        }
        _chooseOperateView.backgroundColor = UIColor.white
        self._window.addSubview(_chooseOperateView)
        _chooseOperateView._type = "选择数字"
        _chooseOperateView._contentArr = midArr
        _chooseOperateView._middleArr = midArr
        _chooseOperateView._currentString = _numStr
        _chooseOperateView.setView()
        _chooseOperateView.blockCellSeclectStr = {(str:String) in
            self._numStr = str
            self._coverView.removeFromSuperview()
            self._chooseOperateView.removeFromSuperview()
        }
    }
    
    //MARK:通知界面隐藏
    @objc func coverView(_ notification:NSNotification){
        if notification.object as! String == "1" {
            if _chooseOperateView != nil {
                _chooseOperateView.removeFromSuperview()
            }
            
        }else{
            if _chooseOperateView != nil {
                _chooseOperateView.removeFromSuperview()
                _coverView.removeFromSuperview()
            }
        }
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
