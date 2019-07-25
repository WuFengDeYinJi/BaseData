//
//  Extension.swift
//  PlantingAndFarming
//
//  Created by 靳建南 on 2018/5/10.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit

let Phone4 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) < 568.0 ? true : false)
let Phone5 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 568.0 ? true : false)
let Phone6 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
let Phone6Plus = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 736.0 ? true : false)
let Phone6S = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
let Phone6SPlus = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 640.0 ? true : false)
let Phone7 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
let Phone7Plus = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 640.0 ? true : false)
let Phone8 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
let Phone8Plus = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 640.0 ? true : false)
let PhoneX = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 812.0 ? true : false)

var oldframe:CGRect!


// MARK:字符串类方法
extension String{
    enum Validate {
        case email(_: String) //邮箱判断
        case URL(_: String) //URL判断
        case Telephone(_: String) //手机号判断
        case Num(_: String) //4位纯数字，验证码判断
    }
    //判断邮箱，链接，手机号，验证码
    static func isRight(style:Validate) -> Bool {
        var predicateStr:String!
        var currObject:String!
        switch style {
        case let .email(str):
            predicateStr = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            currObject = str
        case let .URL(str):
            predicateStr = "http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?"
            currObject = str
        case let .Telephone(str):
            predicateStr = "^1(3[0-9]|4[0-9]|5[0-9]|8[0-9])\\d{8}$"
            currObject = str
        case let .Num(str):
            predicateStr = "^\\d{4}$"
            currObject = str
        }
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with:currObject)
    }
    //时间戳转换为时间 yyyy年MM月dd日
    static func strignWithDayZHString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from:date as Date))
        return dfmatter.string(from:date as Date)
    }
    //时间戳转换为时间 yyyy-MM-dd HH:mm:ss
    static func stringWithDateString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from:date as Date))
        return dfmatter.string(from:date as Date)
    }
    //时间戳转换为时间 yyyy-MM-dd
    static func stringWithDayString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from:date as Date))
        return dfmatter.string(from:date as Date)
    }
    //时间戳转换为时间 yyyy.MM.dd
    static func stringWithDaySecondString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy.MM.dd"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from:date as Date))
        return dfmatter.string(from:date as Date)
    }
    //时间戳转换为时间 剩余3天20小时50分20秒
    static func stringWithTimeRemainingString(timeStamp:String)->String {
        
        let string = NSString(string: timeStamp)
        
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="剩余dd天HH小时mm分ss秒"
        
        let date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.string(from:date as Date))
        return dfmatter.string(from:date as Date)
    }
    //设置字符串中某几个字符的颜色不同
    static func text(text:String,textColor:UIColor,range:NSRange )->NSMutableAttributedString{
        let str = NSMutableAttributedString.init(string: text)
        str.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        return str
    }
    //设置字符串中某几个字符的颜色和字体不同
    static func text(text:String,textFont:CGFloat,textColor:UIColor,range:NSRange )->NSMutableAttributedString{
        let font = UIFont.systemFont(ofSize: textFont)
        let str = NSMutableAttributedString.init(string: text)
        str.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        str.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        return str
    }
    //去掉空格
    static func stringWithCleanBlandString(blandString:String)->String{
        var str = blandString
        str = str.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        return str
    }
    //如果为nil就返回空
    static func stringIsNilStr(_ nilString:String?)->String{
        var str:String
        if (nilString != nil) {
            str = nilString!
        }else{
            str = ""
        }
        return str
    }
    //获取当前时间
    static func getCurrentTime()->String{
        // 创建一个日期格式器
        //获取当前时间
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return dformatter.string(from: now)
    }
    //获取当前时间
    static func getCurrentTimeTWO()->String{
        // 创建一个日期格式器
        //获取当前时间
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dformatter.string(from: now)
    }
    //获取当前时间
    static func getCurrentDate()->String{
        // 创建一个日期格式器
        //获取当前时间
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        return dformatter.string(from: now)
    }
    //获取当前时间戳
    static func getCurrentTimeType()->String{
        // 创建一个日期格式器
        //获取当前时间
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(Int(timeInterval))
        return timeStamp
    }
    //时间转时间戳
    static func stringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd HH:mm:ss"
        let date = dfmatter.date(from:stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)*1000 //13位时间戳，精确到毫秒
        print(dateSt)
        return String(dateSt)
        
    }
    //时间转时间戳
    static func stringToDayStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd"
        let date = dfmatter.date(from:stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)*1000 //13位时间戳，精确到毫秒
        print(dateSt)
        return String(dateSt)
        
    }
    //自适应lab高度
    static func stringGetHeightByWidth(width:CGFloat,title:String,font:CGFloat) -> CGFloat{
        let lab = UILabel.init(frame: CGRect(x:0,y:0,width:width,height:CGFloat.greatestFiniteMagnitude))
        lab.text = title
        if (Phone6 || Phone6Plus || Phone6S || Phone6SPlus || Phone7 || Phone7Plus || Phone8 || Phone8Plus) {
            lab.font = UIFont.systemFont(ofSize: font + 1)
        }else if(PhoneX){
            lab.font = UIFont.systemFont(ofSize: font + 2)
        }
        else{
            lab.font = UIFont.systemFont(ofSize: font)
        }
        lab.numberOfLines = 0
        lab.sizeToFit()
        let height = lab.frame.size.height
        
        return height
    }
    //生成tocken
    static func setTockenOfModule(module:String,andController:String,andAction:String) ->String{
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dformatter.string(from: now)
        let md5Str = "\(module)\(andController)\(andAction)\(dateStr)"
        let token = md5Str.md5
        return token
        
    }
    //获取请求头的tocken
    static func setHeaderTockenOfModule(module:String,andController:String,andAction:String,andCurretnTime:String)->String{
        let md5Str = "\(module)\(andController)\(andAction)\(andCurretnTime)"
        let token = md5Str.md5
        return token
    }
    //压缩图片
    static func zipImageWithImage(image: UIImage) -> Data{
        
        //prepare constants
        let width = image.size.width
        let height = image.size.height
        let scale = width/height
        
        var sizeChange = CGSize()
        
        if width <= 400 { //图片宽度小于400时图片尺寸保持不变,不改变图片大小
            var compressedData = UIImage.jpegData(image)(compressionQuality: 1)
//            var compressedData = UIImageJPEGRepresentation(image, 1)
            var compressImage = image
            
            while compressedData!.count > 102400 {
                compressedData = UIImage.jpegData(compressImage)(compressionQuality: 0.5)
//                compressedData = UIImageJPEGRepresentation(compressImage, 0.5)
                compressImage = UIImage(data: compressedData!)!
            }
            
            //print(compressedData!.count)
            return compressedData!
            
        }else{
            
            let changedWidth:CGFloat = 400
            let changedheight:CGFloat = changedWidth / scale
            sizeChange = CGSize(width: changedWidth, height: changedheight)
            
        }
        
        UIGraphicsBeginImageContext(sizeChange)
        
        //draw resized image on Context
        image.draw(in: CGRect.init(x:0,y:0,width:sizeChange.width,height:sizeChange.height))
        
        //create UIImage
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        var compressedData = UIImage.jpegData(resizedImg!)(compressionQuality: 1)
//        var compressedData = UIImageJPEGRepresentation(resizedImg!, 1)
        var compressImage = resizedImg
        while compressedData!.count > 102400 {
            compressedData = UIImage.jpegData(compressImage!)(compressionQuality: 0.5)
//            compressedData = UIImageJPEGRepresentation(compressImage!, 0.5)
            compressImage = UIImage(data: compressedData!)!
        }
        //print(compressedData!.count)
        return compressedData!
    }
    
    //字典转换为JSONString
    static func getJSONStringFromAny(object:Any) -> String {
        if (!JSONSerialization.isValidJSONObject(object)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: object, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
    
}








// MARK:图片视图类方法
extension UIImageView{
    //创建图片视图
    static func imageViewWithFrame(frame:CGRect,imageName:String,contentMode:CGFloat) -> UIImageView{
        let img = UIImageView.init(frame:frame)
        img.image = UIImage(named:imageName)
        img.contentMode = UIView.ContentMode(rawValue: Int(contentMode))!
        return img
        
    }
    //图片放大
    static func showImage(avatarImageView:UIImageView,imgArr:Array<String>,seclectedInt:Int){
        let window:UIWindow = UIApplication.shared.keyWindow!
        //创建背景
        let backgroundView = UIView.viewWithFrame(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH), backgroundColor: UIColor.black)
        backgroundView.alpha = 0
        oldframe = avatarImageView.convert(avatarImageView.bounds, from: window)
        //创建ScrollView
        let scr = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH))
        backgroundView.addSubview(scr)
        scr.isPagingEnabled = true
        scr.bounces = false
        scr.showsHorizontalScrollIndicator = false
        scr.contentSize = CGSize.init(width: Int(ScreenW) * imgArr.count, height: 0)
        scr.contentOffset = CGPoint.init(x: seclectedInt * Int(ScreenW), y: 0)
        
        for i in 0...(imgArr.count-1) {
            let imgView = UIImageView.init()
            imgView.frame = CGRect.init(x: CGFloat(i)*ScreenW, y: 20, width: ScreenW, height: ScreenH-20)
            imgView.contentMode = .scaleAspectFit //这句必须放在前面，否则会因为代码运行周期的时间长短导致这句代码可能不被执行
            
            let imgPath = APPDELEGATE.RootHost+imgArr[i]
            let geturl=imgPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) //处理中文字符
            imgView.sd_setImage(with: URL(string:geturl!), placeholderImage: UIImage(named:"默认图片"))
            scr.addSubview(imgView)
            
            imgView.isUserInteractionEnabled = true
        }
        
        backgroundView.addSubview(scr)
        window.addSubview(backgroundView)
        
        //背景添加点击事件，点击背景关闭视图
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(UIImageView.hideImage(_:)))
        backgroundView.addGestureRecognizer(tap)
        
        UIView.animate(withDuration: 0.2) {
            backgroundView.alpha = 1
        }
    }
    //图片消失
    @objc static func hideImage(_ tap:UITapGestureRecognizer){
        let backgroundView = tap.view as UIView?
        if let view = backgroundView{
            UIView.animate(withDuration: 0.2, animations: {
                let imageView = UIImageView.init()
                imageView.frame = oldframe
                view.alpha = 0
            }, completion: { (finished) in
                view.removeFromSuperview()
            })
        }
    }
}






