//
//  ViewController.m
//  menuButton
//
//  Created by wujianqiang on 16/5/30.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "DisperseBtn.h"


@interface ViewController ()


@property (nonatomic, strong) DisperseBtn *disView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.disView];
}


- (DisperseBtn *)disView{
    if (_disView == nil) {
        self.disView = [[DisperseBtn alloc]init];
        _disView.frame = CGRectMake(10, self.view.bounds.size.height-60, 50, 50);
        _disView.borderRect = self.view.frame;
        _disView.closeImage = [UIImage imageNamed:@"menu_selected"];
        _disView.openImage = [UIImage imageNamed:@"menu_unselected"];
        [self setDisViewButtonsNum:2];
    }
    return _disView;
}

- (void)setDisViewButtonsNum:(int)num{
    [_disView recoverBotton];
    for (UIView *btn in _disView.btns) {
        [btn removeFromSuperview];
    }
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i< num; i++) {
        UIButton *btn = [UIButton new];
        NSString *name = [NSString stringWithFormat:@"menu%d",i];
        [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [marr addObject:btn];
        btn.tag = i;
        [btn addTarget:self action:@selector(buttonTagget:) forControlEvents:UIControlEventTouchUpInside];
    }
    _disView.btns = [marr copy];
}


-(void)buttonTagget:(UIButton *)sender{
    NSLog(@"%@",[NSString stringWithFormat:@"点击了第%ld个按钮",sender.tag+1]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_disView recoverBotton];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
