//
//  EnlargeImageBrowser.h
//  firstDemo
//
//  Created by 靳建南 on 2024/6/12.
//
//点击图片放大
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface EnlargeImageBrowser : NSObject

/**
 *  @brief  点击图片变成大图
 *
 *  @param  avatarImageView    图片所在的imageView
 */
+ (void)showImage:(UIImageView *)avatarImageView showArr:(NSMutableArray*)imgArr seclectedIndex:(int)seclectedInt;
@end

NS_ASSUME_NONNULL_END