// MARK:json解析
extension NSDictionary{
    static func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
}



// MARK:文本展示类方法
extension UILabel{
    
    //创建lab
    static func labWithFrame(frame:CGRect,text:String,font:CGFloat,textColor:UIColor,textAlignment:NSTextAlignment) ->UILabel{
        let lab = UILabel.init(frame: frame)
        lab.text = text
        lab.textColor = textColor
        lab.textAlignment = textAlignment
        if (Phone6 || Phone6Plus || Phone6S || Phone6SPlus || Phone7 || Phone7Plus || Phone8 || Phone8Plus) {
            lab.font = UIFont.systemFont(ofSize: font + 1)
        }else if(PhoneX){
            lab.font = UIFont.systemFont(ofSize: font + 2)
        }
        else{
            lab.font = UIFont.systemFont(ofSize: font)
        }
        return lab
    }
    //自适应lab高度
    static func labGetHeightByWidth(width:CGFloat,title:String,font:CGFloat) -> CGFloat{
        let lab = UILabel.init(frame: CGRect(x:0,y:0,width:width,height:CGFloat.greatestFiniteMagnitude))
        lab.text = title
        if (Phone6 || Phone6Plus || Phone6S || Phone6SPlus || Phone7 || Phone7Plus || Phone8 || Phone8Plus) {
            lab.font = UIFont.systemFont(ofSize: font + 1)
        }else if(PhoneX){
            lab.font = UIFont.systemFont(ofSize: font + 2)
        }
        else{
            lab.font = UIFont.systemFont(ofSize: font)
        }
        lab.numberOfLines = 0
        lab.frame.size.height = lab.frame.size.height
        let height = lab.frame.size.height
        
        return height
    }
    //自适应lab宽度
    static func labGetWidthWithTitle(title:String,font:CGFloat) -> CGFloat{
        let lab = UILabel.init(frame: CGRect(x:0,y:0,width:1000,height:0))
        lab.text = title
        if (Phone6 || Phone6Plus || Phone6S || Phone6SPlus || Phone7 || Phone7Plus || Phone8 || Phone8Plus) {
            lab.font = UIFont.systemFont(ofSize: font + 1)
        }else if(PhoneX){
            lab.font = UIFont.systemFont(ofSize: font + 2)
        }
        else{
            lab.font = UIFont.systemFont(ofSize: font)
        }
        lab.sizeToFit()
        return lab.frame.size.width;
    }
}






