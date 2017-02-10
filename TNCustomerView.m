//
//  TNCustomerView.m
//  MasnoryTest
//
//  Created by 李伟 on 17/2/9.
//  Copyright © 2017年 a. All rights reserved.
//
#import "TNPickView.h"
#import "TNCustomerView.h"

@interface TNCustomerView ()

@end

@implementation TNCustomerView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TNPickView *picker = [[TNPickView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) WithBlock:^(NSString *money) {
        NSLog(@"block %@",money);
    } tnPeriodBlock:^(NSString *period) {
        NSLog(@"block%@",period);
    }];
//    picker.tnMoneyBlock = ^(NSString *money){
//        NSLog(@"block:%@",money);
//    };
//    picker.tnPeriodBlock = ^(NSString *period){
//        NSLog(@"block%@",period);
//    };
    [self.view addSubview:picker];
    
}
-(void)tnPickView:(TNPickView *)pick didSelectMoney:(NSString *)money withPeriod:(NSString *)period{

    NSLog(@"选择钱数%@====选择分期数%@",money,period);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
