//
//  ShowViewController.m
//  ORCodeDemo
//
//  Created by tztddong on 16/7/5.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ShowViewController.h"
#import "UIViewController+BackButtonHandler.h"
#import "ViewController.h"


@interface ShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *text = @"";
    for (NSString *string in self.result) {
        if (string.length) {
           text = [text stringByAppendingString:string];
        }
    }
    self.text.text = text;
}

- (BOOL)navigationShouldPopOnBackButton
{
    for (id viewCtrl in self.navigationController.viewControllers) {
        if ([viewCtrl isKindOfClass:[ViewController class]]) {//你想返回的控制器
            [self.navigationController popToViewController:viewCtrl animated:YES];
        }
    }
    return NO;
}

@end
