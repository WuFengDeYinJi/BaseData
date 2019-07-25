//
//  UITextView+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Category)

+(UITextView *)textViewWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font textColor:(UIColor*)textColor textAlignment:(CGFloat)textAlignment;

@end

NS_ASSUME_NONNULL_END
