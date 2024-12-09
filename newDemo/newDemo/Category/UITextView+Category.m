//
//  UITextView+Category.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "UITextView+Category.h"

@implementation UITextView (Category)

+(UITextView *)textViewWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font textColor:(UIColor*)textColor textAlignment:(CGFloat)textAlignment{
    UITextView * textView = [[UITextView alloc] initWithFrame:frame];
    textView.text = text;
    textView.font = [UIFont systemFontOfSize:font];
    textView.textColor = textColor;
    textView.textAlignment = textAlignment;
    return textView;
}

@end
