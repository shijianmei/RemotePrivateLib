//
//  UIControl+Ext.h
//  pcpop
//
//  Created by Jianmei on 2018/1/4.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Ext)
//  add only one block, the new block will replace tho old one
- (void)addHandler:(void (^)(__kindof UIControl *control))handler forEvent:(UIControlEvents)event;

@end
