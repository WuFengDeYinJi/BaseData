//
//  BaseViewController.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "BaseNavigationController.h"
#import "DbList.h"

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#define SCANVIEW_EdgeTop 40.0
#define SCANVIEW_EdgeLeft 50.0
#define TINTCOLOR_ALPHA 0.2 //浅色透明度
#define DARKCOLOR_ALPHA 0.5 //深色透明度
@interface BaseViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    UIView *AVCapView;//此 view 用来放置扫描框、取消按钮、说明 label
    UIView *_QrCodeline;//上下移动绿色的线条
    NSString * _barCodeString;
    NSTimer * _mainTimer;
    NSString * _contentStr;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BG_COLOR;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    UIView* stateView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, ScreenW, 20)];
    [self.navigationController.navigationBar addSubview:stateView];
    stateView.backgroundColor = NAV_COLOR;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [_window removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建collectionView
-(UICollectionView *)createCVFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor{
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    cv.backgroundColor = backgroundColor;
    return cv;
    
}
-(void)showHud:(NSString *)title animated:(BOOL)animated afterHiden:(NSTimeInterval)time
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //    if(title.length > 0) {
    //        _hud.mode = MBProgressHUDModeText;
    //        _hud.animationType = MBProgressHUDAnimationZoomIn;
    //        _hud.label.text = title;
    //        _hud.removeFromSuperViewOnHide = animated;
    //        [_hud hideAnimated:YES afterDelay:time];
    //    }
    _hud.mode = MBProgressHUDModeText;
    _hud.animationType = MBProgressHUDAnimationZoomIn;
    _hud.label.text = title;
    _hud.label.font = [UIFont systemFontOfSize:14];
    _hud.label.numberOfLines = 0;
    _hud.removeFromSuperViewOnHide = animated;
    [_hud hideAnimated:YES afterDelay:time];
    
}
-(void)showHudImgName:(NSString *)imgName animated:(BOOL)animated afterHiden:(NSTimeInterval)time
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    _hud.mode = MBProgressHUDModeIndeterminate;
    //    _hud.mode = MBProgressHUDModeCustomView;
    //    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    _hud.animationType = MBProgressHUDAnimationZoomIn;
    _hud.removeFromSuperViewOnHide = animated;
    [_hud hideAnimated:YES afterDelay:time];
    
}
-(void)hideHud{
    [_hud hideAnimated:YES];
}
-(NSString *)setTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action{
    
    //当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    //拼接tocken
    NSString *md5Str = [NSString stringWithFormat:@"%@@%@@%@@%@",module,controller,action,dateStr];
    //md5加密
    NSString *token = [MD5Encryption md5:md5Str];
    return token;
}
#pragma mark - popVC
-(void)popVC{
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(popPreviousVC)];
    self.navigationItem.leftBarButtonItem = leftButton;
}
-(void)popPreviousVC{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 覆盖图层
-(void)setCoverView{
    _window = [UIApplication sharedApplication].keyWindow;
    //灰色覆盖背景
    _coverView = [[UIView alloc]init];
    _coverView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    _coverView.backgroundColor = RGBACOLOR(0,0,0,.5);
    [_window addSubview:_coverView];
    
    //创建点击手势
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    //设置触控对象的个数（几个手指）
    [tapGR setNumberOfTouchesRequired:1];
    //设置轻拍次数
    [tapGR setNumberOfTapsRequired:1];
    [_coverView addGestureRecognizer:tapGR];
    
    NSDictionary *dict = @{@"type":@"1"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"coverView" object:nil userInfo:dict];
}
#pragma mark - 点击手势的回调方法
- (void)tapAction{
    
    [_coverView removeFromSuperview];
    NSDictionary *dict = @{@"type":@"0"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"coverView" object:nil userInfo:dict];
}
-(void)pushVC:(UIViewController *)vc andTitle:(NSString *)title{
    vc.navigationItem.title = title;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSString *)getFiler:(NSString *)filerName{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filer = [path stringByAppendingPathComponent:filerName];
    return filer;
}
-(UIButton *)createBlankImgName:(NSString *)imgName btnFrame:(CGRect)frame{
    UIButton *blankBtn = [[UIButton alloc] initWithFrame:frame];
    [blankBtn setImage:[UIImage imageNamed:imgName] forState:0];
    blankBtn.userInteractionEnabled = NO;
    blankBtn.hidden = YES;
    [self.view addSubview:blankBtn];
    
    return blankBtn;
}
//获取请求头的tocken
-(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime{
    
    //拼接tocken
    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@%@",module,controller,action,currentTime];
    //md5加密
    NSString *token = [MD5Encryption md5:md5Str];
    return token;
}



-(void)presentVCLogin{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"登录失效，重新登录" preferredStyle:1];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确认" style:0 handler:^(UIAlertAction * _Nonnull action) {
        LoginViewController *vc = [[LoginViewController alloc] init];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];

        if ([APPDELEGATE.isRemember isEqualToString:@"1"]) {

        }else{
            APPDELEGATE.user_name = nil;
            APPDELEGATE.user_passWord = nil;
            

            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];

            [defaults removeObjectForKey:@"userName"];
            [defaults removeObjectForKey:@"userPassword"];
        }

        [self presentViewController:nav animated:YES completion:nil];
    }];
    
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:nil];
}


