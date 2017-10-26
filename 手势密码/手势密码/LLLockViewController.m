//
//  LLLockViewController.m
//  LockSample
//
//  Created by Lugede on 14/11/11.
//  Copyright (c) 2014年 lugede.cn. All rights reserved.
//

#import "LLLockViewController.h"
#import "LLLockIndicator.h"
#import "AppDelegate.h"
#import "TouchIDViewController.h"
#import "QuestionView.h"

static NSString * const tampString = @"tamp";
static NSInteger const userNotUserTimeCount = 30;

#define kTipColorNormal [UIColor orangeColor]
#define kTipColorError [UIColor orangeColor]

@interface LLLockViewController ()
{
    int nRetryTimesRemain; // 剩余几次输入机会
}


@property (nonatomic, strong) LLLockIndicator* indecator; // 九点指示图
@property (nonatomic, strong) LLLockView* lockview; // 触摸田字控件
@property (nonatomic, strong) QuestionView *qv;
@property (strong, nonatomic) UILabel *tipLable;
@property (strong, nonatomic) UIButton *forgetButton;
@property (strong, nonatomic) UIButton *touchIDButton;
@property (nonatomic, strong) NSTimer *time;

@property (nonatomic, strong) NSString* savedPassword; // 本地存储的密码
@property (nonatomic, strong) NSString* passwordOld; // 旧密码
@property (nonatomic, strong) NSString* passwordNew; // 新密码
@property (nonatomic, strong) NSString* passwordconfirm; // 确认密码
@property (nonatomic, strong) NSString* tip1; // 三步提示语
@property (nonatomic, strong) NSString* tip2;
@property (nonatomic, strong) NSString* tip3;

@end


@implementation LLLockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        setCount = 0;
    }
    return self;
}

- (id)initWithType:(LLLockViewType)type
{
    self = [super init];
    if (self) {
        _nLockViewType = type;

        
    }
    return self;
}
-(void)gesturePassword{
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDele showLLLockViewController:LLLockViewTypeCheck];
}
#pragma mark - life cycle

/**
 *  初始化发光字体View
 */
