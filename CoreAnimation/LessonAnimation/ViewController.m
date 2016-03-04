//
//  ViewController.m
//  LessonAnimation
//
//  Created by lanouhn on 15/7/31.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+shake.h"


@interface ViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *ballon;
@property (retain, nonatomic) IBOutlet UITextField *UserTF;
@property (retain, nonatomic) IBOutlet UIButton *bounceButton;
@property (retain, nonatomic) IBOutlet UIView *animationView;
@property (retain, nonatomic) IBOutlet UIImageView *cloud;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ios 中我们能看到控件基本都是UIView，或者UIView子类，比如：UIButton UILable  UITextField  UIImageView等等
    //UIView之所以能在屏幕上显示是因为它的内部有一个图层layer
    //获取self.animationView 图片
    //CALayer 只有显示效果不能响应用户的交互，所以不适用CALayer显示界面
    //UIView在创建对象时，UIView内部会创建一个图层（CALayer对象），通过这个图层，显示的时候内部会调用一个灰土方法（drawRect:)绘图完毕后才会显示
//    CALayer *layer = self.animationView.layer;
}

//动画 UIView 的可动画属性  frame  center bounds alpha backgroundColor transform
- (IBAction)handleBeginAnimation:(UIButton *)sender {
//    [self.UserTF shake];//调用振动方法
    [self handleProperAnimation];
//    [self handlePropertyAnimationBlock];
//    [self handleTrasitionAnimation];//过渡动画
//    [self handleLayer];//CALayer的属性动画
//    [self handleBasicAnimation];//CABasicAnimation基础动画
//    [self handleKeyFrameAnimation];//关键帧动画
//    [self handleLayerTransitionAnimation];//过渡动画
//    [self handleAnimationGroup];//分组动画
    
    }
- (void)handleProperAnimation{
    //iOS 4之前做动画，必须把修改的可动画属性写在begin和commit之间
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设置动画的持续时间
    [UIView setAnimationDuration:3];
    
    //设置delegate，该代理不需要遵循协议
    [UIView setAnimationDelegate:self];
    
    //设置delegate后必须实现的方法
    [UIView setAnimationDidStopSelector:@selector(handleAnimationStop)];
    
    //设置动画的反转效果
    [UIView setAnimationRepeatAutoreverses:YES];
    
    //设置动画的重复次数
    [UIView setAnimationRepeatCount:3];
    
    //设置动画的变化速度
//    UIViewAnimationCurveEaseInOut,         // slow at beginning and end
//    UIViewAnimationCurveEaseIn,            // slow at beginning
//    UIViewAnimationCurveEaseOut,           // slow at end
//    UIViewAnimationCurveLinear            匀速
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    
    
    //1.修改中心点
    CGPoint center = self.animationView.center;
    center.y += 50;
    self.animationView.center = center;
    
    //2.透明度
    self.animationView.alpha = 0.0;
    
    //3.变形
    self.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_4);
    
    //4.设置缩放比例
    self.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.5, 0.5);
    
    
    
    //提交动画
    [UIView commitAnimations];

    
}

- (void)handleAnimationStop{
    //回到最初的位置
    self.animationView.center = self.view.center;
    //恢复alpha值
    self.animationView.alpha = 1.0;
    
    //恢复transform最初状态
    self.animationView.transform = CGAffineTransformIdentity;//记录了变形前的状态
}

//UIView属性动画的block形式
- (void)handlePropertyAnimationBlock{
    //iOS 4.0 以后使用Block形式做动画
    //block第一种形式
//    __block typeof (self)weakSelf = self;
//    //1.动画持续时间
//    [UIView animateWithDuration:7.0 animations:^{
//        //1.修改中心点
//        CGPoint center = self.animationView.center;
//        center.y += 50;
//        weakSelf.animationView.center = center;
//        
//        //2.透明度
//        weakSelf.animationView.alpha = 0.0;
//        
//        //3.变形
//        weakSelf.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_4);
//        
//        //4.设置缩放比例
//        weakSelf.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.5, 0.5);

//    }];
    
    
    
    
    __block typeof (self)weakSelf = self;
    //Block 的第二种形式
//    [UIView animateWithDuration:6.0 animations:^{
//        //1.修改中心点
//        
//        CGPoint center = self.animationView.center;
//        center.y += 50;
//        weakSelf.animationView.center = center;
//        
//        //2.透明度
//        weakSelf.animationView.alpha = 0.0;
//        
//        //3.变形
//        weakSelf.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_4);
//        
//        //4.设置缩放比例
//        weakSelf.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.5, 0.5);
//
//    } completion:^(BOOL finished) {
//        [weakSelf handleAnimationStop];
//    }];
    
    
    //block第三种形式
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        //1.修改中心点
        
        CGPoint center = self.animationView.center;
        center.y += 50;
        weakSelf.animationView.center = center;
        
        //2.透明度
        weakSelf.animationView.alpha = 0.0;
        
        //3.变形
        weakSelf.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_4);
        
        //4.设置缩放比例
        weakSelf.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [weakSelf handleAnimationStop];
    }];
    
    
    //第四种形式
    //1.动画持续时间 2.动画延迟时间 3.设置弹簧强度（0.0 ~ 1.0） 4.设置弹簧速度 5.动画效果 6.改变动画的属性  7.结束动画
    
    [UIView animateWithDuration:3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:100 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint center = weakSelf.bounceButton.center;
        center.y += 10;
        weakSelf.bounceButton.center = center;
        weakSelf.bounceButton.transform = CGAffineTransformScale(weakSelf.bounceButton.transform, 1.2, 1.2);
    } completion:nil];
    
    
    
    
}

