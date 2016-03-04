//
//  FirstViewController.m
//  repeatCount
//
//  Created by wujianqiang on 16/1/11.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic) int count;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  zhushi
 *
 *  @param sender <#sender description#>
 */

- (IBAction)buttonaction:(id)sender {
    _count = 1;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addAct) userInfo:nil repeats:YES];
}

/**
 *  <#Description#>
 */

- (void)addAct{
    self.countLabel.text = [NSString stringWithFormat:@"%d",_count ++];
    NSLog(@"%@",self.countLabel.text);
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
