//
//  ChooseOperateTableViewCell.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/20.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class ChooseOperateTableViewCell: BaseTableViewCell {

    var _titleLab:UILabel!
    var _chooseImg:UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _titleLab = UILabel.labWithFrame(frame: CGRect.init(x: 10, y: 0, width: ScreenW-80, height: 45), text: "", font: 13, textColor: LAB1_COLOR, textAlignment: .left)
        self.contentView.addSubview(_titleLab)
        
        _chooseImg = UIImageView.imageViewWithFrame(frame: CGRect.init(x: ScreenW-70-27/2, y: 45/2-20/4, width: 27/2, height: 20/2), imageName: "", contentMode: 0)
        self.contentView.addSubview(_chooseImg)
        
        let lineView = UIView.viewWithFrame(frame: CGRect.init(x: 10, y: 45-0.5, width: ScreenW-80, height: 0.5), backgroundColor: LINE_COLOR)
        self.contentView.addSubview(lineView)
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(#function)
    }
}