//UIView的过度动画
- (void)handleTrasitionAnimation{
    __block typeof(self)weakSelf = self;
    
    //参数1. 对那一个视图做过度动画  2.动画持续时间 3. 过渡效果
    [UIView transitionWithView:self.animationView duration:1.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        weakSelf.animationView.transform = CGAffineTransformRotate(weakSelf.animationView.transform, M_PI_2);
    } completion:nil];
    
}

//CALayer动画
- (void)handleLayer{
    //CALayer动画就是对layer做动画
    //1.边框的宽度
    self.animationView.layer.borderWidth = 10;
    
    //2.边框颜色
    self.animationView.layer.borderColor = [UIColor redColor].CGColor;
    
    //3.设置圆角的属性
    //self.animationView.layer.cornerRadius = 100;
    
    
    //position点默认是和锚点重合的。。。默认视图的中心点
//    self.animationView.layer.position = CGPointMake(CGRectGetMaxX(self.animationView.frame), CGRectGetMaxY(self.animationView.frame));
    self.animationView.layer.position = CGPointMake(100,100);

    //锚点 anchorpoint 默认是（0.5，0.5）
    self.animationView.layer.anchorPoint = CGPointMake(1, 1);
    
    
    
    
    
    //4.设置transform属性
    self.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI_4);
    
    
    
    
}

//CAAnimation
//CABasicAnimation 基础动画
- (void)handleBasicAnimation{
    CABasicAnimation *bassicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    
    bassicAnimation.fromValue = @(-63);//设置开始值
    bassicAnimation.toValue = @(400);//结束值
    bassicAnimation.repeatCount = 100;//设置重复次数
    bassicAnimation.duration = 3.0;//设置持续时间
    [self.cloud.layer addAnimation:bassicAnimation forKey:nil];
    
}

//CAKeyFrameAnimation 关键帧动画
- (void)handleKeyFrameAnimation{
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint point1 = self.cloud.center;
    CGPoint point2 = CGPointMake(150, 47);
    CGPoint point3 = CGPointMake(290, self.cloud.center.y);
    
    NSValue *value1 = [NSValue valueWithCGPoint:point1];
    NSValue *value2 = [NSValue valueWithCGPoint:point2];
    NSValue *value3 = [NSValue valueWithCGPoint:point3];
    
    //把一组要播放动画需要的值，按顺序放到数组中,这时动画执行的效果就会按照数组中存放值的顺序执行；
    keyFrame.values = @[value1,value2,value3,value1];
    keyFrame.duration = 6.0;
    keyFrame.repeatCount = 1000;
    //添加动画
    [self.cloud.layer addAnimation:keyFrame forKey:nil];
    
}

//过渡动画
- (void)handleLayerTransitionAnimation{
    //创建过渡动画
    /*过渡效果
     各种动画效果  其中除了'fade', `moveIn', `push' , `reveal' ,其他属于似有的API(我是这么认为的,可以点进去看下注释).
     *  ↑↑↑上面四个可以分别使用'kCATransitionFade', 'kCATransitionMoveIn', 'kCATransitionPush', 'kCATransitionReveal'来调用.
     *  @"cube"                     立方体翻滚效果
     *  @"moveIn"                   新视图移到旧视图上面
     *  @"reveal"                   显露效果(将旧视图移开,显示下面的新视图)
     *  @"fade"                     交叉淡化过渡(不支持过渡方向)             (默认为此效果)
     *  @"pageCurl"                 向上翻一页
     *  @"pageUnCurl"               向下翻一页
     *  @"suckEffect"               收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
     *  @"rippleEffect"             滴水效果,(不支持过渡方向)
     *  @"oglFlip"                  上下左右翻转效果
     *  @"rotate"                   旋转效果
     *  @"push"
     *  @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)
     *  @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
     */
    CATransition *transition = [CATransition animation];
    transition.type = @"pageCurl";
    transition.subtype = @"pageCurl";
    
    //
    [self.view.layer addAnimation:transition forKey:nil];
}

//CAAnimationGroup  分组动画
- (void)handleAnimationGroup{
    //关键帧动画 -----沿着一个半圆移动
    CAKeyframeAnimation *keyFrame1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //贝塞尔曲线
    //参数1. 圆心 参数2. 半径   参数3. 开始角度  参数4. 结束角度  参数5. 是逆时针还是顺时针
    CGFloat height = [UIScreen mainScreen].bounds.size.height / 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, height) radius:height startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    keyFrame1.path = path.CGPath;//将贝塞尔曲线作为运动轨迹
    keyFrame1.duration = 10;//持续时间
    keyFrame1.repeatCount = 1000;//重复次数
    
    
    
    
    //关键帧动画 -----在移动的过程中形变 （由小变大----》》由大变小）
    CAKeyframeAnimation *keyFrame2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyFrame2.values = @[@(1.0),@(1.4),@(1.8),@(2.2),@(2.8),@(2.2),@(1.8),@(1.4),@(1.0)];
    keyFrame2.duration = 10;
    keyFrame2.repeatCount = 1000;
    
    
    
    
    
    //创建分组动画对象
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyFrame1,keyFrame2];
    group.duration = 10;
    group.repeatCount = 1000;
    [self.ballon.layer addAnimation:group forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_ballon release];
    [_UserTF release];
    [_bounceButton release];
    [_animationView release];
    [_cloud release];
    [super dealloc];
}
@end
