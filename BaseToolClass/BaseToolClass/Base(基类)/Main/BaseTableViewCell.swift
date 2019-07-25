//
//  BaseTableViewCell.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //创建collectionView
    func createCVFrame(frame:CGRect,backgroundColor:UIColor) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout.init()
        let vc = UICollectionView.init(frame: frame, collectionViewLayout: flowLayout)
        vc.backgroundColor = backgroundColor
        return vc
    }
    
    
    func setRightViewWithTextField(textField:UITextField,imageName:String) {
        let img = UIImageView.imageViewWithFrame(frame: CGRect.init(x: 10, y: 10, width: textField.frame.height, height: textField.frame.height-20), imageName: imageName, contentMode: 1)
        textField.rightView = img
        textField.rightViewMode = .always
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none;
        // Configure the view for the selected state
    }

}
