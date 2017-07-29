//
//  CACustomerLayerViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/29.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CACustomerLayerViewController.h"
#import "UIView+animLayer.h"

@interface CACustomerLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *customView;

@end

@implementation CACustomerLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customView YSTransform_circleColor_toColor:[UIColor orangeColor] Duration:3.0 StartPoint:CGPointMake(0, 0)];
    
//    [self.customView YSTransForm_beginZoom_max:6.0 min:0.5];
//    [self.customView YSTransform_circleImage_toImage:[UIImage imageNamed:@"mp_dingwei"] Duration:6.0 StartPoint:CGPointMake(100, 100)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
