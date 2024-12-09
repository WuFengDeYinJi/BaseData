//
//  UIImage+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

#pragma mark - 改变图片大小
+(UIImage *)imageResize:(UIImage*)img andResizeTo:(CGSize)newSize;


@end

NS_ASSUME_NONNULL_END
