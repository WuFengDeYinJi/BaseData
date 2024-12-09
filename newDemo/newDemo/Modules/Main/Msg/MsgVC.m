//
//  msgVC.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "MsgVC.h"
#import "MsgChildCell.h"
@interface MsgVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView * msgTV;
@end

@implementation MsgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    [self setPageView];
}
-(UITableView *)msgTV{
    if (!_msgTV) {
        
        _msgTV = [[UITableView alloc]initWithFrame:CGRectZero  style:UITableViewStylePlain];
        
            // 指定代理
        _msgTV.dataSource = self;
        _msgTV.delegate = self;
        _msgTV.showsVerticalScrollIndicator = NO;
        _msgTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _msgTV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
    }
    return _msgTV;
}
#pragma mark -- 页面约束
-(void)setPageView{
    [self.view addSubview:self.msgTV];
    [self.msgTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tbCell = @"cell";
    MsgChildCell *cell = [tableView dequeueReusableCellWithIdentifier:tbCell];
    if (!cell) {
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[MsgChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tbCell];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCellContent];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showHud:@"跳入消息详情页" animated:YES afterHiden:2];
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
