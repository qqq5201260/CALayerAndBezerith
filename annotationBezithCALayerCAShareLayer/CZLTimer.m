//
//  CZLTimer.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/29.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "CZLTimer.h"

@interface CZLTimer ()

@property (nonatomic) dispatch_source_t timer;

@end

@implementation CZLTimer

-(instancetype)init{

    if (self = [super init]) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    }
    return self;
}

+ (CZLTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(CZLTimer *timer))block{

    CZLTimer *czl = [CZLTimer new];
    
    dispatch_source_set_timer(czl.timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, interval * NSEC_PER_SEC);
    dispatch_source_set_event_handler(czl.timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            block(czl);
        });
    });
    
    
    return czl;
}

- (void)fire{
    
     dispatch_resume(self.timer);

}

- (void)invalidate{

    dispatch_source_cancel(self.timer);
}

@end
