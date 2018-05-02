//
//  UIColor+Ext.h
//  pcpop
//
//  Created by Jianmei on 2018/1/4.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ext)

#ifndef RGBA
#define RGBA(r,g,b,a)           \
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif

#define ARGB(clr)   \
[UIColor colorWithARGB:(clr)]

/*!
 *  @author  苏循波,15-06-23 11:12:40
 *
 *  @brief  UIColor类别 基本方法
 */
+ (UIColor *)gmColorWithAlphaHexString:(NSString *)strRGB;

/// 通过16进制RBG值获得相应的颜色值，如：0xAABBCC、#AABBCC
+ (UIColor *)gmColorWithHexString:(NSString *)strRGB;

/*!
 扩展，直接用0xFFFFFFFF表示颜色，带透明度方式
 @param argb 0xFFFFFFFF
 @return UIColor
 */
+ (UIColor*)colorWithARGB:(NSUInteger)argb;


/*!
 扩展，直接用0xFFFFFF表示颜色，alpha=1.0f
 @param rgb 0xFFFFFF
 @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;


/*!
 用0xFFFFFF表示颜色
 @param rgb 0xFFFFFFFF
 @param alpha 0-1
 @return UIColor
 */
+ (UIColor*)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha;

/*!
 用255|0|0|1.0f表示颜色
 @param strColor 255|0|0|1.0f
 @return UIColor
 */
+ (UIColor*)colorWithString:(NSString *)strColor;

@end
