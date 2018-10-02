//
//  UIView+QiCornerCliper.h
//  QiViewCornerCliper
//
//  Created by huangxianshuai on 2018/10/2.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (QiCornerCliper)

- (void)qi_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)qi_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius border:(CGFloat)width color:(nullable UIColor *)color;

@end

NS_ASSUME_NONNULL_END
