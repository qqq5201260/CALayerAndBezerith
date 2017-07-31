//
//  MainTableViewController.m
//  annotationBezithCALayerCAShareLayer
//
//  Created by czl on 2017/7/28.
//  Copyright © 2017年 chinapke. All rights reserved.
//
/*
 opacity 透明度
 backgroundColor 背景颜色
 cornerRadius 圆角
 borderWidth 边框宽度
 contents 内容
 shadowColor 阴影颜色
 shadowOffset 阴影偏移量
 shadowOpacity 阴影透明度
 shadowRadius 阴影圆角
 ...
 rotation 旋转
 transform.rotation.x
 transform.rotation.y
 transform.rotation.z
 ...
 scale 缩放
 transform.scale.x
 transform.scale.y
 transform.scale.z
 ...
 translation 平移
 transform.translation.x
 transform.translation.y
 transform.translation.z
 ...
 position 位置
 position.x
 position.y
 ...
 bounds
 bounds.size
 bounds.size.width
 bounds.size.height
 bounds.origin
 bounds.origin.x
 bounds.origin.y
 */
#import "MainTableViewController.h"
#import "AnimatedTransitioningSubject.h"


@interface MainTableViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation MainTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"title"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section][@"array"];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray *array = self.dataArray[indexPath.section][@"array"];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"title"];
    header.textLabel.text = self.dataArray[section][@"title"];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.dataArray[indexPath.section][@"array"];
    UIViewController *vc = [[UIStoryboard storyboardWithName:self.dataArray[indexPath.section][@"title"] bundle:nil] instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"%@ViewController",array[indexPath.row]]];
    self.navigationController.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    return [AnimatedTransitioningSubject new];

}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{

    return [AnimatedTransitioningSubject new];
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{

   return [AnimatedTransitioningSubject new];
    
}

- (NSArray *)dataArray{
   
    return @[@{@"title":@"bezierPath",@"array":@[@"bezierPath",@"bezierPathWithRect",@"bezierPathWithOvalInRect",@"bezierPathWithRoundedRect",@"bezierPathWithArcCenter",@"bezierPathWithCGPath"]},@{@"title":@"layer",@"array":@[@"CALayer",@"CAShapeLayer",@"CACustomerLayer",@"CAGradientLayer",@"CAEmitterLayer"]},@{@"title":@"coreAnimation",@"array":@[@"CABasicAnimation",@"CAKeyframeAnimation",@"CASpringAnimation",@"CATransaction"]}];
}

@end
