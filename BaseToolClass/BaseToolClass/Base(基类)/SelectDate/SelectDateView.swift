//
//  SelectDateView.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class SelectDateView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var datePicker:UIDatePicker!
    var coverView:UIView!
    var dataStr:String! //日期
    var titleLab:UILabel!
    
    
    var blockSelectDate:((String)->())?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        //设置主窗口
        let window:UIWindow = UIApplication.shared.keyWindow!
        //覆盖半透明背景
        coverView = UIView.viewWithFrame(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH), backgroundColor: UIColor.black)
        coverView.alpha = 0.5
        window.addSubview(coverView)
        window.addSubview(self)
        //背景添加点击事件，点击背景关闭视图
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hideView))
        coverView.addGestureRecognizer(tap)
        //标题
        titleLab = UILabel.labWithFrame(frame: CGRect.init(x: 40, y: 0, width: ScreenW - 80, height: 40), text: "", font: 14, textColor: LAB2_COLOR, textAlignment: .center)
        self.addSubview(titleLab)
        //确定日期
        let sureDateBtn = UIButton.btn(btnWithFrame: CGRect.init(x: ScreenW - 40, y: 0, width: 40, height: 40), image: "确认打勾")
        sureDateBtn.addTarget(self, action: #selector(sureDateClicked), for: .touchUpInside)
        self.addSubview(sureDateBtn)
        
        //关闭窗口
        let closeBtn = UIButton.btn(btnWithFrame: CGRect.init(x: 0, y: 0, width: 40, height: 40), image: "地址关闭")
        closeBtn.addTarget(self, action: #selector(hideView), for: .touchUpInside)
        self.addSubview(closeBtn)
        
        //日期滚轮
        datePicker = UIDatePicker.init(frame: CGRect.init(x: 10, y: 40, width: ScreenW - 20, height: 180))
        datePicker.locale = NSLocale.init(localeIdentifier: "zh-CN") as Locale
        datePicker.date = Date()
        datePicker.maximumDate = Date.init(timeIntervalSinceNow: 0)
        datePicker.addTarget(self, action: #selector(selectDateClicked(_:)), for: .valueChanged)
        self.addSubview(datePicker)
        //赋初值
        let selectedDate = datePicker.date
        let timeInterval:TimeInterval = selectedDate.timeIntervalSince1970
        dataStr = String(Int(timeInterval))
        
        //显示页面
        self.showView()
    }
    
    @objc func sureDateClicked() {
        self.blockSelectDate!(dataStr)
        self.hideView()
    }
    
    @objc func hideView(){
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect.init(x: 0, y: ScreenH, width: ScreenW, height: 220)
        }
        coverView.isHidden = true;
    }
    
    @objc func selectDateClicked(_ dataPicker:UIDatePicker) {
        let selectedDate = dataPicker.date
        let timeInterval:TimeInterval = selectedDate.timeIntervalSince1970
        dataStr = String(Int(timeInterval))
        
    }
    
    func showView() {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect.init(x: 0, y: ScreenH-220, width: ScreenW, height: 220)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(#function)
    }

}
