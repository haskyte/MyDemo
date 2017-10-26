//
//  RootViewController.m
//  tabbar
//
//  Created by wujianqiang on 2017/7/19.
//  Copyright © 2017年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "PresentViewController.h"
@interface RootViewController ()<UITabBarDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    if ([item.title isEqualToString:@"我的"]) {
//        self.tabBarController.selectedIndex = 0;
//        
//        
//    }
//    
//}
//
//- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items{
//    NSLog(@"123123");
//}
//
//
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//
////    if (tabBarController.selectedIndex == 2) {
////    }
////    
//}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    BOOL result;
    if (viewController == [tabBarController.viewControllers objectAtIndex:2]) //assuming the index of uinavigationcontroller is 2
    {
        PresentViewController *presetnVC = [[PresentViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:presetnVC];
        [self presentViewController:nav animated:YES completion:nil];
        presetnVC.Completion = ^{
            tabBarController.selectedIndex = 2;
        };
        
        
        result = NO;
    }
    else {
        result = YES;
    }
    return result;
}



@end
