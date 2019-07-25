//
//  ChooseOtherOperateView.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/8.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseOtherOperateView : BaseView<UITableViewDelegate,UITableViewDataSource>
-(void)setView:(NSString *)type contentArr:(NSMutableArray *)listArr currentStr:(NSString *)currentStr;
@property(strong, nonatomic)UIView * bgView;

@property(nonatomic,copy)void(^blockCellSeclectStr) (NSString *);

@end

NS_ASSUME_NONNULL_END