// MARK:UITextField类方法
extension UITextField{
    //创建UITextField视图
    static func textFieldWithFrame(frame:CGRect,placeholder:String,font:CGFloat,secureTextEntry:Bool) -> UITextField{
        let textField = UITextField.init(frame: frame)
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: font)
        textField.isSecureTextEntry = secureTextEntry
        return textField
        
    }
}
// MARK:UITextView类方法
extension UITextView{
    
    //创建UITextView视图
    static func textViewWithFrame(frame:CGRect,text:String,font:CGFloat,textColor:UIColor,textAlignment:NSTextAlignment) -> UITextView{
        let textView = UITextView.init(frame: frame)
        textView.text = text
        textView.textColor = textColor
        textView.textAlignment = textAlignment
        if (Phone6 || Phone6Plus || Phone6S || Phone6SPlus || Phone7 || Phone7Plus || Phone8 || Phone8Plus) {
            textView.font = UIFont.systemFont(ofSize: font + 1)
        }else if(PhoneX){
            textView.font = UIFont.systemFont(ofSize: font + 2)
        }
        else{
            textView.font = UIFont.systemFont(ofSize: font)
        }
        return textView
    }
}



// MARK:UIView类方法
extension UIView{
    
    //创建UIView视图
    static func viewWithFrame(frame:CGRect,backgroundColor:UIColor) -> UIView{
        let view = UIView.init(frame: frame)
        view.backgroundColor = backgroundColor
        return view
        
    }
    //UIView的layer
    static func viewWithLayerFrame(frame:CGRect,backgroundColor:UIColor,cornerRadius:CGFloat) -> UIView{
        let view = UIView.init(frame: frame)
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = true;
        return view
    }
}







