//
//  UIButton+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,MKButtonEdgeInsetsStyle){
    MKButtonEdgeInsetsStyleTop, //image在上，label在下
    MKButtonEdgeInsetsStyleLeft,//image在左，label在右
    MKButtonEdgeInsetsStyleBottom,//image在下，lable在上
    MKButtonEdgeInsetsStyleRight,//image在右，lable在左
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)
//适配图片和文字的按钮方法
-(void)btnLayoutWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                    imageTitleSpace:(CGFloat)space;
//按钮点击事件
+(void)btnWithBtn:(UIButton *)btn target:(id)target action:(SEL)action;
//图片按钮
+(UIButton *)btnWithFrame:(CGRect)frame image:(NSString *)imageName;
//文字按钮
+(UIButton *)btnWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont backgroundColor:(UIColor *)backgroundColor;
//图文按钮
+(UIButton *)btnWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont image:(NSString *)image;
//圆角按钮
+(void)btnWithBtn:(UIButton *)btn cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
@end

NS_ASSUME_NONNULL_END