#pragma mark - 获取地区信息
-(NSArray*)getRegionInfo{
    //1.获得文件路径
    NSString *fileName = [[NSBundle mainBundle]pathForResource:@"China" ofType:@"plist"];// [self getFiler:@"China.plist"];
    NSArray * regionArr = [NSArray arrayWithContentsOfFile:fileName];
    return regionArr;
}

#pragma mark - 共享信息库
-(NSMutableArray *)makeDbShareInfoList{
    NSMutableArray * dbListArr = [[NSMutableArray alloc]init];
    DbList * list = [[DbList alloc]init];
    dbListArr = [list setDbShareInfo];
    return dbListArr;
}
#pragma mark - 基础信息管理
-(NSMutableArray *)makeDbBaseInfoList{
    NSMutableArray * dbListArr = [[NSMutableArray alloc]init];
    DbList * list = [[DbList alloc]init];
    dbListArr = [list setDbBaseInfo];
    return dbListArr;
}
#pragma mark - 台账管理
-(NSMutableArray *)makeDbReportManageList{
    NSMutableArray * dbListArr = [[NSMutableArray alloc]init];
    DbList * list = [[DbList alloc]init];
    dbListArr = [list setDbReportManage];
    return dbListArr;
}
#pragma mark - 追溯管理
-(NSMutableArray *)makeDbRetrospectManageList{
    NSMutableArray * dbListArr = [[NSMutableArray alloc]init];
    DbList * list = [[DbList alloc]init];
    dbListArr = [list setDbRetrospectManage];
    return dbListArr;
}