- (void)initShimmeringView
{
    _shimmeringView = [[FBShimmeringView alloc]initWithFrame:CGRectMake(0, 100, CLTDeviceWidth, 40)];
    _shimmeringView.shimmering = YES;
    _shimmeringView.shimmeringBeginFadeDuration = 0.3f;
    _shimmeringView.shimmeringEndFadeDuration = 0.3f;
    _shimmeringView.shimmeringOpacity = 0.3f;
    [self.view addSubview:_shimmeringView];
    self.shimmeringView.contentView = _tipLable;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0x3e3e3e);
    [self loadTipLabel];
    [self loadIndecator];
    [self loadLockview];
    [self initShimmeringView];
    
    if(CLTDeviceHeight > 480){
        self.indecator.frame = CGRectMake(CLTDeviceWidth/2-20, 60, 40, 40);
        self.tipLable.frame = CGRectMake(0, self.indecator.frame.origin.y+self.indecator.frame.size.height+30, CLTDeviceWidth, 17);
        self.lockview.frame = CGRectMake(0, 140, CLTDeviceWidth, CLTDeviceWidth);
    }else{
        self.indecator.frame = CGRectMake(CLTDeviceWidth/2-20, 60, 40, 40);
        self.tipLable.frame = CGRectMake(0, self.indecator.frame.origin.y+self.indecator.frame.size.height+30, CLTDeviceWidth, 17);
        self.lockview.frame = CGRectMake(0, 140, CLTDeviceWidth, CLTDeviceWidth);
    }
    [self createButton];

    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkTamp) userInfo:nil repeats:YES];
    [self checkTampAction];
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"resetpasword"])
    {
        ///加返回按钮
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(touchReturn) forControlEvents:UIControlEventTouchDown];
        backBtn.frame = CGRectMake(15, 35, 45, 21);
        [self.view addSubview:backBtn];
    }
}
-(void)touchReturn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"resetpasword"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(void)loadQuestionView{
    self.qv = [[QuestionView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.qv];
}
- (void)removeQuestionView{
    [self.qv removeFromSuperview];
}
-(void)loadTipLabel{
    //初始化tipLabel
    self.tipLable = [[UILabel alloc]init];
    //self.tipLable.textColor = [UIColor whiteColor];
    self.tipLable.textAlignment = NSTextAlignmentCenter;
    self.tipLable.text = @"请输入解锁密码";
    self.tipLable.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.tipLable];
}
-(void)loadIndecator{
    //初始化indecator
    self.indecator = [[LLLockIndicator alloc]init];
    self.indecator.backgroundColor = UIColorFromRGB(0x3e3e3e);
    [self.view addSubview:self.indecator];
}
-(void)loadLockview{
    //初始化lockview
    self.lockview = [[LLLockView alloc]init];
    self.lockview.backgroundColor = [UIColor clearColor];
    self.lockview.delegate = self;
    [self.view addSubview:self.lockview];
}
-(void)createButton{
    self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgetButton setTitle:@"  忘记手势密码?" forState:UIControlStateNormal];
    [self.forgetButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.forgetButton setTitleColor:kTipColorNormal forState:UIControlStateNormal];
    self.forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.forgetButton setFrame:CGRectMake(0, CLTDeviceHeight - 80, CLTDeviceWidth/2, 50)];
    [self.forgetButton addTarget:self action:@selector(passwordbackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.forgetButton.tag = 10000;
    [self.view addSubview:self.forgetButton];
    
    self.touchIDButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.touchIDButton setTitle:@"指纹解锁  " forState:UIControlStateNormal];
    [self.touchIDButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.touchIDButton setTitleColor:kTipColorNormal forState:UIControlStateNormal];
     self.touchIDButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.touchIDButton setFrame:CGRectMake(CLTDeviceWidth/2, CLTDeviceHeight - 80, CLTDeviceWidth/2-10, 50)];
    [self.touchIDButton addTarget:self action:@selector(passwordbackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.touchIDButton.tag = 20000;
    [self.view addSubview:self.touchIDButton];
    
    if(CLTDeviceHeight <= 480){
        [self.forgetButton setFrame:CGRectMake(0, CLTDeviceHeight - 30, CLTDeviceWidth/2, 30)];
        [self.touchIDButton setFrame:CGRectMake(CLTDeviceWidth/2, CLTDeviceHeight - 30, CLTDeviceWidth/2-10, 30)];
    }else{
        [self.forgetButton setFrame:CGRectMake(0, CLTDeviceHeight - 80, CLTDeviceWidth/2, 50)];
        [self.touchIDButton setFrame:CGRectMake(CLTDeviceWidth/2, CLTDeviceHeight - 80, CLTDeviceWidth/2-10, 50)];
    }
    
    if(self.nLockViewType == LLLockViewTypeCheck || self.nLockViewType == LLLockViewTypeClean){
        self.forgetButton.hidden = NO;
        self.touchIDButton.hidden = NO;
    }else if(self.nLockViewType == LLLockViewTypeCreate){
        self.forgetButton.hidden = YES;
        self.touchIDButton.hidden = YES;
    }
}

-(void)passwordbackBtnClick:(UIButton *)button{
    if(button.tag == 10000){
        [self loadQuestionView];
        
    }else{
        if([[NSUserDefaults standardUserDefaults]objectForKey:@"touchID"]){
           [TouchIDViewController authenticateUser];
        }else{
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"未开启指纹解锁" message:@"请在设置中开启TouchID指纹解锁" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 初始化内容
    switch (_nLockViewType) {
        case LLLockViewTypeCheck:
        {
            _tipLable.text = @"请输入解锁密码";
        }
            break;
        case LLLockViewTypeCreate:
        {
            _tipLable.text = @"创建手势密码";
        }
            break;
        case LLLockViewTypeModify:
        {
            _tipLable.text = @"请输入原来的密码";
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            _tipLable.text = @"请输入密码以清除密码";
        }
    }
    
    // 尝试机会
    nRetryTimesRemain = LLLockRetryTimes - 1;
    
    self.passwordOld = @"";
    self.passwordNew = @"";
    self.passwordconfirm = @"";
    
    // 本地保存的手势密码
    self.savedPassword = [LLLockPassword loadLockPassword];
    LLLog(@"本地保存的密码是%@", self.savedPassword);
    [self updateTipButtonStatus];
    [self EnterForegroundAction];
    
    
}

+ (BOOL)ifSetLockPassword{
    BOOL setLockPassword = NO;
    NSString *lockPassword = [LLLockPassword loadLockPassword];
    if (lockPassword.length >= 4) {
        setLockPassword = YES;
    }
    return setLockPassword;
}
+ (BOOL)isOpenGesturePassword{
    BOOL openGesturePassword = NO;
    //手势密码开启的状态值
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"openGestuer"]boolValue] == 1){
        openGesturePassword = YES;
    }else{
        openGesturePassword = NO;
    }
    
    return openGesturePassword;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 检查/更新密码
- (void)checkPassword:(NSString*)string
{
    NSUserDefaults *defa = [NSUserDefaults standardUserDefaults];
    // 验证密码正确
    if ([string isEqualToString:self.savedPassword]) {
        
        if (_nLockViewType == LLLockViewTypeModify) { // 验证旧密码
            
            self.passwordOld = string; // 设置旧密码，说明是在修改
            
            [self setTip:@"请输入新的密码"]; // 这里和下面的delegate不一致，有空重构
            
        } else if (_nLockViewType == LLLockViewTypeClean) { // 清除密码

            [LLLockPassword saveLockPassword:nil];
            [self hide];
            
            ShowMessage(self.tip2);
        } else { // 验证成功
            
            [self hide];
        }
        
    }
    // 验证密码错误
    else if (string.length > 0) {
        if (nRetryTimesRemain > 0) {
            [self setErrorTip:[NSString stringWithFormat:@"密码错误，还可以再输入%d次", nRetryTimesRemain] errorPswd:string];
            NSLog(@"~~~~~~~~nRetryTimesRemain~~~~~~~~%d",nRetryTimesRemain);
            nRetryTimesRemain--;
        } else {
            NSDate *now = [NSDate date];
            NSString * tamp = [NSString stringWithFormat:@"%ld",(long)[now timeIntervalSince1970]];
            [defa setObject:tamp forKey:tampString];
            [defa synchronize];
            [self.view setUserInteractionEnabled:NO];
            // 强制注销该账户，并清除手势密码，以便重设
            self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkTamp) userInfo:nil repeats:YES];
            [self.time fire];
        }
        
    } else {
        NSAssert(YES, @"意外情况");
    }
}

