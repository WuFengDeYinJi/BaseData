//
//  ChooseOperateTableViewCell.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseOperateTableViewCell : BaseTableViewCell

-(void)setContent;
@property(strong ,nonatomic)UILabel * titleLab;
@property(strong ,nonatomic)UIImageView * chooseImg;

@end

NS_ASSUME_NONNULL_END
