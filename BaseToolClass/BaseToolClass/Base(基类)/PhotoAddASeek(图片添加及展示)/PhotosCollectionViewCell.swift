//
//  PhotosCollectionViewCell.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: BaseCollectionViewCell {
    let photoWeight = (ScreenW-50)/4 //CollectionView的宽
    var photosImg:UIImageView!
    var delBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photosImg = UIImageView.imageViewWithFrame(frame: CGRect.init(x: 0, y: 0, width: photoWeight, height: photoWeight), imageName: "", contentMode: 1)
        self.contentView.addSubview(photosImg)
        
        delBtn = UIButton.btn(btnWithFrame: CGRect.init(x: photoWeight-20, y: 0, width: 20, height: 20), title: "", titleColor: TABBAR_COLOR, titleFont: 12, backgroundColor:UIColor.clear)
        delBtn.setBackgroundImage(UIImage.init(named: "删除"), for: .normal)
        delBtn.isHidden = true
        self.contentView.addSubview(delBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
