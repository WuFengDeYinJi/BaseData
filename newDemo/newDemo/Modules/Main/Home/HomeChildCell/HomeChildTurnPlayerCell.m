//
//  HomeChildTurnPlayerCell.m
//  newDemo
//
//  Created by 靳建南 on 2024/6/14.
//

#import "HomeChildTurnPlayerCell.h"
#define FrameW self.frame.size.width
#define FrameH self.frame.size.height
@interface HomeChildTurnPlayerCell()<UIScrollViewDelegate>
@end
@implementation HomeChildTurnPlayerCell
{
    UIScrollView *_adSV;
    NSMutableArray *_adImgArr;
    UIPageControl *_adPageContorl;
}
-(void)setupWithCell:(NSMutableArray *)imageArr{
    [_adImgArr removeAllObjects];
    
    _adImgArr = imageArr;
    _adImgArr = [NSMutableArray arrayWithObjects:@"add",@"banner",@"add",@"banner", nil];
    [self createScrollView];
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _adImgArr = [[NSMutableArray alloc] init];
    }
    return self;
}
#pragma mark - 创建scrollView
-(void)createScrollView{
    [_adSV removeFromSuperview];
    [_adPageContorl removeFromSuperview];
    
    
    _adSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, FrameW, FrameH)];
    _adSV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_adSV];
    _adSV.pagingEnabled = YES;
    _adSV.bounces = NO;
    _adSV.showsHorizontalScrollIndicator = NO;
    _adSV.contentSize = CGSizeMake(ScreenW * _adImgArr.count, 0);
    _adSV.contentOffset = CGPointMake(0, 0);
    _adSV.delegate = self;
    
    for (int i = 0; i < _adImgArr.count; i++) {
        UIImageView *adimage = [[UIImageView alloc] initWithFrame:CGRectMake(FrameW * i, 0, FrameW, FrameH)];
        if (i%2 == 0){
            adimage.backgroundColor = UIColor.orangeColor;
        }else{
            adimage.backgroundColor = UIColor.brownColor;
        }
//        [adimage sd_setImageWithURL:[NSURL URLWithString:[_adImgArr objectAtIndex:i]]
//                   placeholderImage:[UIImage imageNamed:@"banner"]];
//                adimage.image = [UIImage imageNamed:[_adImgArr objectAtIndex:i]];
        adimage.contentMode = 0;
        [_adSV addSubview:adimage];
        
        adimage.userInteractionEnabled = YES;
        adimage.tag = i + 100;
        UITapGestureRecognizer *recogn = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didImageViewClicked:)];
        [adimage addGestureRecognizer:recogn];
        
    }
    
    //创建pageControl
    _adPageContorl = [[UIPageControl alloc] initWithFrame:CGRectMake(FrameW/2-50, FrameH - 15, 100, 10)];
    [self.contentView addSubview:_adPageContorl];
    _adPageContorl.pageIndicatorTintColor = [UIColor whiteColor];
    _adPageContorl.currentPageIndicatorTintColor = [UIColor redColor];
    _adPageContorl.currentPage = 0;
    _adPageContorl.numberOfPages = _adImgArr.count;
    _adPageContorl.hidesForSinglePage = YES;
    _adPageContorl.layer.cornerRadius = _adPageContorl.frame.size.height/2;
    _adPageContorl.backgroundColor = UIColor.clearColor;
    //适配pageContorl的长度
    CGSize pageSize = [_adPageContorl sizeForNumberOfPages:_adImgArr.count];
    CGRect pageFrame = _adPageContorl.frame;
    pageFrame.size.width = pageSize.width + 10;
    pageFrame.origin.x = FrameW/2 - (pageSize.width + 10)/2;
    _adPageContorl.frame = pageFrame;
    
    //创建定时器
    [self addTimer];
}
/*
 ***  UIScrollViewDelegate
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat scrollviewW =  scrollView.frame.size.width;//等于ScreenW
    CGFloat x = scrollView.contentOffset.x;//横向偏移量
    int page = (x + scrollviewW / 2) / scrollviewW;//当偏移量超过scrollView的一半宽度，则下一页
    
    _adPageContorl.currentPage = page;
}
#pragma mark - 开始手动滑动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}
#pragma mark - 停止手动滑动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}
/*
 ***  定时器方法
 */
#pragma mark - 创建定时器
-(void)addTimer{
    if (_timer != nil) {
        return;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
#pragma mark - 下一页
-(void)nextImage{
    
    NSInteger page;
    //如果单前页是最后一页 下一页就回到第一页
    if (_adPageContorl.currentPage == [_adImgArr count] - 1) {
        page = 0;
    }
    else{
        page = _adPageContorl.currentPage + 1;
    }
    //计算scrollView滚动的位置
    CGFloat offsetX = page * FrameW;
    CGPoint offset = CGPointMake(offsetX, 0);
    [_adSV setContentOffset:offset animated:YES];
}
#pragma mark - 移除定时器
-(void)removeTimer{
    [_timer invalidate];
    _timer = nil;
}
#pragma mark - 点击图片
-(void)didImageViewClicked:(UITapGestureRecognizer *)recogizer{
    UIView *views = (UIView*)recogizer.view;
    NSLog(@"%lu",views.tag);
    
    if ([self.delegate respondsToSelector:@selector(whenDidScrollClick:)]) {
        
        [self.delegate whenDidScrollClick:views.tag];
    }
}

@end
