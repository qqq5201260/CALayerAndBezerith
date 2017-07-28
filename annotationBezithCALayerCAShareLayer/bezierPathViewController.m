//
//  bezierPathViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "bezierPathViewController.h"
#import "bezierPathView.h"

@interface bezierPathViewController ()

@property(nonatomic) CGLineCap lineCapStyle;  //端点类型
@property(nonatomic) CGLineJoin lineJoinStyle;  //线条连接类型

@property (weak, nonatomic) IBOutlet bezierPathView *canveView;

@property (nonatomic,strong) UIBezierPath *bezierPath;

@end

@implementation bezierPathViewController

/*
 @property(nonatomic) CGFloat lineWidth;  //边框宽度

 @property(nonatomic) CGFloat miterLimit;  //线条最大宽度最大限制
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (UIBezierPath *)bezierPath{

    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
        _bezierPath.lineWidth = 10;
        _bezierPath.miterLimit = 15;
        
        
    }
    return _bezierPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lineCapType:(UISegmentedControl *)sender {
    self.bezierPath.lineCapStyle = sender.selectedSegmentIndex;
}

- (IBAction)lineJoinStyleType:(UISegmentedControl *)sender {
    
    self.bezierPath.lineJoinStyle = sender.selectedSegmentIndex;
}

- (IBAction)start:(id)sender {
    
    self.canveView.bezierPath = self.bezierPath;
    [self.canveView drawRect:self.canveView.frame];

}

- (IBAction)clear:(UIButton *)sender {
    [self.canveView clear];
}


@end
