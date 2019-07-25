//
//  UIImageView+Category.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)



+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName contentMode:(CGFloat)contentMode{
    UIImageView *img = [[UIImageView alloc] initWithFrame:frame];
    img.image = [UIImage imageNamed:imageName];
    img.contentMode = contentMode;
    return img;
}

@end
