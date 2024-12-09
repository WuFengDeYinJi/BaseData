//
//  ServeAllChildLeftCell.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServeAllChildLeftCell : BaseTableViewCell

@property(strong,nonatomic)UIView * bgView;//背景
@property(strong,nonatomic)UIView * markView;//背景
@property(strong,nonatomic)UILabel * titleLab;//内容

-(void)setCellContent:(NSString *)leftInfoStr withRow:(NSInteger)row withSelectRow:(NSInteger)selectRow;
@end

NS_ASSUME_NONNULL_END
