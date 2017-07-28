//
//  bezierPathWithCGPathView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by MAC on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathWithCGPathView.h"

@implementation bezierPathWithCGPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    //创建一个pathReg

    CGMutablePathRef paths = CGPathCreateMutable();
    
    CGPathMoveToPoint(paths, NULL, 200, 200);

    CGPathAddLineToPoint(paths, NULL, 250, 250);
    CGPathAddLineToPoint(paths, NULL, 280, 290);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:paths];
    [[UIColor redColor]set];
    [path stroke];
    
}


@end