#pragma mark - 扫码
-(void)setScanClick{
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [self showHud:errorStr animated:YES afterHiden:2];
        
        return;
    }else{
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        AVCapView = tempView;
        AVCapView.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
        
        UIButton * closeBtn = [UIButton btnWithFrame:CGRectMake(ScreenW-60, 40, 40, 40) title:@"" titleColor:TABBAR_COLOR titleFont:20 image:@"关闭"];
        [closeBtn addTarget:self action:@selector(touchAVCancelBtn) forControlEvents:UIControlEventTouchUpInside];
        [AVCapView addSubview:closeBtn];
        [window addSubview:AVCapView];
        
        //画上边框
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop+100, ScreenW- 2 * SCANVIEW_EdgeLeft, 1)];
        topView.backgroundColor = [UIColor whiteColor];
        [AVCapView addSubview:topView];
        
        //画左边框
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop+100 , 1,ScreenW - 2 * SCANVIEW_EdgeLeft )];
        leftView.backgroundColor = [UIColor whiteColor];
        [AVCapView addSubview:leftView];
        
        //画右边框
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft + ScreenW- 2 * SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop+100 , 1,ScreenW - 2 * SCANVIEW_EdgeLeft + 1)];
        rightView.backgroundColor = [UIColor whiteColor];
        [AVCapView addSubview:rightView];
        
        //画下边框
        UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop + ScreenW- 2 * SCANVIEW_EdgeLeft+100,ScreenW - 2 * SCANVIEW_EdgeLeft ,1 )];
        downView.backgroundColor = [UIColor whiteColor];
        [AVCapView addSubview:downView];
        
        
        //画中间的基准线
        _QrCodeline = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop+100, ScreenW - 2 * SCANVIEW_EdgeLeft - 1, 2)];
        _QrCodeline.backgroundColor = [UIColor greenColor];
        [AVCapView addSubview:_QrCodeline];
        
        
        // 先让基准线运动一次，避免定时器的时差
        [UIView animateWithDuration:1.2 animations:^{
            
            self->_QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, ScreenW - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop+100 , ScreenW - 2 * SCANVIEW_EdgeLeft - 1, 2);
            
        }];
        
        [self performSelector:@selector(createMainTimer) withObject:nil afterDelay:0.4];
        
        
        AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        //创建输入流
        AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        //创建输出流
        AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
        //设置代理 在主线程里刷新
        [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        //初始化链接对象
        session = [[AVCaptureSession alloc]init];
        //高质量采集率
        [session setSessionPreset:AVCaptureSessionPresetHigh];
        
        [session addInput:input];
        [session addOutput:output];
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
        
        AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
        layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
        layer.frame = CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop+100, ScreenW- 2 * SCANVIEW_EdgeLeft, ScreenW- 2 * SCANVIEW_EdgeLeft);
        [AVCapView.layer insertSublayer:layer atIndex:0];
        //开始捕获
        [session startRunning];
    }
    
}
//创建定时器
- (void)createMainTimer
{
    _mainTimer=[NSTimer scheduledTimerWithTimeInterval:1.1 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats:YES];
}
//销毁定时器
- (void)stopMainTimer
{
    if ([_mainTimer isValid] == YES) {
        [_mainTimer invalidate];
        _mainTimer = nil;
    }
    
}

// 滚来滚去
- (void)moveUpAndDownLine
{
    CGFloat YY = _QrCodeline.frame.origin.y;
    
    if (YY != ScreenW - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop+100 ) {
        [UIView animateWithDuration:1.2 animations:^{
            self->_QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, ScreenW - 2 * SCANVIEW_EdgeLeft + SCANVIEW_EdgeTop+100 , ScreenW - 2 * SCANVIEW_EdgeLeft - 1,2);
        }];
    }else {
        [UIView animateWithDuration:1.2 animations:^{
            self->_QrCodeline.frame = CGRectMake(SCANVIEW_EdgeLeft + 1, SCANVIEW_EdgeTop+100, ScreenW - 2 * SCANVIEW_EdgeLeft - 1,2);
        }];
        
    }
}
//扫描成功后，想干嘛干嘛，就在这个代理方法里面实现就行了
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        
        //通知回传
        [[NSNotificationCenter defaultCenter]postNotificationName:@"metadataInfo" object:metadataObject.stringValue userInfo:nil];
        
        [session stopRunning];
        [self stopMainTimer];
        [AVCapView removeFromSuperview];
        
    }
}

//如果用户不想扫描了，点击取消按钮
- (void)touchAVCancelBtn{
    [session stopRunning];//摄像也要停止
    [self stopMainTimer];//定时器要停止
    [AVCapView removeFromSuperview];//刚刚创建的 view 要移除
    
}

#pragma mark - 观察者销毁
-(void)dealloc{
    NSLog(@"观察者销毁");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
