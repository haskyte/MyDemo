//
//  ViewController.m
//  ZBartest
//
//  Created by wujianqiang on 15/11/6.
//  Copyright © 2015年 wujianqiang. All rights reserved.
//

#import "ViewController.h"
#import <ZBarSDK.h>
#import "WebViewController.h"
#import "MLInputDodger.h"

@interface ViewController ()<ZBarReaderDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPageControl

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action:(UIButton *)sender {
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    ZBarImageScanner *scanner = reader.scanner;
    reader.showsZBarControls = NO;
    
    
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    [self.navigationController pushViewController:reader animated:YES];
}
- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
 {

  NSLog(@"info=%@",info);
   // 得到条形码结果
    id<NSFastEnumeration> results =[info objectForKey: ZBarReaderControllerResults];
     ZBarSymbol *symbol = nil;
     for(symbol in results){
         NSLog(@"%@",symbol);
         NSLog(@"%@",symbol.data);
         WebViewController *webVC = [[WebViewController alloc] init];
         webVC.data = symbol.data;
         [self.navigationController pushViewController:webVC animated:YES];
     }
     
     
      // EXAMPLE: just grab the first barcode

//  UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"信息提示!" message:symbol.data delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alert show];
   // 将获得到条形码显示到我们的界面上
//    resultText.text = symbol.data;
//   NSLog(@"%@",symbol.data);
  // 扫描时的图片显示到我们的界面上
//   resultImage.image =[info objectForKey: UIImagePickerControllerOriginalImage];

   // 扫描界面退出
//    [reader dismissModalViewControllerAnimated: YES];
}
- (IBAction)turnScreen:(id)sender {
    
}

- (void)viewWillAppear:(BOOL)animated{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
}

- (void)viewWillDisappear:(BOOL)animated{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.view.shiftHeightAsDodgeViewForMLInputDodger = 44.0f+5.0f;
    [self.view registerAsDodgeViewForMLInputDodger];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
