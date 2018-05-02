//
//  UIColor+Ext.m
//  pcpop
//
//  Created by Jianmei on 2018/1/4.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

/// 通过16进制RBG值获得相应的颜色值，如：0xAABBCC、#AABBCCAA,可以带alpha
+ (UIColor *)gmColorWithAlphaHexString:(NSString *)strRGB
{
    /// 去掉空格，并全改为大写形式，便于下面的计算
    NSString *strColor = [[self gmSpaceTrimAll:strRGB] uppercaseString];
    
    /// 字符串必须大于6位，否则默认返回黑色
    if ([strColor length] < 6)
    {
        return [UIColor blackColor];
    }
    
    ///  strip 0X if it appears
    if ([strColor hasPrefix:@"0X"])
    {
        strColor = [strColor substringFromIndex:2];
    }
    else if ([strColor hasPrefix:@"#"])
    {
        strColor = [strColor substringFromIndex:1];
    }
    if ([strColor length] < 6)
    {
        return [UIColor blackColor];
    }
    /// 分别获取R、G、B的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [strColor substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [strColor substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [strColor substringWithRange:range];
    
    
    
    /// Scan values
    unsigned int cuintR;
    unsigned int cuintG;
    unsigned int cuintB;
    unsigned int cuintA = 255;
    [[NSScanner scannerWithString:rString] scanHexInt:&cuintR];
    [[NSScanner scannerWithString:gString] scanHexInt:&cuintG];
    [[NSScanner scannerWithString:bString] scanHexInt:&cuintB];
    if (strColor.length == 8)
    {
        range.location = 6;
        NSString *strAlpha = [strColor substringWithRange:range];
        [[NSScanner scannerWithString:strAlpha] scanHexInt:&cuintA];
    }
    
    
    return [UIColor colorWithRed:((float) cuintR / 255.0f)
                           green:((float) cuintG / 255.0f)
                            blue:((float) cuintB / 255.0f)
                           alpha:((float) cuintA / 255.0f)];
}




/// 通过16进制RBG值获得相应的颜色值，如：0xAABBCC、#AABBCC
+ (UIColor *)gmColorWithHexString:(NSString *)strRGB
{
    /// 去掉空格，并全改为大写形式，便于下面的计算
    NSString *strColor = [[self gmSpaceTrimAll:strRGB] uppercaseString];
    
    /// 字符串必须大于6位，否则默认返回黑色
    if ([strColor length] < 6)
    {
        return [UIColor blackColor];
    }
    
    ///  strip 0X if it appears
    if ([strColor hasPrefix:@"0X"])
    {
        strColor = [strColor substringFromIndex:2];
    }
    else if ([strColor hasPrefix:@"#"])
    {
        strColor = [strColor substringFromIndex:1];
    }
    
    /// 剩下的位数一定是6位，否则默认返回黑色
    if ([strColor length] != 6)
    {
        return [UIColor blackColor];
    }
    
    /// 分别获取R、G、B的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [strColor substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [strColor substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [strColor substringWithRange:range];
    
    /// Scan values
    unsigned int cuintR;
    unsigned int cuintG;
    unsigned int cuintB;
    [[NSScanner scannerWithString:rString] scanHexInt:&cuintR];
    [[NSScanner scannerWithString:gString] scanHexInt:&cuintG];
    [[NSScanner scannerWithString:bString] scanHexInt:&cuintB];
    
    return [UIColor colorWithRed:((float) cuintR / 255.0f)
                           green:((float) cuintG / 255.0f)
                            blue:((float) cuintB / 255.0f)
                           alpha:1.0f];
}

/// 去除String里面所有空格
+ (NSString *)gmSpaceTrimAll:(NSString *)str
{
    /// 将所有空格替换为空字符
    NSString *strResult = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    /// 加入nil保护
    return POP_Str_Protect(strResult);
}

+ (UIColor*)colorWithARGB:(NSUInteger)argb
{
    CGFloat alpha = (argb > 0xFFFFFF) ? (((argb>>24)&0xFF)/255.0f) : 1.0f;
    return [UIColor colorWithRGB:argb alpha:alpha];
}

+ (UIColor *)colorWithRGB:(NSUInteger)rgb;
{
    return [UIColor colorWithRGB:rgb alpha:1.0f];
}

+ (UIColor*)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha
{
    NSUInteger red = (rgb>>16)&0xFF;
    NSUInteger green = (rgb>>8)&0xFF;
    NSUInteger blue = rgb&0xFF;
    return RGBA(red, green, blue, alpha);
}

+ (UIColor*)colorWithString:(NSString *)strColor
{
    NSArray* colorValueArr = [strColor componentsSeparatedByString:@"|"];
    if (colorValueArr.count < 3 || colorValueArr.count > 4) {
        return nil;
    }
    
    NSUInteger red = [[colorValueArr objectAtIndex:0] integerValue];
    NSUInteger green = [[colorValueArr objectAtIndex:1] integerValue];
    NSUInteger blue = [[colorValueArr objectAtIndex:2] integerValue];
    CGFloat alpha = 1.0f;
    if (colorValueArr.count == 4) {
        alpha = [[colorValueArr objectAtIndex:3] floatValue];
    }
    return RGBA(red, green, blue, alpha);
}

@end
