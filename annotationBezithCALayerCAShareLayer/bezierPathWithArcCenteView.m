//
//  bezierPathWithArcCenteView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by MAC on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathWithArcCenteView.h"

@implementation bezierPathWithArcCenteView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    [path stroke];
}


@end
