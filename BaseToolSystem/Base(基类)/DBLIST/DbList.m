//
//  DbList.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "DbList.h"

@implementation DbList

#pragma mark - 共享信息库
-(NSMutableArray *)setDbShareInfo{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"商品共享库" forKey:@"title"];
    [dic1 setValue:@"ShareInfo" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"经营者共享库" forKey:@"title"];
    [dic2 setValue:@"ShareInfo" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    return dbList;
}
#pragma mark - 基础信息管理
-(NSMutableArray *)setDbBaseInfo{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"商品" forKey:@"title"];
    [dic1 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"原辅料" forKey:@"title"];
    [dic2 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setValue:@"生产商管理" forKey:@"title"];
    [dic3 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic3];
    
    NSMutableDictionary * dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setValue:@"供货商管理" forKey:@"title"];
    [dic4 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic4];
    
    NSMutableDictionary * dic5 = [[NSMutableDictionary alloc]init];
    [dic5 setValue:@"购货商管理" forKey:@"title"];
    [dic5 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic5];
    
    NSMutableDictionary * dic6 = [[NSMutableDictionary alloc]init];
    [dic6 setValue:@"生产设备" forKey:@"title"];
    [dic6 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic6];
    
    NSMutableDictionary * dic7 = [[NSMutableDictionary alloc]init];
    [dic7 setValue:@"检验方案" forKey:@"title"];
    [dic7 setValue:@"BaseInfo" forKey:@"orderName"];
    [dbList addObject:dic7];
    
    //    NSMutableDictionary * dic8 = [[NSMutableDictionary alloc]init];
    //    [dic8 setValue:@"人员信息" forKey:@"title"];
    //    [dic8 setValue:@"BaseInfo" forKey:@"orderName"];
    //    [dbList addObject:dic8];
    
    return dbList;
}
#pragma mark - 台账管理
-(NSMutableArray *)setDbReportManage{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic12 = [[NSMutableDictionary alloc]init];
    [dic12 setValue:@"即时库存" forKey:@"title"];
    [dic12 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic12];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"原辅料进货单" forKey:@"title"];
    [dic1 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"原辅料退货单" forKey:@"title"];
    [dic2 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setValue:@"商品销货单" forKey:@"title"];
    [dic3 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic3];
    
    NSMutableDictionary * dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setValue:@"商品销货退货单" forKey:@"title"];
    [dic4 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic4];
    
    NSMutableDictionary * dic5 = [[NSMutableDictionary alloc]init];
    [dic5 setValue:@"领用投用单" forKey:@"title"];
    [dic5 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic5];
    
    NSMutableDictionary * dic13 = [[NSMutableDictionary alloc]init];
    [dic13 setValue:@"商品进货单" forKey:@"title"];
    [dic13 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic13];
    
    NSMutableDictionary * dic14 = [[NSMutableDictionary alloc]init];
    [dic14 setValue:@"农贸销货单" forKey:@"title"];
    [dic14 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic14];
    
    NSMutableDictionary * dic7 = [[NSMutableDictionary alloc]init];
    [dic7 setValue:@"商品进仓单" forKey:@"title"];
    [dic7 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic7];
    
    
    NSMutableDictionary * dic8 = [[NSMutableDictionary alloc]init];
    [dic8 setValue:@"现场零售" forKey:@"title"];
    [dic8 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic8];
    
    NSMutableDictionary * dic9 = [[NSMutableDictionary alloc]init];
    [dic9 setValue:@"现场退货" forKey:@"title"];
    [dic9 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic9];
    
    NSMutableDictionary * dic10 = [[NSMutableDictionary alloc]init];
    [dic10 setValue:@"商品处理台账" forKey:@"title"];
    [dic10 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic10];
    
    NSMutableDictionary * dic11 = [[NSMutableDictionary alloc]init];
    [dic11 setValue:@"原辅料处理台账" forKey:@"title"];
    [dic11 setValue:@"ReportManage" forKey:@"orderName"];
    [dbList addObject:dic11];
    
    
    
    return dbList;
}
#pragma mark - 追溯管理
-(NSMutableArray *)setDbRetrospectManage{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"商品追溯" forKey:@"title"];
    [dic1 setValue:@"RetrospectManage" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"原辅料追溯" forKey:@"title"];
    [dic2 setValue:@"RetrospectManage" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    return dbList;
}

