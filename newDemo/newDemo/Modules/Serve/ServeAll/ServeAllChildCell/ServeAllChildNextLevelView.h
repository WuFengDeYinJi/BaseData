//
//  ServeAllChildNextLevelView.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServeAllChildNextLevelView : BaseView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UICollectionView * levelCV;

PropertyString(mainStr);
PropertyNSInteger(sectionInt);
-(void)setupWithSection:(NSInteger)section withMainStr:(NSString *)mainStr;
@end

NS_ASSUME_NONNULL_END
