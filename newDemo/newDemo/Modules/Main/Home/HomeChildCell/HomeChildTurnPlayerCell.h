//
//  HomeChildTurnPlayerCell.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "BaseCollectionViewCell.h"
//设置协议方法
@protocol TurnPlayerCellDelegate <NSObject>
@optional
- (void)whenDidScrollClick:(NSInteger)index;
@end

NS_ASSUME_NONNULL_BEGIN

@interface HomeChildTurnPlayerCell : BaseCollectionViewCell

@property (strong, nonatomic) NSTimer *timer;
//代理属性
@property(nonatomic, weak) id<TurnPlayerCellDelegate> delegate;

-(void)setupWithCell:(NSMutableArray *)imageArr;

@end

NS_ASSUME_NONNULL_END
