//
//  BaseCollectionViewCell.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    var FrameW:CGFloat!
    var FrameH:CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.FrameW = self.frame.width
        self.FrameH = self.frame.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
