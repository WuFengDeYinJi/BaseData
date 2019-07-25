//
//  ChooseMoreOperateView.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2019/1/14.
//  Copyright © 2019年 靳建南. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseMoreOperateView : BaseView<UITableViewDelegate,UITableViewDataSource>

-(void)setView:(NSString *)type contentArr:(NSMutableArray *)listArr currentArr:(NSMutableArray *)currentArr;
@property(strong, nonatomic)UIView * bgView;

@property(nonatomic,copy)void(^blockCellSeclectArr) (NSMutableArray *);

@end

NS_ASSUME_NONNULL_END
