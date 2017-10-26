//
//  ViewController.m
//  VsualFormat
//
//  Created by wujianqiang on 2017/2/9.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+VsualFormat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *backview = [[UIImageView alloc] init];
//    backview.clipsToBounds = true;
//    backview.contentMode = UIViewContentModeScaleToFill;
//    backview.image = [UIImage imageNamed:@"backimage"];
//    backview.backgroundColor = [UIColor redColor];
//    [self.view addSubview:backview];
//    
//    UIView *botView = [[UIView alloc] init];
//    botView.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:botView];
//    
//    
//    [self.view addConstrainsWithVisualFormat:@"H:|-10-[v0]-10-|" Views:@[backview]];
//    [self.view addConstrainsWithVisualFormat:@"V:|-10-[v0]-10-[v1(1)]-300-|" Views:@[backview,botView]];
//    [self.view addConstrainsWithVisualFormat:@"H:|[v0]|" Views:@[botView]];
//    
//    UIView *child1 = [[UIView alloc] init];
//    child1.translatesAutoresizingMaskIntoConstraints = false;
//    child1.backgroundColor = [UIColor blueColor];
//    [backview addSubview:child1];
//    
//    UIView *child2 = [[UIView alloc] init];
//    child2.translatesAutoresizingMaskIntoConstraints = false;
//    child2.backgroundColor = [UIColor blueColor];
//    [backview addSubview:child2];

    
    //1.添加两个控件
//    UIView *blueView = [[UIView alloc] init];
//    blueView.backgroundColor = [UIColor blueColor];
//    
//    blueView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:blueView];
//    
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:redView];
    
//    //2.添加约束
//    //2.1水平方向的约束
//    NSString *hVFL = @"H:|-30-[blueView]-30-[redView(==blueView)]-30-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:nil views:@{@"blueView":blueView, @"redView":redView}];
//    [self.view addConstraints:hCons];
//    
//    //2.2垂直方向的约束
//    NSString *vVFL = @"V:[blueView(50)]-30-|";
//    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView":blueView}];
//    [self.view addConstraints:vCons];
    
    
    //2.添加约束
    //2.1水平方向的约束
//    NSString *hVFL = @"H:|-30-[blueView]-30-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:@{@"blueView":blueView}];
//    [self.view addConstraints:hCons];
//    
//    //2.2垂直方向的约束
//    NSString *vVFL = @"V:|-30-[blueView(50)]-30-[redView(==blueView)]";
//    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"blueView":blueView, @"redView":redView}];
//    [self.view addConstraints:vCons];
//    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
//    NSLayoutConstraint *redLeftCon1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
//    [self.view addConstraint:redLeftCon];
//    [self.view addConstraint:redLeftCon1];
    

    
//    NSDictionary *views = @{@"v0":aView,@"v1":bView};//NSDictionaryOfVariableBindings(aView, bView, cView, dView);
    //NSDictionaryOfVariableBindings  宏  其实 NSDictionaryOfVariableBindings(v1, v2, v3) 等效于 [NSDictionary dictionaryWithObjectsAndKeys:v1, @"v1", v2, @"v2", v3, @"v3", nil];
//    [self.view addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=50)-[aView(100)]"
//                                             options:0
//                                             metrics:nil
//                                               views:views]];
//    
//    [self.view addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=100)-[aView(100)]"
//                                             options:0
//                                             metrics:nil
//                                               views:views]];
//    
//    [self.view addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[bView(==aView)]"
//                                             options:0
//                                             metrics:nil
//                                               views:views]];
//    [self.view addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bView(==aView)]"
//                                             options:0
//                                             metrics:nil
//                                               views:views]];
//    
//    [self.view addConstraint:
//     [NSLayoutConstraint constraintWithItem:bView
//                                  attribute:NSLayoutAttributeLeft
//                                  relatedBy:NSLayoutRelationEqual
//                                     toItem:aView
//                                  attribute:NSLayoutAttributeRight
//                                 multiplier:1
//                                   constant:10]];
//    //添加一个限制  等效于 bView.frame.origin.x  = (aView.frame.origin.x +aView.frame.size.width)  * 1  + 10,好像是这样的！个人觉得！
////    它是一种依赖关系，bView依赖aView，这样就算aView变了，bView也会跟着变换。
//    [self.view addConstraint:
//     [NSLayoutConstraint constraintWithItem:bView
//                                  attribute:NSLayoutAttributeTop
//                                  relatedBy:NSLayoutRelationEqual
//                                     toItem:aView
//                                  attribute:NSLayoutAttributeTop
//                                 multiplier:1
//                                   constant:0]];
    
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[v0]-0-[v1(==v0)]|"
//                                             options:0
//                                             metrics:nil
//                                               views:views]];
    
    
    // 对角设置两个方块
//    [self twosquare];
    
    // 相对布局
    [self setContrans];
}

- (void)twosquare{
    UIView *aView = [[UIView alloc] init];
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    
    UIView *bView = [[UIView alloc] init];
    bView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bView];
    
    [self.view addConstrainsWithVisualFormat:@"H:|[v0]-0-[v1(==v0)]|" Views:@[aView,bView]];
    [self.view addConstrainsWithVisualFormat:@"V:|[v1(==v0)]-0-[v0]|" Views:@[aView,bView]];
}

- (void)setContrans{
    UIView *aView = [[UIView alloc] init];
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    
    UIView *bView = [[UIView alloc] init];
    bView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bView];

    UIView *cView = [[UIView alloc] init];
    cView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:cView];
    
    [self.view addConstrainsWithVisualFormat:@"H:|[v0]-0-[v1(==v0)]|" Views:@[aView,bView]];
    [self.view addConstrainsWithVisualFormat:@"V:|[v0]" Views:@[aView]];
    [self.view addConstrainsWithVisualFormat:@"H:|[v0(==v1)]" Views:@[cView,aView]];
    [self.view addConstrainsWithVisualFormat:@"V:[v0(==v1)]|" Views:@[cView,aView]];
    
    [self.view addConstraintWithSetView:aView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                                 toItem:self.view
                              attribute:NSLayoutAttributeHeight
                             multiplier:1/3.f
                               constant:0];
    [self.view addConstraintWithSetView:bView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                                 toItem:aView
                              attribute:NSLayoutAttributeTop
                             multiplier:1
                               constant:0];
    [self.view addConstraintWithSetView:bView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                                 toItem:aView
                              attribute:NSLayoutAttributeBottom
                             multiplier:2
                               constant:0];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
