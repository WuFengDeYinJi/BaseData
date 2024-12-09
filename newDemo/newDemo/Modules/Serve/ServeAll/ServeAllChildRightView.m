//
//  ServeAllChildRightView.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "ServeAllChildRightView.h"
#import "ServeAllChildRightReusableView.h"
#import "ServeAllChildRightCell.h"
@implementation ServeAllChildRightView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setPageView];
}
-(void)setupWithMainInfo:(NSString *)mainStr{
    self.mainStr = mainStr;
}

-(UICollectionView *)rightCV{
    if (!_rightCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _rightCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _rightCV.backgroundColor = UIColor.clearColor;
            // 指定代理
        _rightCV.dataSource = self;
        _rightCV.delegate = self;
        _rightCV.showsVerticalScrollIndicator = NO;
        //注册cell
        [_rightCV registerClass:[ServeAllChildRightCell class] forCellWithReuseIdentifier:@"rightCell"];
        //headerView
        [_rightCV registerClass:[ServeAllChildRightReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"rightHeaderView"];
    }
    return _rightCV;

}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ServeAllChildRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rightCell" forIndexPath:indexPath];
    [cell setupWithSection:indexPath.section withMainStr:self.mainStr];
    return cell;
}

#pragma mark - headerView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ServeAllChildRightReusableView *headerView = (ServeAllChildRightReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"rightHeaderView" forIndexPath:indexPath];
    [headerView setupWithSection:indexPath.section withMainStr:self.mainStr];
    return headerView;

}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
#pragma mrak - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(ScreenW/4*3, 180);
}
#pragma mark - headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(ScreenW/4*3,40);
}
#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark - section的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark -- 页面约束
-(void)setPageView{
    [self addSubview:self.rightCV];
    [self.rightCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}

@end
