//
//  UIControl+Ext.m
//  pcpop
//
//  Created by Jianmei on 2018/1/4.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "UIControl+Ext.h"
#import <objc/runtime.h>

#define HandlerKey @"HandlerKey"

@implementation UIControl (Ext)

- (void)addHandler:(void (^)(__kindof UIControl *))handler forEvent:(UIControlEvents)event
{
    [self addTarget:self action:@selector(onHandler) forControlEvents:event];
    objc_setAssociatedObject(self, HandlerKey, handler, OBJC_ASSOCIATION_COPY);
}

- (void)onHandler
{
    void (^handler)() = objc_getAssociatedObject(self, HandlerKey);
    if (handler) {
        handler(self);
    }
}
@end
