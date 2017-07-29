//
//  CALayerViewController.m
//  annotationBezithCALayerCAShareLayer
//http://www.jianshu.com/p/98ff8012362a  参考
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setCance{

    
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = CGPointMake(200, 200);
    layer.zPosition = 100.0;
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.transform = CATransform3DMakeTranslation(0.5, 0, 1);
    layer.hidden = NO;
//    layer.doubleSided = NO;
//    layer.contents = []
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 50;
    layer.masksToBounds = YES;
    layer.borderWidth = 10;
    layer.borderColor = [UIColor greenColor].CGColor;
    layer.opacity = 0.8;
    layer.shadowColor = [UIColor blueColor].CGColor;
    layer.shadowOpacity = 0.6;
    layer.shadowOffset =CGSizeMake(20, 20);
    
    [self.view.layer addSublayer:layer];
    
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
