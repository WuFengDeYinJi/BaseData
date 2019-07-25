//
//  UILabel+Category.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+(UILabel *)labWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(CGFloat)textAlignment{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = text;
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    lab.textAlignment = textAlignment;
    return lab;
}
+ (CGFloat)labGetHeightByWidth:(CGFloat)width title:(NSString *)title font:(CGFloat)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)labGetWidthWithTitle:(NSString *)title font:(CGFloat)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    [label sizeToFit];
    return label.frame.size.width;
}

@end
