



#import <UIKit/UIKit.h>

@interface UIImage (resizable)


/**
 *  创建一个已经适配好了iOS67的图片
 *
 *  @param name 图片名称
 */
//+ (instancetype)imageWithNamed:(NSString *)name;

/**
 *  创建一个拉伸不变形的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)resizableImageNamed:(NSString *)name;

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/** 创建一张指定颜色的图片 */
+ (UIImage*)createImageWithColor:(UIColor*)color;
+ (UIImage*)createFullScreenImageWithColor:(UIColor*)color;

+ (UIImage *)compressWith:(UIImage *)image;

/** 判断是否是png图片 */
- (BOOL)imageHasAlpha;
/** image转base64 */
- (NSString *)image2Base64String;

@end
