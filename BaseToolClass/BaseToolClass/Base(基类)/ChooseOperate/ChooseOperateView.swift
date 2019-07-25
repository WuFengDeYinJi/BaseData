//
//  ChooseOperateView.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/20.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class ChooseOperateView: BaseView,UITableViewDelegate,UITableViewDataSource {

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var bgView:UIView!
    var _mainContentListTV:UITableView!
    var _type:String!
    var _contentArr:[String]!
    var _currentString:String!
    
    var blockCellSeclectStr:((String)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setView() {
        //MARK:选择页面名称
        let headLab = UILabel.labWithFrame(frame: CGRect.init(x: 10, y: 0, width: self.frame.size.width-20, height: 70), text: _type, font: 20, textColor: BTN_LIGHT_GREEN_COLOR, textAlignment: .left)
        self.addSubview(headLab)
        
        //MARK:分割线
        let lineView = UIView.viewWithFrame(frame: CGRect.init(x: 0, y: 68, width: self.frame.size.width, height: 2), backgroundColor: BTN_GREEN_COLOR)
        self.addSubview(lineView)
        
        self.creatTableView()
    }
    
    //MARK:创建TableView
    func creatTableView() {
        _mainContentListTV = UITableView(frame: CGRect(x:0,y:70,width:self.frame.size.width,height:self.frame.size.height-70), style:.grouped)
        _mainContentListTV.delegate = self
        _mainContentListTV.dataSource = self
        _mainContentListTV.backgroundColor = UIColor.white
        _mainContentListTV.showsVerticalScrollIndicator = false
        _mainContentListTV.showsHorizontalScrollIndicator = false
        _mainContentListTV.separatorStyle = .none
        _mainContentListTV.tableFooterView = UIView.init(frame: CGRect.zero)
        self.addSubview(self._mainContentListTV!)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _contentArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init()
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "listCell"
        var cell:ChooseOperateTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: identify)  as? ChooseOperateTableViewCell
        if (cell == nil) {
            cell = ChooseOperateTableViewCell.init(style: .default, reuseIdentifier: identify)
        }
        cell?._titleLab.text = _contentArr[indexPath.row]
        if cell?._titleLab.text == _currentString {
            cell?._titleLab.textColor = BTNRED_COLOR
            cell?._chooseImg.isHidden = false
            cell?._chooseImg.image = UIImage.init(named: "选择-无框")
        }else{
            cell?._titleLab.textColor = LAB1_COLOR
            cell?._chooseImg.isHidden = true
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _currentString = _contentArr[indexPath.row]
        _mainContentListTV.reloadData()
        self.blockCellSeclectStr!(_currentString)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(#function)
    }
}
