//
//  AnimatedTransitioningSubject.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/31.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "AnimatedTransitioningSubject.h"

@implementation AnimatedTransitioningSubject


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 1.0;
    
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
     __block CGRect rect = toView.frame;
    rect.origin.y = rect.size.height;
    toView.frame = rect;
    [containerView addSubview:toView];
  
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.alpha = 0.0;
        toView.alpha = 1.0;
        rect.origin.y = 0;
        toView.frame = rect;
        
    } completion:^(BOOL finished) {
        fromView.alpha = 1.0;
        [transitionContext completeTransition:YES];
        
    }];
    
}

@end
