//
//  CABasicAnimationViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

 /*
 opacity 透明度
 backgroundColor 背景颜色
 cornerRadius 圆角
 borderWidth 边框宽度
 contents 内容
 shadowColor 阴影颜色
 shadowOffset 阴影偏移量
 shadowOpacity 阴影透明度
 shadowRadius 阴影圆角
 ...
 rotation 旋转
 transform.rotation.x
 transform.rotation.y
 transform.rotation.z
 ...
 scale 缩放
 transform.scale.x
 transform.scale.y
 transform.scale.z
 ...
 translation 平移
 transform.translation.x
 transform.translation.y
 transform.translation.z
 ...
 position 位置
 position.x
 position.y
 ...
 bounds
 bounds.size
 bounds.size.width
 bounds.size.height
 bounds.origin
 bounds.origin.x
 bounds.origin.y
 
 
 作者：七月上
 链接：http://www.cocoachina.com/ios/20170623/19612.html
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *canceView;

@end

@implementation CABasicAnimationViewController
{
    CADisplayLink *_displayLink;
    CALayer *_aniLayer;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)position:(id)sender {
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    basic.duration = 2.0;
    basic.repeatCount = 2;
//    basic.removedOnCompletion = YES;
    basic.timeOffset = 1.0;
    basic.speed = 2;
    basic.autoreverses = YES;
    basic.delegate = self;
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.canceView.layer addAnimation:basic forKey:basic.keyPath];
}
- (IBAction)scale:(id)sender {
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basic.toValue = [NSValue valueWithCGSize:CGSizeMake(3, 3)];
    basic.duration = 2.0;
    basic.repeatCount = 2;
//    basic.removedOnCompletion = YES;
//    basic.fillMode = kCAFillModeForwards;
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.canceView.layer addAnimation:basic forKey:basic.keyPath];
}
- (IBAction)rotate:(id)sender {
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basic.toValue = @(2*M_PI);
    basic.duration = 2.0;
    basic.repeatCount = 1;
//    basic.removedOnCompletion = YES;
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.canceView.layer addAnimation:basic forKey:basic.keyPath];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
  
    
}
- (IBAction)D3:(id)sender {
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    basic.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 2*M_PI_4, M_PI_4, M_PI_4)];
    basic.duration = 2.0;
    basic.repeatCount = 1;
    //    basic.removedOnCompletion = YES;
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.canceView.layer addAnimation:basic forKey:basic.keyPath];
    
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