- (void)createPassword:(NSString*)string
{
    // 输入密码
    if ([self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]) {
        
        self.passwordNew = string;
        [self setTip:self.tip2];
    }
    // 确认输入密码
    else if (![self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]) {

        self.passwordconfirm = string;
        
        if ([self.passwordNew isEqualToString:self.passwordconfirm]) {
            // 成功
            LLLog(@"两次密码一致");
            
            [LLLockPassword saveLockPassword:string];
            if([[NSUserDefaults standardUserDefaults]objectForKey:@"create"]){
                [self loadQuestionView];
                [self.qv clickBlock:^{
                    [self dismissViewControllerAnimated:YES completion:nil];
                }];
            }else{
                [self hide];
            }
            
        } else {
            
            self.passwordconfirm = @"";
            [self setTip:self.tip2];
            [self setErrorTip:@"与上一次绘制不一致，请重新绘制" errorPswd:string];
            
        }
    } else {
        NSAssert(1, @"设置密码意外");
    }
}

#pragma mark - 显示提示
- (void)setTip:(NSString*)tip
{
    [_tipLable setText:tip];
    [_tipLable setTextColor:kTipColorNormal];
    
    _tipLable.alpha = 0;
    [UIView animateWithDuration:0.8
                     animations:^{
                          _tipLable.alpha = 1;
                     }completion:^(BOOL finished){
                     }
     ];
}

