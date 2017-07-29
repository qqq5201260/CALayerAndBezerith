//
//  CZLTimer.h
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/29.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZLTimer : NSObject

+ (CZLTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(CZLTimer *timer))block;

- (void)fire;

- (void)invalidate;

@end
