//
//  ViewController.m
//  QiViewCornerCliper
//
//  Created by huangxianshuai on 2018/10/1.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 初始化imageView1
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qr_qishare"]];
    imageView1.center = CGPointMake(self.view.bounds.size.width / 2, imageView1.bounds.size.height);
    imageView1.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:imageView1];

    // 设置圆角半径，若imageView1为正方形，设置圆角半径为边长的一半可实现圆效果
    imageView1.layer.cornerRadius = 20.0;
    // 设置的描边宽度
    imageView1.layer.borderWidth = 10.0;
    // 设置的描边颜色
    imageView1.layer.borderColor = [UIColor darkGrayColor].CGColor;
    // 设置layer超出父图层的部分剪切掉
    imageView1.layer.masksToBounds = YES;
    
    
    
    // 初始化imageView2
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qr_qishare"]];
    imageView2.center = CGPointMake(self.view.bounds.size.width / 2, imageView2.bounds.size.height * 2 + 30.0);
    imageView2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:imageView2];
    
    // 创建贝塞尔曲线，指定绘制区域、角和角半径
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:imageView2.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:(CGSize){20.0}];
    // 绘制4个角，指定角半径
    // bezierPath = [UIBezierPath bezierPathWithRoundedRect:imageView2.bounds cornerRadius:20.0];
    // 绘制圆
    // bezierPath = [UIBezierPath bezierPathWithOvalInRect:imageView2.bounds];
    // 初始化shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    // 设置frame
    shapeLayer.frame = imageView2.bounds;
    // 设置绘制路径
    shapeLayer.path = bezierPath.CGPath;
    // 将shapeLayer设置为imageView2的layer的mask(遮罩)
    imageView2.layer.mask = shapeLayer;
}

@end
