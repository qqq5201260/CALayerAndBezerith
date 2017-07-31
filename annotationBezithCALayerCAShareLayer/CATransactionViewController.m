//
//  CATransactionViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CATransactionViewController.h"

@interface CATransactionViewController ()<CAAnimationDelegate>

@end

@implementation CATransactionViewController
{

    CALayer *_aniLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _aniLayer = [CALayer layer];
    _aniLayer.bounds = CGRectMake(0, 0, 100, 100);
    _aniLayer.position = self.view.center;
//    _aniLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_aniLayer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint p = [[touches anyObject] locationInView:self.view];
    [self updateLayer:p];
    [self transitionAnimation];
    
    
}

- (void)updateLayer:(CGPoint)point{

    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
    basic.toValue = [NSValue valueWithCGPoint:point];
    basic.duration = arc4random()%100*0.1;
    basic.delegate = self;
    [basic setValue:[NSValue valueWithCGPoint:point] forKey:@"positionToEnd"];
    [_aniLayer addAnimation:basic forKey:basic.keyPath];
    
}

- (void)transitionAnimation{

    CATransition *transition = [CATransition animation];
    /*
     效果
     http://www.cocoachina.com/ios/20170623/19612.html
     系统 kCATransitionFade  ->fade
         kCATransitionMoveIn ->movein
         kCATransitionPush ->push
         kCATransitionReveal ->reveal
         cube   立方体旋转效果
         oglFlip 翻转效果
         pageCurl 向上翻页效果
         pageUnCurl 向下翻页效果
         suckEffect 收缩效果
         rippleEffect 水滴波纹效果
         cameralIrisHollowOpen 摄像头打开效果
         cameralIrisHollowClose 摄像头关闭效果
     
     */
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.0;
    
    
//    _aniLayer.backgroundColor = [UIColor colorWithWhite:arc4random_uniform(256)/256.0 alpha:1.0].CGColor;
    _aniLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:[NSString stringWithFormat:@"%d",arc4random_uniform(4)+1]].CGImage);
    
    [_aniLayer addAnimation:transition forKey:transition.type];
}

- (void)animationDidStart:(CAAnimation *)anim{


}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //开始事务
    [CATransaction begin];
    //关闭隐式动画
    [CATransaction setDisableActions:YES];
    _aniLayer.position = [[anim valueForKey:@"positionToEnd"] CGPointValue];
    //提交事务
    [CATransaction commit];
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
