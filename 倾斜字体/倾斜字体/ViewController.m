//
//  ViewController.m
//  倾斜字体
//
//  Created by wujianqiang on 16/1/13.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100,100, 1024, 768)];
    label.text = @"舒服过水电费告诉对方告诉对方公司的风格";
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],NSForegroundColorAttributeName: [UIColor blackColor] };
    
    
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [label.text substringWithRange:NSMakeRange(7, label.text.length - 4 - 3)] attributes: attrDict3];
    

    NSMutableAttributedString *attributedStr03 = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr3];
    label.attributedText = attributedStr03;
    [self.view addSubview:label];
    
}


//- (NSMutableAttributedString *)spaceOfLabeltext:(NSString *)string font:(CGFloat)font{
//    if (string.length != 0) {
//        NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],NSForegroundColorAttributeName: [UIColor blackColor] };
//        NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: string];
//        
////        NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:NSObliquenessAttributeName];
////        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
////        paragraph.lineSpacing = font;
////        [attributed addAttribute:NSParagraphStyleAttributeName value:nil range:NSMakeRange(0, string.length)];
////        return attributed;
//    }else{
//        return nil;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
