//
//  DbList.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DbList : NSObject

-(NSMutableArray *)setDbShareInfo;//共享信息库
-(NSMutableArray *)setDbBaseInfo;//基础信息管理
-(NSMutableArray *)setDbReportManage;//台账管理
-(NSMutableArray *)setDbRetrospectManage;//追溯管理

-(NSMutableArray *)setDbQCManage;//质检管理
-(NSMutableArray *)setDbRecallManage;//召回管理
-(NSMutableArray *)setDbSafetyControl;//安全控制
-(NSMutableArray *)setDbSystemSetting;//系统设置

@end

NS_ASSUME_NONNULL_END
