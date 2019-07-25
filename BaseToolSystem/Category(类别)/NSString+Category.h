//
//  NSString+Category.h
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MD5Encryption.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)
+(BOOL)isEmail:(NSString*)str;//邮箱判断
+(BOOL)isUrl:(NSString*)str;//URL判断
+(BOOL)isTelephone:(NSString*)str;//手机号判断
+(BOOL)isNum:(NSString *)str;//4位纯数字，验证码判断
+(BOOL)isPureInt:(NSString*)string;//判断是否为整形：
+(BOOL)isPureFloat:(NSString*)string;//判断是否为浮点形：
+(NSString *)stringWithDateString:(NSString *)timeStr;//时间戳转换为时间 yyyy-MM-dd HH:mm:ss
+(NSString *)stringWithDayString:(NSString *)timeStr;//时间戳转换为时间 yyyy-MM-dd
+(NSString *)stringWithTimeString:(NSString *)timeStr;//时间戳转换为时间 HH:mm:ss
+(NSString *)strignWithDayZHString:(NSString *)timeStr;//时间戳转换为时间 yyyy年MM月dd日
+(NSString *)strignWithPeriodZHString:(NSString *)timeStr withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day ;//计算有效期至 yyyy-MM-dd
+(NSMutableAttributedString *)text:(NSString *)text textColor:(UIColor *)textColor range:(NSRange)range;//设置字符串中某几个字符的颜色不同
+(NSMutableAttributedString *)text:(NSString *)text textFont:(CGFloat)textFont textColor:(UIColor *)textColor range:(NSRange)range;//设置字符串中某几个字符的颜色和字体不同
+(NSString *)stringWithCleanBlandString:(NSString *)string;//去掉空格
+(NSString *)stringIsNilStr:(NSString *)string;//如果为nil就返回空
+(NSString *)stringIsZeroStr:(NSString *)string;//如果为nil就返回0

//获取请求头的tocken
+(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime;

//自适应lab高度
+ (CGFloat)stringGetHeightByWidth:(CGFloat)width title:(NSString *)title font:(CGFloat)font;

//获取当前时间戳
+(NSString *)getCurrentTime;
//获取当前时间戳（毫秒级）
+(NSString *)getCurrentTimeMM;
//十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSInteger)decimal;
//获取某个字符串或者汉字的首字母.
+ (NSString *)firstCharactorWithString:(NSString *)aString;

//压缩图片
+ (NSData *)zipImageWithImage:(UIImage *)image;

//json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//字典转json
+ (NSString*)dictionaryToJson:(NSObject *)obj;

//去掉字符串中的html标签的方法
+ (NSString *)filterHTML:(NSString *)html;

@end

NS_ASSUME_NONNULL_END
