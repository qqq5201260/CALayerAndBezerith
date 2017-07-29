//
//  CAShapeLayerViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CAShapeLayerViewController.h"

@interface CAShapeLayerViewController ()

@end

@implementation CAShapeLayerViewController
{
    dispatch_source_t  _timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCance1];
    [self setCance2];
    
    [self setCance3];
    // Do any additional setup after loading the view.
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

- (void)setCance1{

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = nil;
//    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.lineWidth = 1;
//    layer.opacity = 0.5;
//    layer.position = self.view.center;
    layer.strokeEnd = 0.3;
    layer.path = path.CGPath;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.toValue = @(0);
    anim.toValue = @(2*M_PI);
    anim.duration = 0.4;
    anim.repeatCount = HUGE;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [layer addAnimation:anim forKey:anim.keyPath];
    
    [self.view.layer addSublayer:layer];
    
    
    
    

//    self.view.layer.mask = layer;
    
}

- (void)setCance2{
   CGPoint center = CGPointMake(100, 100);
    UIBezierPath *bezier = [UIBezierPath bezierPath];
 
    [bezier moveToPoint:CGPointMake(center.x+20, center.y)];
    [bezier addArcWithCenter:center radius:20 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [bezier moveToPoint:CGPointMake(center.x+40, center.y)];
    [bezier addArcWithCenter:center radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [bezier moveToPoint:CGPointMake(center.x+60, center.y)];
    [bezier addArcWithCenter:center radius:60 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [bezier moveToPoint:CGPointMake(center.x+80, center.y)];
    [bezier addArcWithCenter:center radius:80 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [bezier moveToPoint:CGPointMake(center.x+100, center.y)];
    [bezier addArcWithCenter:center radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.position = CGPointMake(200, 300);
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.fillColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.path = bezier.CGPath;
    layer.lineJoin = kCALineJoinBevel;
    layer.lineCap = kCALineCapButt;
    layer.lineDashPattern = @[@(6),@(10)];//虚线设置，为一个数组，数组中奇数位实线长度，偶数位带遍空白长度（注意：这里的奇数，偶数以数组的第一个元素索引为1计算）

    
    
    [self.view.layer addSublayer:layer];
    
    CALayer *animLayer = [CALayer layer];
    animLayer.bounds = CGRectMake(0, 0, 10, 10);
    animLayer.position = layer.position;
    animLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    key.duration = 15;
    key.repeatCount = HUGE;
    key.fillMode = kCAFillModeForwards;
    key.removedOnCompletion = NO;
    key.path = bezier.CGPath;
    key.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [animLayer addAnimation:key forKey:key.keyPath];
    [layer addSublayer:animLayer];
    
    

    
}

- (void)setCance3{

    UIBezierPath *paht = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 300, 100)  cornerRadius:10];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeStart = 0;
    layer.strokeEnd = 1;
    layer.fillColor = nil;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.lineDashPattern = @[@(10),@(10)];
    layer.lineDashPhase = 0;
    layer.bounds = CGRectMake(0, 0, 300, 100);
    layer.position = CGPointMake(200, 500);
    layer.path = paht.CGPath;

//    layer.zPosition = 999;
    [self.view.layer addSublayer:layer];
    //
    NSTimeInterval delayTime = 0.3f;
    //定时器间隔时间
    NSTimeInterval timeInterval = 0.1f;
    //创建子线程队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //使用之前创建的队列来创建计时器
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置延时执行时间，delayTime为要延时的秒数
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    //设置计时器
    dispatch_source_set_timer(_timer, startDelayTime, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        //执行事件
      dispatch_async(dispatch_get_main_queue(), ^{
          layer.lineDashPhase -= 5;
      });
    });
    // 启动计时器
    dispatch_resume(_timer);
    

}

@end
