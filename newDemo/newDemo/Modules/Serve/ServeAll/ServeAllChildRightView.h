//
//  ServeAllChildRightView.h
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServeAllChildRightView : BaseView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UICollectionView * rightCV;
PropertyString(mainStr);
-(void)setupWithMainInfo:(NSString *)mainStr;
@end

NS_ASSUME_NONNULL_END
