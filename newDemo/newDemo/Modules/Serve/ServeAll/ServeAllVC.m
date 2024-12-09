//
//  ServeMsgVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "ServeAllVC.h"
#import "TabBarViewController.h"
#import "ServeAllChildLeftView.h"
#import "ServeAllChildRightView.h"
@interface ServeAllVC ()
@property(strong,nonatomic)ServeAllChildLeftView *leftView;
@property(strong,nonatomic)ServeAllChildRightView *rightView;
@end

@implementation ServeAllVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"全部服务";
    
    [self setPageView];
    
    NSMutableArray * leftArr = [[NSMutableArray alloc]init];
    [leftArr addObject:@"家政1"];
    [leftArr addObject:@"家政2"];
    [leftArr addObject:@"家政3"];
    [leftArr addObject:@"家政4"];
    [leftArr addObject:@"家政5"];
    [leftArr addObject:@"家政6"];
    [leftArr addObject:@"家政7"];
    [leftArr addObject:@"家政8"];
    [leftArr addObject:@"家政9"];
    [leftArr addObject:@"家政10"];
    [leftArr addObject:@"家政11"];
    [leftArr addObject:@"家政12"];
    
    [self.leftView setLeftInfo:leftArr];
    [self.rightView setupWithMainInfo:@"家政1"];
    
    __weak __typeof(self)wself = self;
    self.leftView.blockSelectRow = ^(NSInteger row) {
        [wself.rightView setupWithMainInfo:leftArr[row]];
        [wself.rightView.rightCV reloadData];
    };
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationLevelSelect:) name:@"levelSelect" object:nil];
    
    [self popVC];
}
#pragma mark - 注册极光点击推送通知方法
-(void)notificationLevelSelect:(NSNotification *)notification{
    NSDictionary *selectDic = [notification userInfo];
    [self showHud:[NSString stringWithFormat:@"选中了%@分类%@的第%@个模块",selectDic[@"level1"],selectDic[@"level2"],selectDic[@"level3"]] animated:YES afterHiden:2];
}
-(ServeAllChildLeftView *)leftView{
    if (!_leftView) {
        
        _leftView = [[ServeAllChildLeftView alloc]init];
    }
    return _leftView;
}
-(ServeAllChildRightView *)rightView{
    if (!_rightView) {
        
        _rightView = [[ServeAllChildRightView alloc]init];
    }
    return _rightView;
}
#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.leftView];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(ScreenW/4);
    }];
    
    [self.view addSubview:self.rightView];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(ScreenW/4*3);
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
