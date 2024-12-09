//
//  ChooseOperateView.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "ChooseOperateView.h"
#import "ChooseOperateTableViewCell.h"
@implementation ChooseOperateView
{
    UITableView * _mainContentListTV;
    NSMutableArray * _contentArr;
    
    NSString * _currentString;
    
}
-(void)setView:(NSString *)type contentArr:(NSMutableArray *)listArr currentStr:(NSString *)currentStr{
    
    //选择页面名称
    UILabel * headLab = [UILabel labWithFrame:CGRectMake(10, 0, self.frame.size.width-20, 70) text:type font:20 textColor:RGBACOLOR(88,168,249,1) textAlignment:0];
    [self addSubview:headLab];
    //分割线
    UIView * lineView = [UIView viewWithFrame:CGRectMake(0, 68, self.frame.size.width, 2) backgroundColor:RGBACOLOR(66,156,250,1)];
    [self addSubview:lineView];
    _contentArr = listArr;
    
    _currentString = currentStr;
    [self creatTableView];
}
#pragma mark - 创建TableView
-(void)creatTableView{
    //创建tableView
    _mainContentListTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 70,self.frame.size.width,self.frame.size.height-70) style:UITableViewStyleGrouped];
    _mainContentListTV.backgroundColor = [UIColor whiteColor];
    _mainContentListTV.showsHorizontalScrollIndicator = NO;
    _mainContentListTV.showsVerticalScrollIndicator = NO;
    _mainContentListTV.delegate = self;
    _mainContentListTV.dataSource = self;
    _mainContentListTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainContentListTV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_mainContentListTV];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [UIView viewWithFrame:CGRectMake(0, 0, self.frame.size.width-20, .1) backgroundColor:[UIColor clearColor]];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [UIView viewWithFrame:CGRectMake(0, 0, self.frame.size.width-20, .1) backgroundColor:[UIColor clearColor]];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contentArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *listCell = @"listCell";
    ChooseOperateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCell];
    //通过删除重用的cell的所有子视图，从而得到一个没有特殊格式的cell，供其他cell重用。
    if (!cell) {
        cell = [[ChooseOperateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCell];
    }
    cell.titleLab.text =_contentArr[indexPath.row];
    [cell setContent];
    if ([cell.titleLab.text isEqualToString:_currentString]) {
        cell.titleLab.textColor = TABBAR_COLOR;
        cell.chooseImg.hidden = NO;
        cell.chooseImg.image = [UIImage imageNamed:@"选择-无框"];
    }
    else{
        cell.titleLab.textColor = LAB1_COLOR;
        cell.chooseImg.hidden = YES;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentString = _contentArr[indexPath.row];
    [_mainContentListTV reloadData];
    self.blockCellSeclectStr(_currentString);
}

@end
