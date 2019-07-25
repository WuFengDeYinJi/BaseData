//
//  URLDefine.swift
//  PlantingAndFarming
//
//  Created by 靳建南 on 2018/5/14.
//  Copyright © 2018年 靳建南. All rights reserved.
//

import UIKit


/*
 *********公共模块
 */
//图片保存
let FileServer_Info = "fileServerController.do?doUpload"
//获取单据编号
/**
 * 获取批次号
 * 种子/苗编号  TN
 * 肥料编号  TN
 * 农药编号  TN
 * 加工原辅料编号  TN  
 * 设备器械编号  TN
 * 其他投入品编号  TN
 * 饲料编号  TN
 * 兽药编号  TN
 * 农产品编号  PN
 * 供购货商编号  BN
 * 地块设置编号  AN
 * 员工编号  EN
 * 种植记录批次号  PB
 * 加工记录批次号  MB
 * 养殖记录序列号  PB
 * 采收批次  HB
 * 产品批次  CB
 * 单据编号（入库） RK
 * 单据编号（出库） CK
 * 记录号  FN
 */
let SystemGetNumber_Info = "systemController.do?getNumber"
//根据农投入品id获取单位信息
let SystemLoadUnit_Info = "tAgOutorinWarehouseController.do?loadUnit"





/*
 *********登录模块
 */
let GET_LOGIN = "loginController.do?loginApp"




/*
 *********种植管理模块
 */
//种养殖记录列表
let PAFRECORD_LIST = "tAgPlantRecordController.do?datagrid"
//种植记录查看
let Seek_PAFRECORD = "tAgPlantRecordController.do?goUpdateApp"
//历史种植记录删除
let Del_PAFRECORD = "tAgPlantRecordController.do?doDelApp"
//种植记录新增
let ADD_PAFRECORD = "tAgPlantRecordController.do?doBatchAddApp"
//关联标签
let PlantTag_List = "tAgPlantTagController.do?datagrid"
//采收记录新增
let PlantHarvest_Add = "tAgPlantHarvestController.do?doAddApp"
//序列号查询
let LoadSeriesNumber_List = "tAgPlantRecordController.do?loadSeriesNumberList"
//自定义溯源节点列表
let PlantTraceNode_List = "tAgPlantTraceNodeController.do?datagrid"
//获取修改溯源节点 动态生成布局数据
let PlantTraceNode_Info = "tAgPlantTraceNodeController.do?goUpdateApp"
//添加溯源节点
let PlantTraceNode_Add = "tAgPlantRecordNodeController.do?doAddApp"
//农事活动列表
let FarmedActMan_List = "tAgFarmedActManController.do?datagrid"
//农事活动添加
let FarmedActMan_Add = "tAgFarmedActManController.do?doAdd"

/*
 ***采收记录模块***
 */
//采收列表
let PlantHarves_LIST = "tAgPlantHarvestController.do?datagrid"
//采收详情
let PlantHarves_INFO = "tAgPlantHarvestController.do?goUpdateApp"
//采收记录入库
let PlantHarvesRecord_PUT = "tAgPlantHarvestController.do?inWarehousePlant"

/*
 ***环境监测模块***
 */
//环境监测
let MonitorEnvironment_LIST = "monitorDataController.do?getInfoForAppAndWeb"
//环境监测记录添加
let MonitorEnvironmentRecord_ADD = "monitorDataController.do?doAdd"
//环境监测记录列表
let MonitorEnvironmentRecord_LIST = "monitorDataController.do?datagrid"
//环境监测记录详情
let MonitorEnvironmentRecord_INFO = "monitorDataController.do?getInfoForApp"







/*
 *********加工管理模块
 */
//加工记录列表
let MachiningRecord_List = "tAgMachiningRecordController.do?datagrid"
//加工记录新增
let MachiningRecord_Add = "tAgMachiningRecordController.do?doBatchAddApp"
//加工记录查看
let MachiningRecord_Info = "tAgMachiningRecordController.do?goUpdateApp"
//加工记录加工节点列表
let MachiningRecordNode_List = "tAgMachiningRecordController.do?queryNode"
//加工记录加工节点详情
let MachiningRecordNode_Info = "tAgMachiningRecordProcessController.do?goUpdateApp"
//加工记录加工节点保存
let MachiningRecordNode_Save = "tAgMachiningRecordProcessController.do?doAddApp"
//历史加工记录删除
let MachiningRecord_Del = "tAgMachiningRecordController.do?doDelApp"
//加工记录结束记录
let MachiningRecord_EndRecord = "tAgMachiningRecordController.do?endRecord"
//历史加工记录入库
let InWarehouseMachining_EndRecord = "tAgMachiningRecordController.do?inWarehouseMachining"






/*
 *********仓储管理模块
 */
//农投入品/农产品出入库  列表
let FarmOutOrInWarehous_List = "vAgOutorinWarehouseController.do?datagrid"
//农投入品/农产品库存  列表
let FarmStockOutorinWarehous_List = "tAgStockOutorinController.do?datagrid"
//农投入品/农产品库存  详情
let FarmOutorinWarehous_Info = "tAgStockOutorinController.do?getInfoForApp"
//农投入品/农产品出入库  新增
let FarmOutorinWarehous_Add = "tAgOutorinWarehouseController.do?doAddOrUpdateApp"





