//
//  ServeHomeVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "ServeHomeVC.h"
#import "TabBarViewController.h"

#import "ServeHomeChildFirstCell.h"
#import "ServeHomeChildSecondCell.h"
#import "ServeHomeChildThirdCell.h"
#import "ServeHomeChildFirstVIew.h"
@interface ServeHomeVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UICollectionView * serveHomeCV;

@end

@implementation ServeHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"家政";
    
    [self setPageView];
    
    [self popVC];
}

-(UICollectionView *)serveHomeCV{
    if (!_serveHomeCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _serveHomeCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
            // 指定代理
        _serveHomeCV.dataSource = self;
        _serveHomeCV.delegate = self;
        _serveHomeCV.showsVerticalScrollIndicator = NO;
        //注册cell
        [_serveHomeCV registerClass:[ServeHomeChildFirstCell class] forCellWithReuseIdentifier:@"firstCell"];
        [_serveHomeCV registerClass:[ServeHomeChildSecondCell class] forCellWithReuseIdentifier:@"secondCell"];
        [_serveHomeCV registerClass:[ServeHomeChildThirdCell class] forCellWithReuseIdentifier:@"thirdCell"];
        //headerView
        [_serveHomeCV registerClass:[ServeHomeChildFirstVIew class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView"];
    }
    return _serveHomeCV;
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //轮播图
    if(indexPath.section == 0){
        ServeHomeChildFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstCell" forIndexPath:indexPath];
        return cell;
    }else if(indexPath.section == 1){
        ServeHomeChildSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondCell" forIndexPath:indexPath];
        return cell;
    }else{
        ServeHomeChildThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thirdCell" forIndexPath:indexPath];
        return cell;
    }
    
}
#pragma mark - headerView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ServeHomeChildFirstVIew *headerView = (ServeHomeChildFirstVIew *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView" forIndexPath:indexPath];
    [headerView setupWithSection:indexPath.section];
    return headerView;

}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        return 10;
    }else if(section == 1){
        return 4;
    }else{
        return 20;
    }
}
#pragma mrak - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        [self showHud:@"跳入相应页面" animated:YES afterHiden:2];
    
}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenW/5-10, ScreenW/5 - 10);
    }else if(indexPath.section == 1){
        return CGSizeMake(ScreenW/2 - 20, 80);
    }else{
        return CGSizeMake(ScreenW/2 - 20, 220);
    }
    
}
#pragma mark - headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(ScreenW,30);
}
#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
#pragma mark - section的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
    
}

#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.serveHomeCV];
    [self.serveHomeCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}





#pragma mark -- 重写返回功能
-(void)popPreviousVC{
    APPDELEGATE.pageType = @"home";
    TabBarViewController *tabs = [[TabBarViewController alloc]init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabs;
    [self.window makeKeyAndVisible];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
