//
//  AddPhotoCollectionViewCell.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class AddPhotoCollectionViewCell: BaseCollectionViewCell {
    
    var addImgBtn:UIButton!
    let photoWeight = (ScreenW-50)/4 //CollectionView的宽
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        //添加照片
        addImgBtn = UIButton.btn(btnWithFrame: CGRect.init(x: 0, y: 0, width: photoWeight, height: photoWeight), title: "添加照片", titleColor: LAB3_COLOR, titleFont: 10, image: "相机")
        addImgBtn.btnLayoutWithEdgeInsetsStyle(style: .MKButtonEdgeInsetsStyleTop, space: 8)
        addImgBtn.isUserInteractionEnabled = false
        
        //给按钮绘虚线
        let border:CAShapeLayer = CAShapeLayer()
        border.strokeColor = LAB3_COLOR.cgColor //虚线颜色
        border.fillColor = nil
        border.path = UIBezierPath.init(rect: addImgBtn.bounds).cgPath
        border.frame = addImgBtn.bounds
        border.lineWidth = 1.0
        border.lineCap = CAShapeLayerLineCap(rawValue: "square")
        border.lineDashPattern = [2, 2]
        addImgBtn.layer.addSublayer(border)
        
        self.contentView.addSubview(addImgBtn)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