/*
 *********台账管理模块
 */

/*
 ***投入品汇总-产品汇总模块***
 */
//农投入品汇总-产品汇总  列表
let SummaryLedger_List = "tAgOutorinWarehouseController.do?summaryLedger"
//农投入品汇总-产品汇总  详情 （明细列表）
let StandingDetailList_Info = "tAgOutorinWarehouseController.do?standingDetail"
//农投入品汇总-产品汇总明细  详情
let StandingDetail_Info = "tAgOutorinWarehouseController.do?getInfoForApp"
//种植过程列表
let PlantProcessDatag_List = "tAgPlantRecordController.do?processDatagrid"






/*
 *********溯源管理模块
 */
//溯源码管理列表
let SourceAllot_List = "tAgSourceAllotController.do?datagrid"
//溯源码管理查看详情
let SourceAllot_Info = "tAgSourceAllotController.do?datagridDetail"
//申请溯源码
let Apply_SourceAllot = "tAgSourceAllotController.do?doAddInterface"

/*
 ***产品赋码模块***
 */
//产品赋码列表
let SourceCoding_List = "tAgSourceCodingController.do?datagrid"
//产品赋码详情
let SourceCoding_Info = "tAgSourceCodingController.do?getDetailInfo"
//产品赋码详情(溯源码查看)
let SourceCoding_SonList = "tAgSourceCodingController.do?detailDatagrid"
//解除关联
let Remove_SourceCoding = "tAgSourceCodingController.do?doUpdate"
/*
 ***产品赋码模块(关联部分)***
 */
//关联产品列表
let RelieveProduct_List = "tAgStockOutorinController.do?datagridSelect"
//申请记录列表
let RelieveProductRecord_List = "tAgSourceAllotController.do?datagrid"
//获取起始结束码
let StartAEndSource_Code = "tAgSourceController.do?getCodeInfo"
//赋码保存
let StartAEndSource_Save = "tAgSourceCodingController.do?doAddApp"
/*
 ***产品赋码模块(节点部分)***
 */
//查看溯源节点列表接口/生产节点
let PlantRecordNode_List = "tAgPlantRecordNodeController.do?queryNode"
//获取溯源节点详情
let PlantRecordNode_Info = "tAgPlantRecordNodeController.do?loadNodeContent"
//保存溯源节点
let SavePlantRecordNode_Info = "tAgPlantRecordNodeController.do?doAddApp"
/*
 ***溯源统计模块***
 */
//溯源统计
let SourceCodeCount_List = "tAgSourceController.do?loadSourceInfo"






/*
 *********基础信息模块
 */
/*
 ***农投入品模块***
 */
//基础列表
let FarmBaseInfo_List = "vAgFarminputsBaseinfoController.do?datagrid"
//饲料列表
let FarmFeed_List = "tAgFeedController.do?datagrid"
//饲料详情
let FarmFeed_Info = "tAgFeedController.do?goUpdateApp"

//药品列表
let FarmDrug_List = "tAgMedicineController.do?datagrid"
//药品详情
let FarmDrug_Info = "tAgMedicineController.do?goUpdateApp"


//种子列表
let FarmSeed_List = "tAgSeedController.do?datagrid"
//种子详情
let FarmSeed_Info = "tAgSeedController.do?goUpdateApp"


//农药列表
let FarmChemical_List = "tAgFarmChemicalController.do?datagrid"
//农药详情
let FarmChemical_Info = "tAgFarmChemicalController.do?goUpdateApp"


//肥料列表
let FarmManure_List = "tAgManureController.do?datagrid"
//肥料详情
let FarmManure_Info = "tAgManureController.do?goUpdateApp"


//原辅料列表
let FarmMaterial_List = "tAgRawMaterialController.do?datagrid"
//原辅料详情
let FarmMaterial_Info = "tAgRawMaterialController.do?goUpdateApp"


//机械设备列表
let FarmInstruments_List = "tAgInstrumentsController.do?datagrid"
//其他投入品详情
let FarmInstruments_Info = "tAgInstrumentsController.do?goUpdateApp"


//其他投入品列表
let FarmOtherInputs_List = "tAgOtherInputsController.do?datagrid"
//其他投入品详情
let FarmOtherInputs_Info = "tAgOtherInputsController.do?goUpdateApp"

//分类列表
let FarmTypeGroup_List = "typeController.do?getTypeGroupByCode"
/*
 ***其他模块***
 */
//农产品列表
let FarmProduce_List = "tAgFarmProduceController.do?datagrid"
//农产品分类
let FarmClassify_List = "tAgFarmProduceClassifyController.do?datagrid"
//农产品详情
let FarmProduce_Info = "tAgFarmProduceController.do?getInfoForApp"

//供/购货商列表
let SupplierOrBuyer_List = "tAgSupplierOrBuyerController.do?datagrid"
//供/购货商详情
let SupplierOrBuyer_Info = "tAgSupplierOrBuyerController.do?getInfoForApp"

//地块列表
let Plot_InfoList = "tAgBiPlotController.do?datagrid"
//地块详情
let Plot_InfoDetails = "tAgBiPlotController.do?goUpdateApp"

//员工信息列表
let Staff_InfoList = "tAgStaffController.do?datagrid"
//员工信息详情
let Staff_InfoDetails = "tAgStaffController.do?getInfoForApp"
