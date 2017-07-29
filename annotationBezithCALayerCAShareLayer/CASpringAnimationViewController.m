//
//  CASpringAnimationViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CASpringAnimationViewController.h"

@interface CASpringAnimationViewController ()


@end

@implementation CASpringAnimationViewController
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
    
    CASpringAnimation *basic = [CASpringAnimation animationWithKeyPath:@"position"];
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    basic.duration = 1;
    basic.repeatCount = 1;
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
