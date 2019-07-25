//
//  ChooseMoreOperateView.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2019/1/14.
//  Copyright © 2019年 靳建南. All rights reserved.
//

#import "ChooseMoreOperateView.h"
#import "ChooseOperateTableViewCell.h"
@implementation ChooseMoreOperateView
{
    UITableView * _mainContentListTV;
    NSMutableArray * _contentArr;
    NSMutableArray * _currentArr;
    
}
-(void)setView:(NSString *)type contentArr:(NSMutableArray *)listArr currentArr:(NSMutableArray *)currentArr{
    _currentArr = [[NSMutableArray alloc]init];
    //选择页面名称
    UILabel * headLab = [UILabel labWithFrame:CGRectMake(10, 0, self.frame.size.width-20, 70) text:type font:20 textColor:RGBACOLOR(88,168,249,1) textAlignment:0];
    [self addSubview:headLab];
    //分割线
    UIView * lineView = [UIView viewWithFrame:CGRectMake(0, 68, self.frame.size.width, 2) backgroundColor:RGBACOLOR(66,156,250,1)];
    [self addSubview:lineView];
    //确认n按钮
    UIButton * confirmBtn = [UIButton btnWithFrame:CGRectMake(self.frame.size.width-50, 0, 50, 70) title:@"确认" titleColor:TABBAR_COLOR titleFont:15 backgroundColor:UIColor.clearColor];
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirmBtn];
    
    
    _contentArr = listArr;
    
    [_currentArr addObjectsFromArray:currentArr];
    
    [self creatTableView];
}

#pragma mark - 确认
- (void)clickConfirm{
    self.blockCellSeclectArr(_currentArr);
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
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
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

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return _contentArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *listCell = @"listCell";
    ChooseOperateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCell];
    //通过删除重用的cell的所有子视图，从而得到一个没有特殊格式的cell，供其他cell重用。
    if (!cell) {
        cell = [[ChooseOperateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listCell];
    }
    cell.titleLab.text =_contentArr[indexPath.row];
    [cell setContent];
    cell.titleLab.textColor = LAB1_COLOR;
    cell.chooseImg.hidden = YES;
    if (_currentArr.count > 0) {
        for (NSString * str in _currentArr) {
            if ([cell.titleLab.text isEqualToString:str]) {
                cell.titleLab.textColor = TABBAR_COLOR;
                cell.chooseImg.hidden = NO;
                cell.chooseImg.image = [UIImage imageNamed:@"打勾-选中"];
            }
        }
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BOOL isCurrent = NO;
    
    NSString * rowStr =_contentArr[indexPath.row];
    if (_currentArr.count > 0) {
        for (NSString * str in _currentArr) {
            if ([rowStr isEqualToString:str]) {
                isCurrent = YES;
            }
        }
    }
    
    if (isCurrent == YES) {
        [_currentArr removeObject:rowStr];
    }else{
        [_currentArr addObject:rowStr];
    }
    
    [_mainContentListTV reloadData];
    
}

@end
