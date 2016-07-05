//
//  ScanQRCodeImageController.m
//  ORCodeDemo
//
//  Created by tztddong on 16/7/5.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ScanQRCodeImageController.h"
#import "QRCodeManger.h"
#import "ShowViewController.h"

@interface ScanQRCodeImageController ()
@property (weak, nonatomic) IBOutlet UIView *scanView;
@property (weak, nonatomic) IBOutlet UIImageView *boardImage;
@property(nonatomic,weak)UIImageView *scanImageView;;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ScanQRCodeImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.scanView layoutIfNeeded];
    // 加载图片
    UIImage *image = [UIImage imageNamed:@"qrcode_border"];
    // 设置端盖的值
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    // 设置端盖的值
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    // 设置拉伸的模式
    UIImageResizingMode mode = UIImageResizingModeStretch;
    // 拉伸图片
    UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
    self.boardImage.image = newImage;
    
    UIImageView *scanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scanView.frame), 0)];
    scanImageView.image = [UIImage imageNamed:@"qrcode_back"];
    [self.scanView addSubview:scanImageView];
    self.scanImageView = scanImageView;
    
    [self update];
    [self scanStart];
}

- (void)update{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.scanImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.scanView.frame), CGRectGetHeight(self.scanView.frame));
    } completion:^(BOOL finished) {
        self.scanImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.scanView.frame), 0);
        [self update];
    }];
}

- (void)scanStart{
    
    [[QRCodeManger shareInstance] startScanQRCodeImageWithBackView:self.view scanView:self.scanView scanSuccessBlock:^(NSArray *resultData) {
        NSLog(@"正在处理");
        NSLog(@"%@",resultData);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ShowViewController *showCtrl = [[ShowViewController alloc]init];
            showCtrl.result = resultData;
            [self.navigationController pushViewController:showCtrl animated:YES];
        });
    }];
}

@end
