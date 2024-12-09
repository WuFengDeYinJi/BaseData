//
//  BaseCollectionReusableView.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>
//全局宏
#import "AppDelegate.h"
#import "URLDefine.h"
#import "SystemDefine.h"

//基础类
#import "MD5Encryption.h"
#import "HttpRequest.h"
//第三方
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <MJRefresh/MJRefresh.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

//分类
#import "NSString+Category.h"
#import "UIImageView+Category.h"
#import "UILabel+Category.h"
#import "UITextField+Category.h"
#import "UIView+Category.h"
#import "UIButton+Category.h"
#import "UITextView+Category.h"
#import "UIImage+Category.h"

NS_ASSUME_NONNULL_BEGIN

#define FrameW self.frame.size.width
@interface BaseCollectionReusableView : UICollectionReusableView

@end

NS_ASSUME_NONNULL_END
