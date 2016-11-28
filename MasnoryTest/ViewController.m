//
//  ViewController.m
//  MasnoryTest
//
//  Created by 李伟 on 15/12/8.
//  Copyright (c) 2015年 a. All rights reserved.
//

#import "ViewController.h"

#import "UIView+HKSetConstraints.h"

#import "Cell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  表格视图
 */
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor yellowColor];
    
    [_tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
    


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIView *view =[[UIView alloc]init];
    
    view.backgroundColor =[ UIColor greenColor];
    
    cell.selectedBackgroundView = view;
    return cell;



}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"选中%d",indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];


}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{


    NSLog(@"反选%d",indexPath.row);

}
//-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"高亮选中%d",indexPath.row);
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    UIView *myView = [[UIView alloc] init];
//    myView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:myView];
//    
//    [myView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 设置当前center和父视图的center一样
//        make.center.mas_equalTo(self.view);
//        // 设置当前视图的大小
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//        NSLog(@"%f",myView.frame.size.width);
//    }];
//    
//    
//    //设置视图并排
//    UIView *view1 = [[UIView alloc] init];
//    view1.backgroundColor = [UIColor redColor];
//    [myView addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor yellowColor];
//
//    [myView addSubview:view2];
//    
//    
//    UIView *view3 = [[UIView alloc] init];
//    view3.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:view3];
//    
//    int padding = 10;
//    
////    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
////        // 设置其位于父视图的Y的中心位置
////       // make.centerY.mas_equalTo(myView.mas_centerY);
////        // 设置其左侧和父视图偏移10个像素
////        make.left.equalTo(myView).with.offset(padding);
////        // 设置其右侧和view2偏移10个像素
////        make.right.equalTo(view2.mas_left).with.offset(-padding);
////        // 设置高度
////        make.height.mas_equalTo(@120);
////        // 设置其宽度
////        make.width.equalTo(view2);
////    }];
//    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        //设置位于父视图Y的位置
//        make.centerY.mas_equalTo(myView.mas_centerY);
//        // 设置其左侧和父视图偏移10个像素
//        make.left.mas_equalTo(myView).with.offset(padding);
//        //距离view2 的间距
//        make.right.mas_equalTo(view2.mas_left).with.offset(-padding);
//        //??自动算
//        make.width.mas_equalTo(@[view2,view3]);
//        make.height.mas_equalTo(120);
//        
//    }];
//    
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(myView.mas_centerY);
//        //已经设置距离view2右面的距离
//       // make.left.mas_equalTo(view1.mas_right).with.offset(padding);
//        //make.right.mas_equalTo(myView).with.offset(-padding);
//        make.width.mas_equalTo(@[view1,view3]);
//        make.height.mas_equalTo(view1);
//        
//        
//    }];
//    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.centerY.mas_equalTo(myView.mas_centerY);
//        make.right.mas_equalTo(myView).with.offset(-padding);
//        make.left.mas_equalTo(view2.mas_right).with.offset(padding);
//        make.width.mas_equalTo(@[view2,view1]);
//        make.height.mas_equalTo(view1);
//        
//    }];
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
//    [btn setTitle:@"ss" forState:UIControlStateNormal];
//    [myView addSubview:btn];
//    
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(myView).with.offset(padding * 20);
//        make.left.mas_equalTo(myView).with.offset(padding);
//        make.width.mas_equalTo(view1);
//        make.height.mas_equalTo(30);
//        
//    }];
//}

@end
