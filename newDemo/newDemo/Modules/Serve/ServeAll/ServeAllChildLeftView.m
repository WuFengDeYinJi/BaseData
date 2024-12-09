//
//  ServeAllChildLeftView.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/15.
//

#import "ServeAllChildLeftView.h"
#import "ServeAllChildLeftCell.h"
@implementation ServeAllChildLeftView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    //需要页面更新好了再加载数据
    
    self.selectRow = 0;
    [self.leftTV reloadData];
}
-(void)setLeftInfo:(NSMutableArray *)leftArr{
    [self setPageView];
    self.leftArr = leftArr;
    
}
-(UITableView *)leftTV{
    if (!_leftTV) {
        
        _leftTV = [[UITableView alloc]initWithFrame:CGRectZero  style:UITableViewStylePlain];
        _leftTV.backgroundColor = UIColor.whiteColor;
            // 指定代理
        _leftTV.dataSource = self;
        _leftTV.delegate = self;
        _leftTV.showsVerticalScrollIndicator = NO;
        _leftTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
    }
    return _leftTV;
}
#pragma mark -- 页面约束
-(void)setPageView{
    [self addSubview:self.leftTV];
    [self.leftTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tbCell = @"cell";
    ServeAllChildLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:tbCell];
    if (!cell) {
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[ServeAllChildLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tbCell];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCellContent:self.leftArr[indexPath.row] withRow:indexPath.row withSelectRow:self.selectRow];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectRow = indexPath.row;
    [self.leftTV reloadData];
    
    self.blockSelectRow(indexPath.row);
}

@end
