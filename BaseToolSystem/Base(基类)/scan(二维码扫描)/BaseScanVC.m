//
//  DistributionCustomerScanVC.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2019/4/24.
//  Copyright © 2019年 靳建南. All rights reserved.
//

#import "BaseScanVC.h"

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface BaseScanVC ()<AVCaptureMetadataOutputObjectsDelegate,TZImagePickerControllerDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    UIImageView *_QrCodelineImg;//上下移动绿色的线条
    NSString * _barCodeString;
    NSTimer * _mainTimer;
    
    AVCaptureDevice *_device;
    UIButton * _flashBtn;//闪光灯
    UIButton * _picBtn;//图片
}

@end

@implementation BaseScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回灰"] style:UIBarButtonItemStylePlain target:self action:@selector(backVC)];
    self.navigationItem.leftBarButtonItem = leftButton;
    //扫码功能创建
    [self setScanClick];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    _flashBtn = [UIButton btnWithFrame:CGRectMake(ScreenW-90, 20, 40, 44) title:@"" titleColor:LAB1_COLOR titleFont:17 image:@"不闪光"];
    [_flashBtn addTarget:self action:@selector(flashClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_flashBtn];

    _picBtn = [UIButton btnWithFrame:CGRectMake(ScreenW-50, 20, 50, 44) title:@"" titleColor:LAB1_COLOR titleFont:17 image:@"相册"];
    [_picBtn addTarget:self action:@selector(picClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_picBtn];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [_flashBtn removeFromSuperview];
    [_picBtn removeFromSuperview];
}

#pragma mark - 是否开启闪光灯
-(void)flashClicked:(UIButton *)sender{
    AVCaptureDevice *device = _device;
    //修改前必须先锁定
    [_device lockForConfiguration:nil];
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([_device hasFlash]) {
        if (_device.flashMode == AVCaptureFlashModeOff) {
            _device.flashMode = AVCaptureFlashModeOn;
            _device.torchMode = AVCaptureTorchModeOn;
            [_flashBtn setImage:[UIImage imageNamed:@"闪光"] forState:UIControlStateNormal];
            
        } else if (_device.flashMode == AVCaptureFlashModeOn) {
            _device.flashMode = AVCaptureFlashModeOff;
            _device.torchMode = AVCaptureTorchModeOff;
            [_flashBtn setImage:[UIImage imageNamed:@"不闪光"] forState:UIControlStateNormal];
        }
    }else{
        [self showHud:@"该设备不支持闪关灯" animated:YES afterHiden:2];
    }
    [device unlockForConfiguration];
}

#pragma mark - 识别图片
-(void)picClicked{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        //1. 初始化扫描仪，设置设别类型和识别质量
        CIDetector*detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
        UIImage * image = photos[0];
        CGImageRef ref = image.CGImage;
        //2. 扫描获取的特征组
        NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:ref]];
        //3. 获取扫描结果
        CIQRCodeFeature *feature = [features objectAtIndex:0];
        NSString *scannedResult = feature.messageString;
        //进行处理(音效、网址分析、页面跳转等)
        NSLog(@"scan------%@",scannedResult);
        
        // 跳回指定页面
        [self jumpVC:scannedResult];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}

#pragma mark - 返回
-(void)backVC{
    [session stopRunning];//摄像也要停止
    [self stopMainTimer];//定时器要停止
    //关灯
    if ([_device hasFlash]) {
        if (_device.flashMode == AVCaptureFlashModeOn) {
            _device.flashMode = AVCaptureFlashModeOff;
            _device.torchMode = AVCaptureTorchModeOff;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
        //设计扫描背景
        [self setScanningBG];
        //添加扫描控件
        [self initScanningContent];
    }
}
#pragma mark - 设计扫描背景
-(void)setScanningBG{
    UIImageView * scanImg = [UIImageView imageViewWithFrame:CGRectMake(ScreenW/2-130, (MainHight)/2-130, 260, 260) imageName:@"扫码框" contentMode:0];
    [self.view addSubview:scanImg];
    
    //画中间的基准线
    _QrCodelineImg = [UIImageView imageViewWithFrame:CGRectMake(ScreenW/2-130, (MainHight)/2-130, 260, 5) imageName:@"线" contentMode:0];
    [self.view addSubview:_QrCodelineImg];
    
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, MainHight)];
    tempView.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
    [self.view addSubview:tempView];
    
    //从蒙版中扣出扫描框那一块,这块的大小尺寸将来也设成扫描输出的作用域大小
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRect:self.view.bounds];
    [maskPath appendPath:[[UIBezierPath bezierPathWithRect:CGRectMake(scanImg.frame.origin.x+4, scanImg.frame.origin.y+4, scanImg.frame.size.width-8, scanImg.frame.size.height-8)] bezierPathByReversingPath]];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    tempView.layer.mask = maskLayer;
    
    // 先让基准线运动一次，避免定时器的时差
    [UIView animateWithDuration:2 animations:^{
        self->_QrCodelineImg.frame = CGRectMake(ScreenW/2-130, (MainHight)/2+125, 260, 5);
    }];
    //开启定时器
    [self performSelector:@selector(createMainTimer) withObject:nil afterDelay:0.4];
}
#pragma mark - 添加扫描控件
- (void)initScanningContent{
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
    layer.frame = CGRectMake(0, 0, ScreenW, MainHight);
    [self.view.layer insertSublayer:layer atIndex:0];
    
    //开始捕获
    [session startRunning];
}

#pragma mark - 创建定时器
- (void)createMainTimer
{
    _mainTimer=[NSTimer scheduledTimerWithTimeInterval:1.9 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats:YES];
}
#pragma mark - 销毁定时器
- (void)stopMainTimer
{
    if ([_mainTimer isValid] == YES) {
        [_mainTimer invalidate];
        _mainTimer = nil;
    }
}

#pragma mark - 滚来滚去
- (void)moveUpAndDownLine
{
    CGFloat YY = _QrCodelineImg.frame.origin.y;

    if (YY == (MainHight)/2+125) {
        [UIView animateWithDuration:2 animations:^{
            self->_QrCodelineImg.frame = CGRectMake(ScreenW/2-130, (MainHight)/2-130, 260, 5);
        }];
    }else {
        [UIView animateWithDuration:2 animations:^{
            self->_QrCodelineImg.frame = CGRectMake(ScreenW/2-130, (MainHight)/2+125, 260, 5);
        }];
    }
}
#pragma mark - 扫描成功后，想干嘛干嘛，就在这个代理方法里面实现就行了
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);

        [session stopRunning];
        [self stopMainTimer];
        // 跳回指定页面
        [self jumpVC:metadataObject.stringValue];
    }
}
#pragma mark - 跳回指定页面
-(void)jumpVC:(NSString *)string{
//    if ([_typeStr isEqualToString:@"1"]) {
//        for (UIViewController *controller in self.navigationController.viewControllers) {
//            if ([controller isKindOfClass:[DistributionRecordVC class]]) {
//                DistributionRecordVC *vc =(DistributionRecordVC *)controller;
//                vc.infoStr = string;
//                [self.navigationController popToViewController:vc animated:YES];
//            }
//        }
//    }else{
//        for (UIViewController *controller in self.navigationController.viewControllers) {
//            if ([controller isKindOfClass:[RecycleRecordVC class]]) {
//                RecycleRecordVC *vc =(RecycleRecordVC *)controller;
//                vc.infoStr = string;
//                [self.navigationController popToViewController:vc animated:YES];
//            }
//        }
//    }
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
