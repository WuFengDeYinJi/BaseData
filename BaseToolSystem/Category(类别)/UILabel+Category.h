//
//  UILabel+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

+ (UILabel*)labWithFrame:(CGRect)frame text:(NSString*)text font:(CGFloat)font textColor:(UIColor*)textColor textAlignment:(CGFloat)textAlignment;
//自适应lab高度
+ (CGFloat)labGetHeightByWidth:(CGFloat)width title:(NSString *)title font:(CGFloat)font;
//自适应lab宽度
+ (CGFloat)labGetWidthWithTitle:(NSString *)title font:(CGFloat)font;

@end

NS_ASSUME_NONNULL_END
