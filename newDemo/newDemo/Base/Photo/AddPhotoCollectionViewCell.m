//
//  AddPhotoCollectionViewCell.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2019/4/23.
//  Copyright © 2019年 靳建南. All rights reserved.
//

#import "AddPhotoCollectionViewCell.h"
#define  photoWeight (ScreenW-50)/4 //CollectionView的宽
@implementation AddPhotoCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        //添加照片
        _addImgBtn = [UIButton btnWithFrame:CGRectMake(0,0, photoWeight, photoWeight) title:@"请上传图片" titleColor:LAB3_COLOR titleFont:10 image:@"默认图片"];
        [_addImgBtn btnLayoutWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:8];
        _addImgBtn.userInteractionEnabled = NO;
        
        //给按钮绘虚线
        CAShapeLayer *border = [CAShapeLayer layer];
        border.strokeColor = LAB3_COLOR.CGColor;//虚线颜色
        border.fillColor = nil;
        border.path = [UIBezierPath bezierPathWithRect:_addImgBtn.bounds].CGPath;
        border.frame = _addImgBtn.bounds;
        border.lineWidth = 1.f;
        border.lineCap = @"square";
        border.lineDashPattern = @[@2, @2];
        [_addImgBtn.layer addSublayer:border];
        
        [self.contentView addSubview:_addImgBtn];
    }
    return self;
}

@end
