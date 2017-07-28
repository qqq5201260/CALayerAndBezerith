//
//  bezierPathView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathView.h"

@implementation bezierPathView
{

    NSInteger count;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self.bezierPath moveToPoint:CGPointZero];
    [self.bezierPath addLineToPoint:CGPointMake(0, 100)];
    [self.bezierPath addQuadCurveToPoint:CGPointMake(100, 200) controlPoint:CGPointMake(150, 170)];
    [self.bezierPath addArcWithCenter:CGPointMake(100, 200) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [self.bezierPath addCurveToPoint:CGPointMake(200, 300) controlPoint1:CGPointMake(250, 250) controlPoint2:CGPointMake(280, 270)];
   
    [[UIColor redColor]set];
    [self.bezierPath stroke];
//    [self.bezierPath fill];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.bounds = CGRectMake(10, 10, 10, 10);
    layer.position = CGPointMake(10, 10);
    layer.shadowPath = self.bezierPath.CGPath;
    layer.cornerRadius = 10;
    [self.layer addSublayer:layer];
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.path = self.bezierPath.CGPath;
    keyframe.repeatCount = HUGE;
    keyframe.duration = 10;
    
    [layer addAnimation:keyframe forKey:@"keyframe"];
}

- (UIBezierPath *)bezierPath{
    
    if (!_bezierPath) {
        
        _bezierPath = [UIBezierPath bezierPath];
        _bezierPath.lineWidth = 10;
        _bezierPath.miterLimit = 5;
        
    }
    return _bezierPath;
}


- (void)clear{

    [self.bezierPath removeAllPoints];
}

@end
