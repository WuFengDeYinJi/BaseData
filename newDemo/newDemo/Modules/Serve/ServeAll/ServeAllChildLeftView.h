//
//  ServeAllChildLeftView.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServeAllChildLeftView : BaseView<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView * leftTV;
PropertyNSMutableArray(leftArr);
PropertyNSInteger(selectRow);
-(void)setLeftInfo:(NSMutableArray *)leftArr;
@property(nonatomic,copy)void(^blockSelectRow) (NSInteger);
@end

NS_ASSUME_NONNULL_END
