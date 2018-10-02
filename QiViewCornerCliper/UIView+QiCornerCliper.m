//
//  UIView+QiCornerCliper.m
//  QiViewCornerCliper
//
//  Created by huangxianshuai on 2018/10/2.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "UIView+QiCornerCliper.h"

@implementation UIView (QiCornerCliper)


#pragma mark - Public functions

- (void)qi_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:(CGSize){radius}];
    CAShapeLayer *shapeLayer = self.layer.mask ?: [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

- (void)qi_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius border:(CGFloat)width color:(UIColor *)color {
    
    [self qi_clipCorners:corners radius:radius];
    
    CAShapeLayer *subLayer = [CAShapeLayer layer];
    subLayer.lineWidth = width * 2;
    subLayer.strokeColor = color.CGColor;
    subLayer.fillColor = [UIColor clearColor].CGColor;
    subLayer.path = ((CAShapeLayer *)self.layer.mask).path;
    [self.layer addSublayer:subLayer];
}

@end
