//
//  TestAttribute.m
//  MasnoryTest
//
//  Created by 李伟 on 17/2/9.
//  Copyright © 2017年 a. All rights reserved.
//

#import "TestAttribute.h"

@interface TestAttribute ()

@end

@implementation TestAttribute

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 200, 30)];
    label.textColor = [UIColor redColor];
    NSMutableAttributedString *stringM = [[NSMutableAttributedString alloc]initWithString:@"我在测试哈哈哈哈哈"];
   // [stringM addAttribute:<#(nonnull NSString *)#> value:<#(nonnull id)#> range:<#(NSRange)#>]
    
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
