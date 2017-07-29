//
//  CAKeyframeAnimationViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()

@end

@implementation CAKeyframeAnimationViewController
{

    CALayer *_aniLayer;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _aniLayer = [CALayer layer];
    _aniLayer.bounds = CGRectMake(0, 0, 30, 30);
    _aniLayer.position = self.view.center;
    _aniLayer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yezhi"]].CGColor;
    [self.view.layer addSublayer:_aniLayer];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(30, 30)];
    [bezier addLineToPoint:CGPointMake(30, 100)];
    [bezier addQuadCurveToPoint:CGPointMake(150, 200) controlPoint:CGPointMake(100, 140)];
    [bezier addCurveToPoint:CGPointMake(280, 260) controlPoint1:CGPointMake(150, 180)  controlPoint2:CGPointMake(90, 300)];
    [bezier addArcWithCenter:CGPointMake(100, 450) radius:60 startAngle:-M_PI_4 endAngle:M_PI clockwise:YES];
    [bezier addLineToPoint:CGPointMake(self.view.center.x, self.view.frame.size.height-15)];
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.path = bezier.CGPath;
    keyframe.duration = 10;
    keyframe.repeatCount = HUGE;
    
    [_aniLayer addAnimation:keyframe forKey:keyframe.keyPath];
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    basic.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(4*M_PI_4, M_PI_4, M_PI_4, M_PI_4)];
    basic.duration = 1;
    basic.repeatCount = HUGE;
//    basic.autoreverses = YES;
    [_aniLayer addAnimation:basic forKey:basic.keyPath];
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
