//
//  ServeUserChildSecondCell.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServeUserChildSecondCell : BaseCollectionViewCell


@property(strong,nonatomic)UIView * bgView;//背景
@property(strong,nonatomic)UIImageView * markImg;//图标
@property(strong,nonatomic)UILabel * titleLab;//内容
@property(strong,nonatomic)UIView * lineView;//分割线

-(void)setCellContent:(NSInteger)section withItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
