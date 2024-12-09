//
//  UserVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "UserVC.h"
#import "UserChildCell.h"
@interface UserVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UIView *headView;
@property (strong,nonatomic)UIImageView *headImg;
@property (strong,nonatomic)UIButton *nameBtn;
@property (strong,nonatomic)UILabel *editLab;


@property (strong,nonatomic)UITableView *userTV;

@end

@implementation UserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";
    [self setPageView];
}
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = UIColor.whiteColor;
    }
    return _headView;
}
-(UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc]init];
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 40;
        [_headImg setImage:[UIImage imageNamed:@"head"]];
    }
    return _headImg;
}
-(UIButton *)nameBtn{
    if (!_nameBtn) {
        _nameBtn = [[UIButton alloc]init];
        [_nameBtn setTitle:@"默认昵称" forState:UIControlStateNormal];
        [_nameBtn setTitleColor:LAB1_COLOR forState:UIControlStateNormal];
        _nameBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _nameBtn;
}
-(UILabel *)editLab{
    if (!_editLab) {
        _editLab = [[UILabel alloc]init];
    }
    return _editLab;
}
-(UITableView *)userTV{
    if (!_userTV) {
        
        _userTV = [[UITableView alloc]initWithFrame:CGRectZero  style:UITableViewStyleGrouped];
            // 指定代理
        _userTV.dataSource = self;
        _userTV.delegate = self;
        _userTV.showsVerticalScrollIndicator = NO;
        _userTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _userTV;
}
#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
    }];
    
    [self.headView addSubview:self.headImg];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(80);
    }];
    
    [self.headView addSubview:self.nameBtn];
    [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImg.mas_right).offset(20);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.userTV];
    [self.userTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_bottom);
        make.left.bottom.right.mas_equalTo(0);
        
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tbCell = @"cell";
    UserChildCell *cell = [tableView dequeueReusableCellWithIdentifier:tbCell];
    if (!cell) {
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[UserChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tbCell];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCellContent:indexPath.section withRow:indexPath.row];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 2;
    }else{
        return 3;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView = [[UIView alloc]init];
    return footerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showHud:@"跳入相应页面" animated:YES afterHiden:2];
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
