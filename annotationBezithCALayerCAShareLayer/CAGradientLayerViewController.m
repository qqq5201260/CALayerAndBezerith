//
//  CAGradientLayerViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/29.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CAGradientLayerViewController.h"
#import "CZLTimer.h"

@interface CAGradientLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *canceView;

@end

@implementation CAGradientLayerViewController
{
    CZLTimer *timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self cance1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cance1{

    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.bounds = self.canceView.bounds;
    layer.position = CGPointMake(CGRectGetMidX(self.canceView.bounds), CGRectGetMidY(self.canceView.bounds));
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
//    layer.locations = @[@(0.1),@(0.3),@(0.8),@(1.0)];
    layer.startPoint = CGPointMake(0, 0.5);
    layer.endPoint = CGPointMake(1, 0.5);
//    layer.backgroundColor = [UIColor redColor].CGColor;
    
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.canceView.bounds), CGRectGetMidY(self.canceView.bounds)) radius:CGRectGetWidth(self.canceView.bounds)*0.5-50
                                            startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    shape.lineWidth = 10;
    shape.strokeColor = [UIColor orangeColor].CGColor;
    shape.fillColor = nil;
    shape.strokeStart = 0;
    shape.strokeEnd = 0;
    layer.mask = shape;
    
    
    timer = [CZLTimer timerWithTimeInterval:0.1 repeats:YES block:^(CZLTimer *timer) {
        shape.strokeEnd += 0.1;
        if (shape.strokeEnd>1.1) {
            shape.strokeEnd = 0;
        }
        
    }];
    [timer fire];
    
    [self.canceView.layer addSublayer:layer];
    
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
