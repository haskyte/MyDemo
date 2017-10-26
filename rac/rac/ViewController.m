//
//  ViewController.m
//  rac
//
//  Created by wujianqiang on 2017/1/16.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa.h>
#import "RedView.h"
#import "FirstViewController.h"
#import <RACEXTScope.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *conform;

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.

    // textfield
    [[self.textField.rac_textSignal
     filter:^BOOL(NSString * text) {
         return text.length > 0;
     }]
     subscribeNext:^(id x) {
         self.text.text = x;
    }];
    
    
    //长度大于3的时候打印
    [[self.textField.rac_textSignal filter:^BOOL(id value) {
         NSString *text = value;
         return text.length > 3;
    }] subscribeNext:^(NSString *x) {
         NSLog(@"%@",x);
     }];
    
    [[[self.textField1.rac_textSignal map:^id(NSString *text) {
        return @(text.length);
    }] filter:^BOOL(NSNumber *length) {
        return [length integerValue] > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
    
    RAC(self.textField,backgroundColor) = [self.textField.rac_textSignal map:^id(NSNumber *textField) {
        return [textField boolValue]?[UIColor redColor]:[UIColor yellowColor];
    }];
    
    RAC(self.textField1,backgroundColor) = [self.textField1.rac_textSignal map:^id(NSNumber *textField) {
        return [textField boolValue]?[UIColor redColor]:[UIColor yellowColor];
    }];
    
    [[RACSignal combineLatest:@[self.textField.rac_textSignal,self.textField1.rac_textSignal]
                       reduce:^id(NSNumber*text, NSNumber *text1){
                           return @([text boolValue]&&[text1 boolValue]);
    }] subscribeNext:^(NSNumber*signupActive) {
        self.conform.enabled = [signupActive boolValue];
    }];
    
    
    // button
//    [[self.conform rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        NSLog(@"123");
//    }];

    
    [self.conform setRac_command:[[RACCommand alloc] initWithEnabled:nil signalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:[[NSDate date] description]];
                [subscriber sendCompleted];
            });
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }]];

    
    [[[self.conform rac_command] executionSignals] subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
            NSLog(@"%@",x);
        } completed:^{
            NSLog(@"123123");
        }];
    }];
    
    
    NSArray *numbers = @[@1001,@1002,@1003,@1004];
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    

    
    
    RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(0, 300, 200, 100)];
    [self.view addSubview:redView];

    [[redView.blackButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"%@", redView.textField.text);
    }];
    
    
    
    
//    [[self rac_signalForSelector:@selector(backWithString:) fromProtocol:@protocol(FirstViewControllerDelegate)] subscribeNext:^(id x) {
//        NSLog(@"1");
//    }];
//    
//    
//    // 通知
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"代码之道频道" object:nil] subscribeNext:^(NSNotification* x) {
//        NSLog(@"技巧：%@", x.userInfo[@"技巧"]);
//    }];
    
    
    @weakify(self);
    [[self.nextBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        FirstViewController *first = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:first animated:YES];
        first.touchSignal = [RACSubject subject];
        [first.touchSignal subscribeNext:^(NSNumber * x) {
            
            self.text.text = [NSString stringWithFormat:@"%@",x];
        }];
        
    }];
    
}





//- (void)click:(UIButton *)button{
//    NSLog(@"1");
//}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
