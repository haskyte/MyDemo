//
//  LLLockView.m
//  LockSample
//
//  Created by Lugede on 14/11/11.
//  Copyright (c) 2014年 lugede.cn. All rights reserved.
//

#import "LLLockView.h"
#import "LLLockViewController.h"

#define kLLBaseCircleNumber 10000       // tag基数（请勿修改）
//#define kCircleMargin             // 圆点离屏幕左边距
//#define kCircleDiameter           // 圆点直径
#define kLLCircleAlpha 1.0              // 圆点透明度
#define kLLLineWidth 4.0               // 线条宽
#define kLLLineColor [UIColor orangeColor]


@interface LLLockView ()
{
    NSMutableArray* buttonArray;
    NSMutableArray* selectedButtonArray;
    NSMutableArray* wrongButtonArray;
    CGPoint nowPoint;
    
    NSTimer* timer;
    
    BOOL isWrongColor;
    BOOL isDrawing; // 正在画中
}

@end

@implementation LLLockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        [self initCircles];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.clipsToBounds = YES;
        [self initCircles];
    }
    return self;
}

- (void)initCircles
{
    buttonArray = [NSMutableArray array];
    selectedButtonArray = [NSMutableArray array];
    
    // 初始化圆点
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        int x;
        int y;
        int  kCircleDiameter;
        int  kCircleMargin;
        if(CLTDeviceHeight > 480 ){
            if(CLTDeviceHeight == 568){
                kCircleDiameter = 70;
                kCircleMargin = (CLTDeviceWidth - kCircleDiameter * 3)/4;
                x = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i%3);
                y = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i/3);
            }else{
                kCircleDiameter = 80;
                kCircleMargin = (CLTDeviceWidth - kCircleDiameter * 3)/4;
                x = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i%3);
                y = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i/3);
            }
            
        }else{
            kCircleDiameter = 60;
            kCircleMargin = (CLTDeviceWidth - kCircleDiameter * 3)/4;
            x = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i%3);
            y = kCircleMargin + (kCircleMargin + kCircleDiameter)*(i/3);
        }
        
        [button setFrame:CGRectMake(x, y, kCircleDiameter, kCircleDiameter)];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setBackgroundImage:[UIImage imageNamed:@"circle_normal"] forState:UIControlStateNormal];
        button.userInteractionEnabled= NO;//禁止用户交互
        button.alpha = kLLCircleAlpha;
        button.tag = i + kLLBaseCircleNumber + 1; // tag从基数+1开始,
        [self addSubview:button];
        [buttonArray addObject:button];
    }
    
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - 事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    LLLog(@"touch began");
    isDrawing = NO;
    // 如果是错误色才重置(timer重置过了)
    if (isWrongColor) {
        [self clearColorAndSelectedButton];
    }
    CGPoint point = [[touches anyObject] locationInView:self];
    [self updateFingerPosition:point];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    isDrawing = YES;
    
    CGPoint point = [[touches anyObject] locationInView:self];
    [self updateFingerPosition:point];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    LLLog(@"输入密码结束");
    [self endPosition];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    LLLog(@"输入密码取消");
    [self endPosition];
}


#pragma mark - 绘制连线
- (void)drawRect:(CGRect)rect
{
    LLLog(@"drawRect - %@", [NSString stringWithFormat:@"%d", isWrongColor]);
    
    if (selectedButtonArray.count > 0) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        isWrongColor ? [kLLLineColor set] : [kLLLineColor set]; // 正误线条色
        CGContextSetLineWidth(context, kLLLineWidth);

        // 画之前线s
        CGPoint addLines[9];
        int count = 0;
        for (UIButton* button in selectedButtonArray) {
            CGPoint point = CGPointMake(button.center.x, button.center.y);
            addLines[count++] = point;
            
            // 画中心圆
            CGRect circleRect = CGRectMake(button.center.x- kLLLineWidth/2,
                                           button.center.y - kLLLineWidth/2,
                                           kLLLineWidth,
                                           kLLLineWidth);
            CGContextSetFillColorWithColor(context, kLLLineColor.CGColor);
            CGContextFillEllipseInRect(context, circleRect);
        }
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextAddLines(context, addLines, count);
        CGContextStrokePath(context);
         //*/
        
        // 画当前线
        UIButton* lastButton = selectedButtonArray.lastObject;
        CGContextMoveToPoint(context, lastButton.center.x, lastButton.center.y);
        CGContextAddLineToPoint(context, nowPoint.x, nowPoint.y);
        CGContextStrokePath(context);
    }
    
}

