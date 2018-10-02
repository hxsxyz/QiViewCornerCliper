//
//  ViewController.m
//  QiViewCornerCliper
//
//  Created by huangxianshuai on 2018/10/1.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "ViewController.h"
#import "UIView+QiCornerCliper.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *qiImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageView];
    [self setupButtons];
}

- (void)setupImageView {
    
    _qiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qr_qishare"]];
    _qiImageView.center = CGPointMake(self.view.bounds.size.width / 2, 200.0);
    _qiImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_qiImageView];
}

- (void)setupButtons {
    
    NSArray<NSString *> *titles = @[@"CALayer", @"UIBezierPath & CAShapeLayer", @"UIView+QiCornerCliper"];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(30.0, 400.0 + i * 60.0, self.view.bounds.size.width - 30.0 * 2, 45.0);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button qi_clipCorners:UIRectCornerAllCorners radius:button.bounds.size.height / 2 border:.5 color:[UIColor blackColor]];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
}


#pragma mark - Action functions

- (void)buttonClicked:(UIButton *)button {
    
    [_qiImageView removeFromSuperview];
    [self setupImageView];
    
    if (button.tag == 0) {
        // 设置圆角半径，若imageView1为正方形，设置圆角半径为边长的一半可实现圆效果
        _qiImageView.layer.cornerRadius = 20.0;
        // 设置的描边宽度
        _qiImageView.layer.borderWidth = 5.0;
        // 设置的描边颜色
        _qiImageView.layer.borderColor = [UIColor blueColor].CGColor;
        // 设置layer超出父图层的部分剪切掉
        _qiImageView.layer.masksToBounds = YES;
    }
    else if (button.tag == 1) {
        // 创建贝塞尔曲线，指定绘制区域、角和角半径
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:_qiImageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:(CGSize){20.0}];
        // 绘制4个角，指定角半径
        // bezierPath = [UIBezierPath bezierPathWithRoundedRect:_qiImageView.bounds cornerRadius:20.0];
        // 绘制圆
        // bezierPath = [UIBezierPath bezierPathWithOvalInRect:_qiImageView.bounds];
        // 初始化shapeLayer
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        // 设置绘制路径
        shapeLayer.path = bezierPath.CGPath;
        // 将shapeLayer设置为imageView2的layer的mask(遮罩)
        _qiImageView.layer.mask = shapeLayer;
    }
    else if (button.tag == 2) {
        // 使用封装的方法绘制圆角
        [_qiImageView qi_clipCorners:UIRectCornerTopLeft radius:20.0 border:5.0 color:[UIColor redColor]];
    }
    else {}
}

@end
