//
//  ServeUserVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "ServeUserVC.h"
#import "TabBarViewController.h"

#import "ServeUserChildFirstCell.h"
#import "ServeUserChildSecondCell.h"
#import "ServeUserChildFirstView.h"
@interface ServeUserVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UICollectionView * serveUserCV;

@end

@implementation ServeUserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    
    [self setPageView];
    
    [self popVC];
}

-(UICollectionView *)serveUserCV{
    if (!_serveUserCV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _serveUserCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _serveUserCV.backgroundColor = UIColor.clearColor;
            // 指定代理
        _serveUserCV.dataSource = self;
        _serveUserCV.delegate = self;
        _serveUserCV.showsVerticalScrollIndicator = NO;
        //注册cell
        [_serveUserCV registerClass:[ServeUserChildFirstCell class] forCellWithReuseIdentifier:@"firstCell"];
        [_serveUserCV registerClass:[ServeUserChildSecondCell class] forCellWithReuseIdentifier:@"secondCell"];
        //headerView
        [_serveUserCV registerClass:[ServeUserChildFirstView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView"];
    }
    return _serveUserCV;
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //轮播图
    if(indexPath.section == 0){
        ServeUserChildFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstCell" forIndexPath:indexPath];
        [cell setupWithCell:indexPath.item];
        return cell;
    }else{
        ServeUserChildSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondCell" forIndexPath:indexPath];
        [cell setCellContent:indexPath.section withItem:indexPath.item];
        return cell;
    }
    
}
#pragma mark - headerView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ServeUserChildFirstView *headerView = (ServeUserChildFirstView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"firstHeaderView" forIndexPath:indexPath];
    return headerView;

}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        return 5;
    }else{
        return 2;
    }
}
#pragma mrak - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self showHud:@"跳入相应页面" animated:YES afterHiden:2];
    
}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenW/5-10, ScreenW/5 - 10);
    }else{
        return CGSizeMake(ScreenW, 50);
    }
    
}
#pragma mark - headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(ScreenW,20);
}
#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 0;
    }
    
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 0;
    }
}
#pragma mark - section的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.serveUserCV];
    [self.serveUserCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}

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
