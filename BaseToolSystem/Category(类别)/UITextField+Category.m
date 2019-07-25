//
//  UITextField+Category.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

+(UITextField *)textFieldWithFrame:(CGRect)frame palceholder:(NSString *)placeholder font:(CGFloat)font secureTextEntry:(BOOL)secureTextEntry{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:font];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.secureTextEntry = secureTextEntry;
    return textField;
}


@end
