//
//  SecondViewController.m
//  TableView转场动画demo
//
//  Created by wujianqiang on 16/8/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "PopAnimate.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.hidden = NO;

    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    _imageView.image = [UIImage imageNamed:@"backimage"];
    [self.view addSubview:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏控制器动画代理
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if ([toVC isKindOfClass:[ViewController class]]) {
        PopAnimate *transition = [[PopAnimate alloc] initWithImage:@"backimage" newRect:self.newRect];
        return transition;
    }else{
        return nil;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    self.navigationController.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;

    self.imageView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
