//
//  bezierPathWithRectView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathWithRectView.h"

@implementation bezierPathWithRectView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
    [[UIColor redColor]set];
    [bezier stroke];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(10, 10);
    layer.bounds = CGRectMake(0, 0, 5, 5);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    [self.layer addSublayer:layer];
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.path = bezier.CGPath;
    keyframe.duration = 5;
    keyframe.repeatCount = HUGE;
    
    [layer addAnimation:keyframe forKey:@"keyframe"];
}


@end
