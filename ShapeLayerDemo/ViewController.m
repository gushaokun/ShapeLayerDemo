//
//  ViewController.m
//  ShapeLayerDemo
//
//  Created by Gavin on 16/2/22.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *act = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0f - 50, self.view.frame.size.height/2.0f - 50, 100, 100)];
    [self.view addSubview:act];
    act.backgroundColor = [UIColor whiteColor];
    
    
    //背景灰色圆
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer. strokeColor= [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1].CGColor;
    backLayer.fillColor = [UIColor clearColor].CGColor;
    backLayer.lineWidth = 3.0;
    backLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 80, 80) cornerRadius:40].CGPath;
    
    //红色动画的圆
    CAShapeLayer *ovalShapeLayer = [CAShapeLayer layer];
    ovalShapeLayer.strokeColor =[UIColor colorWithRed:0.984 green:0.153 blue:0.039 alpha:1.000].CGColor;;
    ovalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    ovalShapeLayer.lineWidth = 3.0f;
    ovalShapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10,80, 80) cornerRadius:40].CGPath;
    //分割成虚线
    ovalShapeLayer.lineDashPattern = @[@12,@6];
    [act.layer addSublayer:backLayer];
    [act.layer addSublayer:ovalShapeLayer];

    //起点动画
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(-1);
    startAnimation.toValue = @(1.0);
    
    //终点动画
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(0.0);
    endAnimation.toValue = @(1.0);

    //组合动画
    CAAnimationGroup *groupAnimations = [CAAnimationGroup animation];
    groupAnimations.animations = @[startAnimation,endAnimation];
    groupAnimations.duration = 1.1;
    groupAnimations.repeatCount = CGFLOAT_MAX;
    groupAnimations.fillMode = kCAFillModeForwards;
    groupAnimations.removedOnCompletion = NO;
    [ovalShapeLayer addAnimation:groupAnimations forKey:nil];
    
    

    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