#pragma mark - 质检管理
-(NSMutableArray *)setDbQCManage{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"质检报告" forKey:@"title"];
    [dic1 setValue:@"QCManage" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"企业自检报告" forKey:@"title"];
    [dic2 setValue:@"QCManage" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    return dbList;
}

#pragma mark - 召回管理
-(NSMutableArray *)setDbRecallManage{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"食安风险分析" forKey:@"title"];
    [dic1 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"食品召回计划" forKey:@"title"];
    [dic2 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setValue:@"召回措施报告" forKey:@"title"];
    [dic3 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic3];
    
    NSMutableDictionary * dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setValue:@"召回进展报告" forKey:@"title"];
    [dic4 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic4];
    
    NSMutableDictionary * dic5 = [[NSMutableDictionary alloc]init];
    [dic5 setValue:@"召回总结报告" forKey:@"title"];
    [dic5 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic5];
    
    NSMutableDictionary * dic6 = [[NSMutableDictionary alloc]init];
    [dic6 setValue:@"食品召回公告" forKey:@"title"];
    [dic6 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic6];
    
    NSMutableDictionary * dic7 = [[NSMutableDictionary alloc]init];
    [dic7 setValue:@"召回食品处理" forKey:@"title"];
    [dic7 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic7];
    
    NSMutableDictionary * dic8 = [[NSMutableDictionary alloc]init];
    [dic8 setValue:@"不良品销毁记录" forKey:@"title"];
    [dic8 setValue:@"RecallManage" forKey:@"orderName"];
    [dbList addObject:dic8];
    
    return dbList;
}
#pragma mark - 安全控制
-(NSMutableArray *)setDbSafetyControl{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"食关键工序" forKey:@"title"];
    [dic1 setValue:@"SafetyControl" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"供应商评价" forKey:@"title"];
    [dic2 setValue:@"SafetyControl" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setValue:@"员工健康检查档案" forKey:@"title"];
    [dic3 setValue:@"SafetyControl" forKey:@"orderName"];
    [dbList addObject:dic3];
    
    NSMutableDictionary * dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setValue:@"生产留样记录" forKey:@"title"];
    [dic4 setValue:@"SafetyControl" forKey:@"orderName"];
    [dbList addObject:dic4];
    
    return dbList;
}
#pragma mark - 系统设置
-(NSMutableArray *)setDbSystemSetting{
    NSMutableArray * dbList = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setValue:@"账号信息管理" forKey:@"title"];
    [dic1 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic1];
    
    NSMutableDictionary * dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setValue:@"省级数据上传" forKey:@"title"];
    [dic2 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic2];
    
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc]init];
    [dic3 setValue:@"子账号管理" forKey:@"title"];
    [dic3 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic3];
    
    NSMutableDictionary * dic4 = [[NSMutableDictionary alloc]init];
    [dic4 setValue:@"证照管理" forKey:@"title"];
    [dic4 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic4];
    
    NSMutableDictionary * dic5 = [[NSMutableDictionary alloc]init];
    [dic5 setValue:@"整改通知" forKey:@"title"];
    [dic5 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic5];
    
    NSMutableDictionary * dic6 = [[NSMutableDictionary alloc]init];
    [dic6 setValue:@"行政处罚" forKey:@"title"];
    [dic6 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic6];
    
    NSMutableDictionary * dic7 = [[NSMutableDictionary alloc]init];
    [dic7 setValue:@"帮助中心" forKey:@"title"];
    [dic7 setValue:@"SystemSetting" forKey:@"orderName"];
    [dbList addObject:dic7];
    
    return dbList;
}


@end
