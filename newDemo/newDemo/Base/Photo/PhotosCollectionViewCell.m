//
//  PhotosCollectionViewCell.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/12/17.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "PhotosCollectionViewCell.h"

#define  photoWeight (ScreenW-50)/4 //CollectionView的宽
@implementation PhotosCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.photosImg  = [[UIImageView alloc] init];
        self.photosImg.frame = CGRectMake(0, 0, photoWeight, photoWeight);
        [self.contentView addSubview:self.photosImg ];
        
        self.delBtn = [UIButton btnWithFrame:CGRectMake(photoWeight-20, 0, 20, 20) title:@"" titleColor:TABBAR_COLOR titleFont:12 image:@"地址关闭"];
        self.delBtn.hidden = YES;
        [self.contentView addSubview:self.delBtn];
    }
    
    return self;
}

@end
