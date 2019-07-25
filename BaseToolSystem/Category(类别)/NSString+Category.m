//
//  NSString+Category.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark - 邮箱判断
+(BOOL)isEmail:(NSString *)str{
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}
#pragma mark - URL判断
+(BOOL)isUrl:(NSString*)str{
    NSString * regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}
#pragma mark - 手机号判断
+ (BOOL)isTelephone:(NSString*)str{
    NSString * MOBILE = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:str]   ||
    [regextestphs evaluateWithObject:str]      ||
    [regextestct evaluateWithObject:str]       ||
    [regextestcu evaluateWithObject:str]       ||
    [regextestcm evaluateWithObject:str];
}
#pragma mark - 4位纯数字，验证码判断
+(BOOL)isNum:(NSString *)str{
    
    NSString * regex = @"^\\d{4}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}
#pragma mark - 判断是否为整形：
+(BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
#pragma mark - 判断是否为浮点形：
+(BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
+(NSString *)stringWithDateString:(NSString *)timeStr{
    //输入格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    NSDate *date = [formatter dateFromString:timeStr];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr intValue]];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
+(NSString *)stringWithDayString:(NSString *)timeStr{
    //输入格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    NSDate *date = [formatter dateFromString:timeStr];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr intValue]];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
+(NSString *)stringWithTimeString:(NSString *)timeStr;{
    //输入格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    //    NSDate *date = [formatter dateFromString:timeStr];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr intValue]];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
+(NSString *)strignWithDayZHString:(NSString *)timeStr{
    //输入格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    //    NSDate *date = [formatter dateFromString:timeStr];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr intValue]];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
#pragma mark - 计算有效期至 yyyy-MM-dd
+(NSString *)strignWithPeriodZHString:(NSString *)timeStr withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //指定时间显示样式: HH表示24小时制 hh表示12小时制
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *lastDate = [formatter dateFromString:timeStr];
    //以 1970/01/01 GMT为基准，得到lastDate的时间戳
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:lastDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:lastDate options:0];
    NSString *dateStr = [formatter stringFromDate:newdate];
    return dateStr;
}
#pragma mark - 设置字符串中某几个字符的颜色不同
+(NSMutableAttributedString *)text:(NSString *)text textColor:(UIColor *)textColor range:(NSRange)range{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    return str;
}
#pragma mark - 设置字符串中某几个字符的颜色和字体不同
+(NSMutableAttributedString *)text:(NSString *)text textFont:(CGFloat)textFont textColor:(UIColor *)textColor range:(NSRange)range{
    UIFont *font = [UIFont systemFontOfSize:textFont];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:text];
    [str addAttribute:NSFontAttributeName value:font range:range];
    [str addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    return str;
}
#pragma mark - 去掉空格
+(NSString *)stringWithCleanBlandString:(NSString *)string{
    NSString *str = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}
#pragma mark - 如果为nil就返回空
+(NSString *)stringIsNilStr:(NSString *)string{
    if (string == nil) {
        string = @"";
    }
    return string;
}
#pragma mark - 如果为nil就返回0
+(NSString *)stringIsZeroStr:(NSString *)string{
    if (string == nil) {
        string = @"0";
    }
    return string;
}
#pragma mark - 获取请求头的tocken
+(NSString *)setHeaderTockenOfModule:(NSString *)module andController:(NSString *)controller andAction:(NSString *)action andCurretnTime:(NSString *)currentTime{
    
    //拼接tocken
    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@%@",module,controller,action,currentTime];
    //md5加密
    NSString *token = [MD5Encryption md5:md5Str];
    return token;
}

#pragma mark - 自适应lab高度
+ (CGFloat)stringGetHeightByWidth:(CGFloat)width title:(NSString *)title font:(CGFloat)font{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

#pragma mark - 获取当前时间戳
+(NSString *)getCurrentTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", time];
    return timeString;
}
#pragma mark - 获取当前时间戳（毫秒级）
+(NSString *)getCurrentTimeMM{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", time*1000];
    return timeString;
}
#pragma mark - 十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSInteger)decimal
{
    NSInteger num = decimal;//[decimal intValue];
    NSInteger remainder = 0;      //余数
    NSInteger divisor = 0;        //除数
    
    NSString * prepare = @"";
    
    while (true){
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%ld",remainder];
        
        if (divisor == 0){
            break;
        }
    }
    
    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --){
        result = [result stringByAppendingFormat:@"%@",[prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return result;
}
#pragma mark - 获取某个字符串或者汉字的首字母.
+ (NSString *)firstCharactorWithString:(NSString *)aString{
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    
    NSString *pinYin = [str capitalizedString];
    
    NSString *firatCharactors = [NSMutableString string];
    for (int i = 0; i < pinYin.length; i++) {
        if ([pinYin characterAtIndex:i] >= 'A' && [pinYin characterAtIndex:i] <= 'Z') {
            firatCharactors = [firatCharactors stringByAppendingString:[NSString stringWithFormat:@"%C",[pinYin characterAtIndex:i]]];
        }
    }
    NSString * lowerStr = [firatCharactors lowercaseString];    //大写变小写
    return lowerStr;
}
#pragma mark - 压缩图片
+ (NSData *)zipImageWithImage:(UIImage *)image
{
    if (!image) {
        return nil;
    }
    CGFloat maxFileSize = 5000000;
    CGFloat compression = 0.5f;
    NSData *compressedData = UIImageJPEGRepresentation(image, compression);
    while ([compressedData length] > maxFileSize) {
        compression *= 0.5;
        compressedData = UIImageJPEGRepresentation([[self class] compressImage:image newWidth:image.size.width*compression], compression);
    }
    return compressedData;
}
/**
 *  等比缩放本图片大小
 *
 *  @param newImageWidth 缩放后图片宽度，像素为单位
 *
 *  @return self-->(image)
 */
+ (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth
{
    if (!image) return nil;
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width = newImageWidth;
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
#pragma mark - json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        //        DLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark - 字典转json
+ (NSString*)dictionaryToJson:(NSObject *)obj{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
#pragma mark - 去掉字符串中的html标签的方法
+ (NSString *)filterHTML:(NSString *)html{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO){
        //找到标签的起始位置
        [scanner scanUpToString:@"&" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@";" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@;",text] withString:@""];
    }
    // NSString * regEx = @"<([^>]*)>";
    // html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

@end
