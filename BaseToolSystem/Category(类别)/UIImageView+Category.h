//
//  UIImageView+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName contentMode:(CGFloat)contentMode;

@end

NS_ASSUME_NONNULL_END
