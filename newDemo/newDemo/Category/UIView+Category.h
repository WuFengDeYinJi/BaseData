//
//  UIView+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)

//带背景颜色的view
+(UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
//带layer的View
+(UIView *)viewWithLayerFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor layerCornerRadius:(CGFloat)cornerRadius;
//画虚线
-(void)viewWithDrawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;

@end

NS_ASSUME_NONNULL_END
