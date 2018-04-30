
#import <UIKit/UIKit.h>

@interface UIView (Helper)

// 只会生成方法的声明, 不会生成方法的实现和成员变量
@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;

@property(nonatomic,assign) CGFloat bottom;

@property(nonatomic,assign) CGFloat right;

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

@property(nonatomic,assign) CGSize size;

/** 通过响应者链条获取到导航栏 */
- (UINavigationController *)navController;

/** 通过响应者链条获取到控制器 */
- (UIViewController*)selfViewController;

@end
