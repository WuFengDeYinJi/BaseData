//
//  HomeVC.m
//  firstDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "HomeVC.h"
#import "ChatVC.h"
#import "TabBarViewController.h"
#import "HomeChildTurnPlayerCell.h"
#import "HomeChildFirstCell.h"
#import "HomeChildSecondCell.h"
#import "HomeChildFirstVIew.h"
@interface HomeVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,TurnPlayerCellDelegate>
@property (strong,nonatomic)UICollectionView * mainCV;
@end

@implementation HomeVC
{
    NSTimer *_mainTimer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";

    [self setPageView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //开启定时器
    [_mainTimer setFireDate:[NSDate distantPast]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    //关闭定时器
    [_mainTimer setFireDate:[NSDate distantFuture]];
}
-(UICollectionView *)mainCV{
    if (!_mainCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _mainCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
            // 指定代理
        _mainCV.dataSource = self;
        _mainCV.delegate = self;
        _mainCV.showsVerticalScrollIndicator = NO;
        //注册cell
        [_mainCV registerClass:[HomeChildTurnPlayerCell class] forCellWithReuseIdentifier:@"turnPlayerCell"];
        [_mainCV registerClass:[HomeChildFirstCell class] forCellWithReuseIdentifier:@"firstCell"];
        [_mainCV registerClass:[HomeChildSecondCell class] forCellWithReuseIdentifier:@"secondCell"];
        //headerView
        [_mainCV registerClass:[HomeChildFirstVIew class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView"];
    }
    return _mainCV;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //轮播图
    if (indexPath.section == 0) {
        HomeChildTurnPlayerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"turnPlayerCell" forIndexPath:indexPath];
        [cell setupWithCell:[NSMutableArray arrayWithObjects:@"banner",@"banner",@"banner",@"banner", nil]];
        cell.delegate = self;
        _mainTimer = cell.timer;
        return cell;
    }else if(indexPath.section == 1){
        HomeChildFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstCell" forIndexPath:indexPath];
        
        if (indexPath.item == 0){
            [cell setupWithCell:@"友友会"];
        }
        if (indexPath.item == 1){
            [cell setupWithCell:@"商城"];
        }
        if (indexPath.item == 2){
            [cell setupWithCell:@"家政"];
        }
        
        return cell;
    }else{
        HomeChildSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondCell" forIndexPath:indexPath];
        return cell;
    }
    
}
#pragma mark - headerView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 || indexPath.section == 2) {
        HomeChildFirstVIew *headerView = (HomeChildFirstVIew *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView" forIndexPath:indexPath];
        [headerView setupWithSection:indexPath.section];
        return headerView;
    }
    else{
        return nil;
    }
    
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 3;
    }else{
        return 30;
    }
}
#pragma mrak - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        [self jumpClick:indexPath.item];
    }
    if (indexPath.section == 2) {
        [self showHud:@"跳入推广页面" animated:YES afterHiden:2];
    }
}
#pragma mark - 跳入主页面
-(void)jumpClick:(NSInteger)index{
    if (index == 0){
        APPDELEGATE.pageType = @"chat";
        TabBarViewController *tabs = [[TabBarViewController alloc]init];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = tabs;
        [self.window makeKeyAndVisible];
    }else if (index == 1){
        APPDELEGATE.pageType = @"store";
        TabBarViewController *tabs = [[TabBarViewController alloc]init];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = tabs;
        [self.window makeKeyAndVisible];
    }else{
        APPDELEGATE.pageType = @"serve";
        TabBarViewController *tabs = [[TabBarViewController alloc]init];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = tabs;
        [self.window makeKeyAndVisible];
    }
    

}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenW, ScreenW * 300/750);
    }else if(indexPath.section == 1){
        return CGSizeMake(ScreenW/3 - 1, ScreenW/3 - 1);
    }else{
        return CGSizeMake(ScreenW/2 - 1, 50);
    }
    
}
#pragma mark - headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return CGSizeMake(0,0);
    }else{
        return CGSizeMake(ScreenW,30);
    }
    
}
#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark - section的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}
#pragma mark - 点击轮播图代理方法
- (void)whenDidScrollClick:(NSInteger)tag {
    [self showHud:@"跳入广告页面" animated:YES afterHiden:2];
}

#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.mainCV];
    [self.mainCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}


@end
