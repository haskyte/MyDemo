//
//  ViewController.m
//  webViewTest
//
//  Created by wujianqiang on 15/10/15.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    NSString *string = @"<div>有意投资移民澳大利亚的您，还在为选择投资项目而烦恼吗？还在考虑投资回报的问题吗？来，让奥烨小编为您推荐墨尔本最具投资价值的项目---爱平酒店式公寓！<br /></div><div style=\"text-align:center;\"><img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211J6303S.jpg\" style=\"width:679px;height:272px;\" /><br /></div><div>爱平项目位于墨尔本北部的中心地带，而其中的“北角商业区及工业园”更是一流的商业和工业园区。现时，该项目的1期和2期已经完成，3期、4期和5期（最后一块）为可用地块。可用地块地理位置好，位于已存在的开发区中，为您提供了加入“北角商业区及工业园”（North Point EnterprisePark）的绝佳机会，成为稳固的金牌租户。我们高品质的商业园区提供了灵活的土地面积，从3374平方米开始。商业区最后一块开发地，面积达到1万平方米，将建设4星级或以上的国际品牌酒店公寓，商业价值潜力无限！<strong>投资回报高达40%以上</strong>。<br /></div>    <div style=\"text-align:center;\">    <img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211JFJY.jpg\" style=\"width:800px;height:401px;\" />    </div>    <div>    </div>    <div>    <div>    <strong>项目优势</strong>    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>该酒店项目开发预计占地近1万平方米    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>库珀大街（Copper St）主干道上最后一块商业开发用地    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>位于“北角商业及工业园区”（North Point Enterprise Park）内最佳位置    </div>    <div>    • 项目对面即“墨尔本北部医院”（Northern Hospital）和“爱平购物广场”（Epping Plaza)    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>项目正对即将在2015年8月3日开业的全新的“墨尔本水果蔬菜批发市场”    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>项目所在区域汇集人流超过75万人次    </div>    <div>• <span class=\"Apple-tab-span\"> </span>候选酒店房间管理公司：希尔顿逸林酒店集团    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>候选酒店式公寓管理公司：澳洲雅高酒店集团旗下美居原住酒店公司    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>两家候选酒店管理公司均预测未来三年总营业利润为$500万澳币    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>两家候选酒店销售中介地产公司：世邦魏理仕（CBRE）和仲量联行（JLL）    </div>    <div>    • <span class=\"Apple-tab-span\"> </span>酒店设计由国际著名酒店和度假村建筑设计师Peddle Thorp亲自操刀    </div>    </div>    <div>    </div>    <div style=\"text-align:center;\">    <img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211JQ4623.jpg\" style=\"width:677px;height:479px;\" />    </div>    <div>    <br />    <strong> 项目亮点</strong>    </div>    <div>    • 土地面积约为9468平方米    </div>    <div>    • 4星级或以上国际品牌酒店公寓    </div>    <div>    • 投资保本升值，投资移民首选    </div>    <div>    </div>    <div>    </div>    <div>    <strong>公寓酒店特色</strong>    </div>    <div>    房间数量: 150间    </div>    <div>    酒店公寓: 36间    </div>    <div>    其他设施: 咖啡厅，餐厅，大堂：100个座位    </div>    <div>    董事会风格大型会议室：4个    </div>    <div>    多功能大厅：2个（120个座位）    </div>    <div>    停车位：141个<br />    </div>    <div style=\"text-align:center;\">    <img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211JSI40.jpg\" style=\"width:800px;height:334px;\" />    </div>    <div>    </div>    <div>    <strong>酒店管理</strong>    </div>    <div>    在选取酒店时考虑到与项目链接的实际意义，我们在多个具有实力的酒店品牌中作了筛选，最终选择了希尔顿酒店集团和雅高酒店旗下的最具代表性的逸林酒店、美居酒店和原住酒店作为该项目的运营管理方。    </div>    <div style=\"text-align:center;\">    <img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211K000628.jpg\" style=\"width:800px;height:540px;\" /><br />    <br /><img alt=\"\" src=\"http://www.aoye.com/uploads/1505/3-1505211JZ5N5.jpg\" style=\"width:800px;height:442px;\" /> </div>";
    
    NSString *str = [string stringByReplacingOccurrencesOfString:@"<img" withString:@"<img width=\"100%%\""];
    [_webView setScalesPageToFit:YES];
    [self.webView loadHTMLString:str baseURL:nil];
    
//    [_webView loadHTMLString:string baseURL:[NSURL URLWithString:@"http://192.168.1.115:8080/tmcs/app/crowdfundingContent.do?pid=2015HZIysyg4M4"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
