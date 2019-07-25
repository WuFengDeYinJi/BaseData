//
//  EnlargeImageBrowser.h
//  ymMallSeller
//
//  Created by hai lin on 2017/7/19.
//  Copyright © 2017年 jiannan jin. All rights reserved.
//
//  图片放大
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EnlargeImageBrowser : NSObject

/**
 *  @brief  点击图片变成大图
 *
 *  @param  avatarImageView    图片所在的imageView
 */
+ (void)showImage:(UIImageView *)avatarImageView showArr:(NSMutableArray*)imgArr seclectedIndex:(int)seclectedInt;

@end
