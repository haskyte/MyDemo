//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by wujianqiang on 16/2/25.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end
IB_DESIGNABLE

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(UIButton *)sender {
    [self clearView];
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor RandomColor].CGColor;
    [self.layerView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [layer addAnimation:animation forKey:nil];
    
    
    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation1.fromValue = @0.1;
//    animation1.toValue = @1;
//    animation1.duration = 1;
//    [layer addAnimation:animation1 forKey:nil];
    
//    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//    [bezierPath moveToPoint: CGPointMake(100, 100)];
//    [bezierPath addLineToPoint: CGPointMake(0, 0)];
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1;
//    [bezierPath stroke];
//    animation2.path = bezierPath.CGPath;
//    animation2.duration = 1;
//    animation2.repeatCount = 1;
//    [layer addAnimation:animation2 forKey:nil];
//    
//    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    pulse.duration = 1;
//    pulse.repeatCount = 1;
//    pulse.fromValue = [NSNumber numberWithFloat:1];
//    pulse.toValue = [NSNumber numberWithFloat:2];
//    [layer addAnimation:pulse forKey:nil];
    self.layerView.backgroundColor = [UIColor RandomColor];
    [self creatLine];
    [self creatQuxian];
    [self creatRound];
    [self creatMyName];
    [self creatCycle];
    [self creatVoice:0.6];

    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 40, 20)];
    [self.view addSubview:view];
    [self creatPathWithView:view];
    view.backgroundColor = [UIColor redColor];

}



// 直线

- (void)creatLine{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(20, 240)];
    [linePath addLineToPoint:CGPointMake(320, 270)];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor RandomColor].CGColor;
    lineLayer.strokeColor = [UIColor RandomColor].CGColor;
    [self.layerView.layer addSublayer:lineLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [lineLayer addAnimation:animation forKey:nil];
}

// 曲线
- (void)creatQuxian{
    CGPoint startPoint   = CGPointMake(50, 100);
    CGPoint endPoint     = CGPointMake(350, 100);
    CGPoint controlPoint = CGPointMake(150, 10);
    CGPoint controlPoint1 = CGPointMake(250, 190);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint1];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor RandomColor].CGColor;
    
    [self.layerView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 1;
    [layer addAnimation:animation forKey:nil];
}

- (void)creatMyName{
    CGFloat startX = 100;
    CGFloat startY = 180;
    
    CAShapeLayer *nameLayer = [CAShapeLayer layer];
    UIBezierPath *namePath = [UIBezierPath bezierPath];
    
    [namePath moveToPoint:CGPointMake(startX + 25, startY + 20)];
    [namePath addLineToPoint:CGPointMake(startX + 30, startY + 80)];
    
    [namePath moveToPoint:CGPointMake(startX + 30 , startY + 30)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 25)];
    
    [namePath moveToPoint:CGPointMake(startX + 150 , startY + 22.5)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 80)];
    
    [namePath moveToPoint:CGPointMake(startX + 30 , startY + 70)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 70)];
    
    [namePath moveToPoint:CGPointMake(startX + 24 , startY + 100)];
    [namePath addLineToPoint:CGPointMake(startX + 150, startY + 90)];
    
    [namePath moveToPoint:CGPointMake(startX + 20 , startY + 127)];
    [namePath addLineToPoint:CGPointMake(startX + 168, startY + 121)];
    
    [namePath moveToPoint:CGPointMake(startX + 92 , startY + 92)];
    [namePath addQuadCurveToPoint:CGPointMake(startX + 20, startY + 165) controlPoint:CGPointMake(startX+90, startY+155)];
    [namePath moveToPoint:CGPointMake(startX + 92 , startY + 128)];
    [namePath addQuadCurveToPoint:CGPointMake(startX + 168, startY + 165) controlPoint:CGPointMake(startX+150, startY+160)];
    
    nameLayer.path = namePath.CGPath;
    nameLayer.fillColor = [UIColor clearColor].CGColor;
    nameLayer.strokeColor = [UIColor RandomColor].CGColor;
    nameLayer.lineCap = kCALineCapRound;
    nameLayer.lineWidth = 5;
    [self.layerView.layer addSublayer:nameLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [nameLayer addAnimation:animation forKey:nil];
    
}


// 创建不规则图形
- (void)creatPathWithView:(UIView *)pathView{
    CGFloat cornerSpace = 3;
    CGFloat viewWidth = CGRectGetWidth(pathView.frame);
    CGFloat viewHeight = CGRectGetHeight(pathView.frame) - cornerSpace;
    CAShapeLayer *signLayer = [CAShapeLayer layer];
    UIBezierPath *signPath = [UIBezierPath bezierPath];
    [signPath moveToPoint:CGPointMake(0, 0)];
    [signPath addLineToPoint:CGPointMake(viewWidth, 0)];
    [signPath addLineToPoint:CGPointMake(viewWidth, viewHeight)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2 + cornerSpace, viewHeight)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2, viewHeight + cornerSpace)];
    [signPath addLineToPoint:CGPointMake(viewWidth/2 - cornerSpace, viewHeight)];
    [signPath addLineToPoint:CGPointMake(0, viewHeight)];
    [signPath closePath];
    signLayer.path = signPath.CGPath;
    pathView.layer.mask = signLayer;
}

- (void)creatRound{
    CAShapeLayer *roundLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(40, 20, 300, 200)];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 20, 200, 200) cornerRadius:100].bezierPathByReversingPath];

//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 180, 200, 400) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(100, 10)];
    
    roundLayer.fillColor = [UIColor RandomColor].CGColor;
//    roundLayer.strokeColor = [UIColor redColor].CGColor;
    roundLayer.path = path.CGPath;
    [self.layerView.layer addSublayer:roundLayer];
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [roundLayer addAnimation:animation forKey:nil];
}

- (void)creatCycle{
    CAShapeLayer *cycleLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(300, 200) radius:50 startAngle:M_PI_2 endAngle:M_PI*2 clockwise:YES];
    cycleLayer.path = path.CGPath;
    cycleLayer.fillColor = [UIColor RandomColor].CGColor;
    cycleLayer.strokeColor = [UIColor RandomColor].CGColor;
    cycleLayer.lineWidth = 5;
    [self.layerView.layer addSublayer:cycleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [cycleLayer addAnimation:animation forKey:nil];
    
}

- (void)creatVoice: (CGFloat)voicePower{
    UIView *dynamicView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 20, 50)];
    dynamicView.backgroundColor = [UIColor RandomColor];
    dynamicView.clipsToBounds = YES;
    [self.view addSubview:dynamicView];
    
        CGFloat height = (voicePower)*(CGRectGetHeight(dynamicView.frame));
    
    
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(dynamicView.frame)-height, CGRectGetWidth(dynamicView.frame), height) cornerRadius:10];
        CAShapeLayer *indicateLayer = [CAShapeLayer layer];
        indicateLayer.path = path.CGPath;
        indicateLayer.fillColor = [UIColor redColor].CGColor;
        [dynamicView.layer addSublayer:indicateLayer];
    
}


- (void)clearView{
    [self.layerView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}


@end