#pragma mark - 处理
// 当前手指位置
- (void)updateFingerPosition:(CGPoint)point{
    
    nowPoint = point;
    
    for (UIButton *thisbutton in buttonArray) {
        CGFloat xdiff =point.x-thisbutton.center.x;
        CGFloat ydiff=point.y - thisbutton.center.y;
        
        if (fabs(xdiff) <36 && fabs(ydiff) <36){
            // 未选中的才能加入
            if (!thisbutton.selected) {
                thisbutton.selected = YES;
                [selectedButtonArray  addObject:thisbutton];
            }
        }
    }
    [self setNeedsDisplay];
    
}

- (void)endPosition
{
    isDrawing = NO;
    
    UIButton *strbutton;
    NSString *string=@"";
    
    if(selectedButtonArray.count <= 3){
        //[self showAlert:@"密码长度不能小于4"];
        ShowMessage(@"密码长度不能小于4");
        [self shakeAnimationForView:self.superview];
        [self clearColorAndSelectedButton];
        return;
    }else{
        // 生成密码串
        for (int i=0; i < selectedButtonArray.count; i++) {
            strbutton = selectedButtonArray[i];
            string= [string stringByAppendingFormat:@"%ld",strbutton.tag-kLLBaseCircleNumber];
        }
        
        [self clearColorAndSelectedButton]; // 清除到初始样式
        
        if ([self.delegate respondsToSelector:@selector(lockString:)]) {
            if (string && string.length>3) {
                [self.delegate lockString:string];
            }
        }
        
        LLLog(@"addstring end Position");
        
        LLLog(@"end Position");
        
    }

}

#pragma mark 抖动动画
- (void)shakeAnimationForView:(UIView *)view
{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

// 清除至初始状态
- (void)clearColor
{
    if (isWrongColor) {
        LLLog(@"clearColorAndSelectedButton");
        // 重置颜色
        isWrongColor = NO;
        for (UIButton* button in buttonArray) {
            //[button setBackgroundImage:[UIImage imageNamed:@"circle_selected"] forState:UIControlStateSelected];
            [button setBackgroundImage:[UIImage imageNamed:@"circle_normal"] forState:UIControlStateSelected];
        }
        
    }
}

- (void)clearSelectedButton
{
    // 换到下次按时再弄
    for (UIButton *thisButton in buttonArray) {
        [thisButton setSelected:NO];
    }
    [selectedButtonArray removeAllObjects];
    
    [self setNeedsDisplay];
}

- (void)clearColorAndSelectedButton
{
    if (!isDrawing) {
        [self clearColor];
        [self clearSelectedButton];
    }
    
}

#pragma mark - 生成密码
-(void)addstring{
    
}

#pragma mark - 显示错误
- (void)showErrorCircles:(NSString*)string
{
    LLLog(@"ShowError");

    isWrongColor = YES;
    
    NSMutableArray* numbers = [[NSMutableArray alloc] initWithCapacity:string.length];
    for (int i = 0; i < string.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSNumber* number = [NSNumber numberWithInt:[string substringWithRange:range].intValue-1]; // 数字是1开始的
        [numbers addObject:number];
        [buttonArray[number.intValue] setSelected:YES];
        
        [selectedButtonArray addObject:buttonArray[number.intValue]];
    }
    
    for (UIButton* button in buttonArray) {
        if (button.selected) {
            [button setBackgroundImage:[UIImage imageNamed:@"circle_normal"] forState:UIControlStateSelected];
        }
        
    }
    
    [self setNeedsDisplay];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(clearColorAndSelectedButton)
                                           userInfo:nil
                                            repeats:NO];
    
}


@end
