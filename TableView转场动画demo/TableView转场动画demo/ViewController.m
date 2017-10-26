//
//  ViewController.m
//  TableView转场动画demo
//
//  Created by wujianqiang on 16/8/31.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "ImageTableViewCell.h"
#import "PushAnimate.h"
#import "SecondViewController.h"

@interface ViewController ()<UITabBarDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) PushAnimate *pushAnimate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.dataArray = @[@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x",@"backimage@2x"];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.photoImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
    CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
    CGRect oldrect = CGRectMake(rect.origin.x + 10, rect.origin.y+10, 40, 80);
//    NSLog(@"%f      %f      %f     %f ",oldrect.origin.x,oldrect.origin.y,oldrect.size.width,oldrect.size.height);
    
    self.pushAnimate = [[PushAnimate alloc] initWithImage:self.dataArray[indexPath.row] OldRect:oldrect];
    
    
    secondVC.newRect = oldrect;
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

#pragma mark - 动画代理
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[SecondViewController class]]) {

        return self.pushAnimate;
    }else{
        return nil;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    // 关闭手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    }

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    // 激活手势
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}




@end
