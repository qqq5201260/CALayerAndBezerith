//
//  bezierPathWithRoundedRectView.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by MAC on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathWithRoundedRectView.h"


@implementation bezierPathWithRoundedRectView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect rect1 =  CGRectMake(10, 10, 100, 100);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect1 cornerRadius:50];
    [[UIColor redColor]set];
    [path stroke];
    
    CGRect rect2 =  CGRectMake(120, 130, 100, 100);
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect2 byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(100, 100)];
//    [[UIColor redColor]set];
    [path1 stroke];
    
}


@end
