//
//  GetORImageController.m
//  ORCodeDemo
//
//  Created by tztddong on 16/7/5.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "GetORImageController.h"
#import "QRCodeManger.h"

@interface GetORImageController ()
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UIImageView *ORImage;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation GetORImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getImage:(id)sender {
    
    NSString *text = self.text.text;
    UIImage *logoImage = [UIImage imageNamed:@"logobaby"];
    self.ORImage.image = [[QRCodeManger shareInstance] getQRCodeImageWithImputMessage:text logoImage:logoImage];
    if (self.ORImage.image) {
        self.saveBtn.enabled = YES;
    }
}
- (IBAction)saveImage:(id)sender {
    
    UIImageWriteToSavedPhotosAlbum(self.ORImage.image, nil, nil, NULL);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
