

//
//  bezierPathWithOvalInRectView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by MAC on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathWithOvalInRectView.h"

@implementation bezierPathWithOvalInRectView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *Rectpath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 120, 120)];
    [[UIColor blueColor]set];
    [Rectpath stroke];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 120, 120)];
    [[UIColor redColor]set];
    [path stroke];
    
    
    // Drawing code
}

@end
