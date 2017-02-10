//
//  TNCityView.m
//  LMMPickerViewSample
//
//  Created by 李伟 on 16/12/13.
//  Copyright © 2016年 LMM. All rights reserved.
//

#import "TNCityView.h"
@interface TNCityView () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSDictionary *pickerData;    //保存全部数据
@property (nonatomic, strong) NSArray *pickerProvinceData; //当前的省数据
@property (nonatomic, strong) NSArray *pickerCitiesData;   //当前省下面的市数据
@property (nonatomic, strong) UIPickerView *pickerView;
@end
@implementation TNCityView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setupUI];
    }

    return self;
}

- (void)setupUI {

    self.userInteractionEnabled = YES;
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    [self addSubview:self.pickerView];
//    for (UIView *temp in self.pickerView.subviews) {
//        if (temp.bounds.size.height<2.0) {
//            temp.backgroundColor= [UIColor greenColor];
//        }
//    }

   // self.pickerView.backgroundColor = [UIColor redColor];
    NSBundle *budle = [NSBundle mainBundle];
    NSString *plistPath = [budle pathForResource:@"provinces_cities" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.pickerData = dict;
    self.pickerProvinceData = [self.pickerData allKeys];

    //    默认去除取出第一个省的所有市的数据
    NSString *selectedProvince = [self.pickerProvinceData objectAtIndex:0];
    self.pickerCitiesData = [self.pickerData objectForKey:selectedProvince];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.pickerProvinceData.count;
    } else {
        return self.pickerCitiesData.count;
    }
}

#pragma mark----- 实现协议UIPickerViewDelegate方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.pickerProvinceData objectAtIndex:row];
    } else {
        return [self.pickerCitiesData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        NSString *selectedProvince = [self.pickerProvinceData objectAtIndex:row];
        NSArray *array = [self.pickerData objectForKey:selectedProvince];
        self.pickerCitiesData = array;
        [self.pickerView reloadComponent:1];
    }

    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
    NSString *selected1 = [self.pickerProvinceData objectAtIndex:row1];
    NSString *selected2 = [self.pickerCitiesData objectAtIndex:row2];
    if ([self.delegate respondsToSelector:@selector(TNCityView:didSelectPro:selectCity:)]) {
        [self.delegate TNCityView:self didSelectPro:selected1 selectCity:selected2];
        }
}

@end
