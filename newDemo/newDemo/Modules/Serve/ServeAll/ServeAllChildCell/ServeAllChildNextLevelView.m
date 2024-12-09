//
//  ServeAllChildNextLevelView.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/16.
//

#import "ServeAllChildNextLevelView.h"
#import "ServeAllChildNextLevelCell.h"
@implementation ServeAllChildNextLevelView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setPageView];
}

-(void)setupWithSection:(NSInteger)section withMainStr:(NSString *)mainStr{
    self.mainStr = mainStr;
    self.sectionInt = section;
}

-(UICollectionView *)levelCV{
    if (!_levelCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _levelCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _levelCV.backgroundColor = UIColor.clearColor;
            // 指定代理
        _levelCV.dataSource = self;
        _levelCV.delegate = self;
        _levelCV.showsVerticalScrollIndicator = NO;
        //注册cell
        [_levelCV registerClass:[ServeAllChildNextLevelCell class] forCellWithReuseIdentifier:@"levelCell"];
    }
    return _levelCV;

}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ServeAllChildNextLevelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"levelCell" forIndexPath:indexPath];
    return cell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}
#pragma mrak - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = @{@"level1":self.mainStr,@"level2":[NSString stringWithFormat:@"%ld",self.sectionInt],@"level3":[NSString stringWithFormat:@"%ld",indexPath.item+1]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"levelSelect" object:nil userInfo:dict];
}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(70, 70);
}

#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
#pragma mark - section的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark -- 页面约束
-(void)setPageView{
    [self addSubview:self.levelCV];
    [self.levelCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}
@end