// MARK:UIButton类方法
extension UIButton{
    
    enum MKButtonEdgeInsetsStyle{
        
        case MKButtonEdgeInsetsStyleTop
        case MKButtonEdgeInsetsStyleLeft
        case MKButtonEdgeInsetsStyleBottom
        case MKButtonEdgeInsetsStyleRight
        
    }
    //按钮图文排布
    func btnLayoutWithEdgeInsetsStyle(style:MKButtonEdgeInsetsStyle,space:CGFloat) {

        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        if #available(iOS 8.0, *) {
            labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
            labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
        }
        else{
            labelWidth = (self.titleLabel?.frame.size.width)!
            labelHeight = (self.titleLabel?.frame.size.height)!
        }
        

        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        

        switch (style) {
        case .MKButtonEdgeInsetsStyleTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space, right: 0)
        case .MKButtonEdgeInsetsStyleLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space, bottom: 0, right: space)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: -space)
        case .MKButtonEdgeInsetsStyleBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space, left: -imageWidth, bottom: 0, right: 0)
        case .MKButtonEdgeInsetsStyleRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space, bottom: 0, right: -labelWidth-space)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-space, bottom: 0, right: imageWidth+space)
        }

        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
    //按钮创建
    class func btn(btnWithFrame:CGRect,image:String) -> UIButton {
        let btn = UIButton(type:.custom)
        btn.frame = btnWithFrame
        btn.setImage(UIImage(named:image), for: .normal)
        return btn
    }
    //按钮创建
    class func btn(btnWithFrame:CGRect,title:String,titleColor:UIColor,titleFont:CGFloat,backgroundColor:UIColor) -> UIButton  {
        let btn = UIButton(type:.custom)
        btn.frame = btnWithFrame
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
        btn.backgroundColor = backgroundColor
        return btn
    }
    //按钮创建
    class func btn(btnWithFrame:CGRect,title:String,titleColor:UIColor,titleFont:CGFloat,image:String) -> UIButton  {
        let btn = UIButton(type:.custom)
        btn.frame = btnWithFrame
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
        btn.setImage(UIImage(named:image), for: .normal)
        return btn
    }
    //按钮的layer
    class func btn(withBtn:UIButton,cornerRadius:CGFloat,borderColor:UIColor,borderWidth:CGFloat) {
        withBtn.layer.cornerRadius = cornerRadius;
        withBtn.layer.borderColor = borderColor.cgColor;
        withBtn.layer.borderWidth = borderWidth;
        withBtn.layer.masksToBounds = true;
    }
}


public extension UIDevice {

    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
    
        switch identifier {
        case "iPod1,1":  return "iPod Touch 1"
        case "iPod2,1":  return "iPod Touch 2"
        case "iPod3,1":  return "iPod Touch 3"
        case "iPod4,1":  return "iPod Touch 4"
        case "iPod5,1":  return "iPod Touch (5 Gen)"
        case "iPod7,1":   return "iPod Touch 6"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
        case "iPhone4,1":  return "iPhone 4s"
        case "iPhone5,1":   return "iPhone 5"
        case  "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":  return "iPhone 5c (GSM)"
        case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":  return "iPhone 5s (GSM)"
        case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":  return "iPhone 6"
        case "iPhone7,1":  return "iPhone 6 Plus"
        case "iPhone8,1":  return "iPhone 6s"
        case "iPhone8,2":  return "iPhone 6s Plus"
        case "iPhone8,4":  return "iPhone SE"
        case "iPhone9,1":   return "国行、日版、港行iPhone 7"
        case "iPhone9,2":  return "港行、国行iPhone 7 Plus"
        case "iPhone9,3":  return "美版、台版iPhone 7"
        case "iPhone9,4":  return "美版、台版iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":   return "iPhone 8"
        case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":   return "iPhone X"
            
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":   return "iPad Air 2"
        case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
        case "AppleTV2,1":  return "Apple TV 2"
        case "AppleTV3,1","AppleTV3,2":  return "Apple TV 3"
        case "AppleTV5,3":   return "Apple TV 4"
        case "i386", "x86_64":   return "Simulator"
        default:  return identifier
        }
    }
}