// 错误
- (void)setErrorTip:(NSString*)tip errorPswd:(NSString*)string
{
    // 显示错误点点
    [self.lockview showErrorCircles:string];
    
    // 直接_变量的坏处是
    [_tipLable setText:tip];
    [_tipLable setTextColor:kTipColorError];
    
    //[self shakeAnimationForView:_tipLable];
}

#pragma mark 新建/修改后保存
- (void)updateTipButtonStatus
{
    LLLog(@"重设TipButton");
        // 更新指示圆点
    if (![self.passwordNew isEqualToString:@""] && [self.passwordconfirm isEqualToString:@""]){
        self.indecator.hidden = NO;
        [self.indecator setPasswordString:self.passwordNew];
    } else {
        self.indecator.hidden = YES;
    }
}

#pragma mark - 成功后返回
- (void)hide
{
    switch (_nLockViewType) {
            
        case LLLockViewTypeCheck:
        {
        }
            break;
        case LLLockViewTypeCreate:
        {
        }
            break;
        case LLLockViewTypeModify:
        {
            [LLLockPassword saveLockPassword:self.passwordNew];
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            [LLLockPassword saveLockPassword:nil];
        }
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - delegate 每次划完手势后
- (void)lockString:(NSString *)string
{
    LLLog(@"这次的密码=--->%@<---", string) ;
    
    switch (_nLockViewType) {
            
        case LLLockViewTypeCheck:
        {
            self.tip1 = @"请输入解锁密码";
            [self checkPassword:string];
        }
            break;
        case LLLockViewTypeCreate:
        {
            self.tip1 = @"创建解锁密码";
            self.tip2 = @"请再次绘制解锁密码";
            self.tip3 = @"解锁密码创建成功";
            [self createPassword:string];
        }
            break;
        case LLLockViewTypeModify:
        {
            if ([self.passwordOld isEqualToString:@""]) {
                self.tip1 = @"请输入原来的密码";
                [self checkPassword:string];
            } else {
                self.tip1 = @"请输入新的密码";
                self.tip2 = @"请再次输入密码";
                self.tip3 = @"密码修改成功";
                [self createPassword:string];
            }
        }
            break;
        case LLLockViewTypeClean:
        default:
        {
            self.tip1 = @"请输入密码以清除密码";
            self.tip2 = @"清除密码成功";
            [self checkPassword:string];
        }
    }
    
    [self updateTipButtonStatus];
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

#pragma mark - 时间计数

- (void)checkTamp {
    [self checkTampAction];
}

#pragma mark - nocation

- (void)EnterForegroundAction {
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkTamp) userInfo:nil repeats:YES];
    [self.time fire];
    
}
/*

*/
- (void)checkTampAction {
    
    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
    NSInteger tamp = [defaultUser stringForKey:@"tamp"].integerValue;
    
    NSInteger currentTamp = [[NSDate date] timeIntervalSince1970];
    
    if (currentTamp - tamp < userNotUserTimeCount) {
        NSInteger tamp = [[NSDate date] timeIntervalSince1970];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSInteger lastTamp = [[userDefault stringForKey:tampString]  integerValue];
        NSInteger remainetime = 30 - (tamp -lastTamp);
        NSString *showTime = [NSString stringWithFormat:@"操作过频，请在%02ld分%02ld秒后重新输入",remainetime/60,remainetime%60];
        self.tipLable.text = showTime;
        self.tipLable.textColor = kTipColorError;

        [[NSUserDefaults standardUserDefaults]setObject:@(YES) forKey:@"restart"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        self.view.userInteractionEnabled = NO;

        
    }else {
        [self.time invalidate];
        self.time = nil;
        [self setErrorTip:nil errorPswd:nil];
        self.lockview.userInteractionEnabled = YES;
        self.tipLable.text = @"请输入解锁密码";
        self.tipLable.textColor = kTipColorNormal;
        self.view.userInteractionEnabled = YES;
        nRetryTimesRemain = 4;
        
    }
    
}

@end
