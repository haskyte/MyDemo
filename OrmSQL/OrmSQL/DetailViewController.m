//
//  DetailViewController.m
//  OrmSQL
//
//  Created by wujianqiang on 15/11/13.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "DetailViewController.h"
#import "ModelManager.h"
#import "Model.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 点击查询按钮查询所有model
- (IBAction)selectModels:(UIButton *)sender {
    _dataArray = [[ModelManager getManager] selectModels];
    [_dataArray enumerateObjectsUsingBlock:^(Model * model, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"mid = %@  title = %@ ",model.mid,model.title);
    }];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    Model *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.mid;
    cell.detailTextLabel.text = model.title;
    return cell;
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
