//
//  UserChildCell.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserChildCell : BaseTableViewCell

@property(strong,nonatomic)UIView * bgView;//背景
@property(strong,nonatomic)UIImageView * markImg;//图标
@property(strong,nonatomic)UILabel * titleLab;//内容
@property(strong,nonatomic)UIView * lineView;//分割线

-(void)setCellContent:(NSInteger)section withRow:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
