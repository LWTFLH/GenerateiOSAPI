//
//  TNPickView.m
//  MasnoryTest
//
//  Created by 李伟 on 17/2/9.
//  Copyright © 2017年 a. All rights reserved.
//

#import "TNPickView.h"
@interface TNPickView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIPickerView *pick;
@property(nonatomic,strong)NSArray *moneys;
@property(nonatomic,strong)NSArray *months;
/**
 *  用户选择的金钱
 */
@property(nonatomic,copy)NSString*userMoney;
/**
 *  用户选择的分期数
 */
@property(nonatomic,copy)NSString*userPeriod;
@end
@implementation TNPickView
-(NSArray *)moneys{
    if (!_moneys) {
        _moneys = [NSArray arrayWithObjects:@"1000元",@"1500元",@"2000元",@"3000元",@"4000元",@"5000元", nil];
    }
    return _moneys;
}
-(NSArray *)months{
    if (!_months) {
        _months = [NSArray arrayWithObjects:@"一个月",@"两个月",@"三个月", nil];
    }
    return _months;
}

-(instancetype)initWithFrame:(CGRect)frame WithBlock:(void (^)(NSString *))money tnPeriodBlock:(void(^)(NSString *))period{

    self = [super initWithFrame:frame];
    if (self) {
        self.tnMoneyBlock  = [money copy];
        self.tnPeriodBlock = [period copy];
        [self initUI];
    }
    
    return self;
}
-(void)initUI{
    self.userMoney  =@"1000元";
    self.userPeriod = @"一个月";
    
    UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    backView.layer.borderColor = [UIColor redColor].CGColor;
    backView.layer.borderWidth = 1.0;
    [backView setImage:[UIImage imageNamed:@"kapian_bg.png"]];
    [self addSubview:backView];
    self.pick = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.pick.delegate = self;
    self.pick.dataSource =self;
    [self.pick selectRow:0 inComponent:0 animated:YES];
    self.pick.showsSelectionIndicator  =YES;
    [self addSubview:self.pick];
    UIImageView *checkBox = [[UIImageView alloc]initWithFrame:CGRectMake(20+24, backView.frame.size.height/2.0-18, backView.frame.size.width-40-48, 36)];
    [checkBox setImage:[UIImage imageNamed:@"sy_xuanzekuang.png"]];
    [self addSubview:checkBox];
    
//    NSLog(@"pick %@",NSStringFromCGRect(self.pick.frame));
//    NSLog(@" self %@",NSStringFromCGRect(self.frame));
    [self pickerView:self.pick didSelectRow:0 inComponent:0];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (component==0) {
        return 6;
    }else{
        return 3;
    }
    
}

#pragma mark delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        return self.moneys[row];
    }else{
        return self.months[row];
    }
    
}
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSAttributedString *string;
    if (component==0) {
        string = [[NSAttributedString alloc]initWithString:self.moneys[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }else{
    
        string= [[NSAttributedString alloc]initWithString:self.months[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    return string;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        self.userMoney = self.moneys[row];
    }else{
        self.userPeriod = self.months[row];
    }
    if (self.tnMoneyBlock!=nil) {
        self.tnMoneyBlock(self.userMoney);
    }
    if (self.tnPeriodBlock!=nil) {
        self.tnPeriodBlock(self.userPeriod);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
      CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextStrokeEllipseInRect(context, self.frame);
    CGContextSetRGBStrokeColor(context, .5, .1, .5, 1);
    CGContextStrokePath(context);
}
*/

@end
