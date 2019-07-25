//
//  PhotoScrView.swift
//  BaseToolClass
//
//  Created by 靳建南 on 2018/11/9.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

class PhotoScrView: BaseView,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var photoSV:UIScrollView!
    var photoMainImgArr:[String]!
    var photoPageContorl:UIPageControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    //MARK:创建UIScrollView
    func createScrollView(imgArr:[String]!) {
        
        photoMainImgArr = imgArr
        if (photoSV != nil) {
            self.photoSV.removeFromSuperview()
        }
        if (photoPageContorl != nil) {
            self.photoPageContorl.removeFromSuperview()
        }
        
        //创建UIScrollView
        photoSV = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height:ScreenW * 400/750))
        photoSV.backgroundColor = UIColor.white
        photoSV.isPagingEnabled = true
        photoSV.bounces = false
        photoSV.showsHorizontalScrollIndicator = false
        photoSV.contentSize = CGSize.init(width: ScreenW*CGFloat(photoMainImgArr.count), height: 0)
        photoSV.contentOffset = CGPoint.init(x: 0, y: 0)
        photoSV.delegate = self
        self.addSubview(photoSV)
        
        for i in 0...photoMainImgArr.count-1 {
            let adimage = UIImageView.imageViewWithFrame(frame: CGRect.init(x: ScreenW * CGFloat(i), y: 0, width: ScreenW, height: ScreenW * 400/750), imageName: "", contentMode: 0)
            //处理中文字符
            let geturl=photoMainImgArr[i].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            adimage.sd_setImage(with: URL(string: geturl!), placeholderImage: UIImage(named:""))
            photoSV.addSubview(adimage)
            
            adimage.isUserInteractionEnabled = true
            adimage.tag = i+100
        }
        
        //创建pageControl
        photoPageContorl = UIPageControl.init(frame: CGRect.init(x: ScreenW/2-50, y: ScreenW*400/750-15, width: 100, height: 10))
        self.addSubview(photoPageContorl)
        photoPageContorl.pageIndicatorTintColor = BG_COLOR
        photoPageContorl.currentPageIndicatorTintColor = TABBAR_COLOR
        photoPageContorl.currentPage = 0
        photoPageContorl.numberOfPages = photoMainImgArr.count
        photoPageContorl.hidesForSinglePage = true
        photoPageContorl.layer.cornerRadius = photoPageContorl.frame.height/2
        //适配pageContorl的长度
        let pageSize = photoPageContorl.size(forNumberOfPages: photoMainImgArr.count)
        var pageFrame = photoPageContorl.frame
        pageFrame.size.width = pageSize.width+10
        pageFrame.origin.x = ScreenW/2 - (pageSize.width + 10)/2;
        photoPageContorl.frame = pageFrame
        
    }
    
    /*
     ***  UIScrollViewDelegate
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollviewW = scrollView.frame.width  //等于ScreenW
        let x = scrollView.contentOffset.x  //横向偏移量
        let page = (x + scrollviewW/2)/scrollviewW  //当偏移量超过scrollView的一半宽度，则下一页
        photoPageContorl.currentPage = Int(page)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print(#function)
    }

}
