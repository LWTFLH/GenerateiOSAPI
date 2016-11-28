//
//  UIView+HKSetConstraints.h
//  设置约束类别
//
//  Created by hiko on 15/10/26.
//  Copyright (c) 2015年 hiko. All rights reserved.
//

/*
 使用示例：
 
 一、设置与父视图约束
 UILabel *lblInfo1 = [[UILabel alloc] init];
 lblInfo1.text = @"嗨客iOS";
 lblInfo1.backgroundColor = [UIColor blueColor];
 [self.view addSubview:lblInfo1];
 [lblInfo1 setConstraintsWithType:HKConstraintTypeWidthHeightCenter constraintValue:(HKConstraints){80, 30, 0, 0}];
 
 二、设置与非父视图约束
 UILabel *lblInfo2 = [[UILabel alloc] init];
 lblInfo2.text = @"嗨客iOS2";
 lblInfo2.backgroundColor = [UIColor greenColor];
 [self.view addSubview:lblInfo2];
 [lblInfo2 setConstraintsWithType:HKConstraintTypeTopLeftWidthHeight constraintValue:(HKConstraints){0, 0, 0, 0} constraintsArray:@[lblInfo1.mas_bottom,lblInfo1.mas_left, lblInfo1.mas_width, lblInfo1.mas_height]];
 
 二、设置与非父视图约束比例约束
 UILabel *lblInfo2 = [[UILabel alloc] init];
 lblInfo2.text = @"嗨客iOS2";
 lblInfo2.textAlignment = NSTextAlignmentCenter;
 lblInfo2.backgroundColor = [UIColor greenColor];
 [self.view addSubview:lblInfo2];
 [lblInfo2 setConstraintsWithType:HKConstraintTypeTopWidthHeightCenterX constraintValue:(HKConstraints){0, 0, 0, 0} constraintsArray:@[lblInfo1.mas_bottom, lblInfo1.mas_width, lblInfo1.mas_height, lblInfo1.mas_centerX] multipliedBy:(HKConstraints){1, 2, 1, 1}];
 
 ！！！
 1.
 注：lblInfo2的宽高约束是lblInfo1的宽高来的，那么constraintsArray对应的要写lblInfo1.mas_width, lblInfo1.mas_height
 如果lblInfo2的宽高是写死的数值， 写lblInfo2.mas_width, lblInfo2.mas_height.
 
 ！！！
 2.
 注：约束设置顺序：上 左 下 右 宽 高 中心x 中心y  设置时注意正负值

 
 */

#import <UIKit/UIKit.h>
#import "Masonry.h"

typedef struct HKConstraints
{
    float  f_value1;        //!<第一个约束值
    float  f_value2;        //!<第二个约束值
    float  f_value3;        //!<第三个约束值
    float  f_value4;        //!<第四个约束值
}HKConstraints;//!<约束值结构体

typedef NS_OPTIONS(NSInteger, HKConstraintType)
{
    HKConstraintTypeTopLeftWidthHeight      = 1,      //<!设置约束为 上左宽高
    HKConstraintTypeWidthHeightCenter       = 2,      //!<设置约束为 宽高中心
    HKConstraintTypeTopRightWidthHeight     = 3,      //!<设置约束为 上右宽高
    HKConstraintTypeTopLeftBottomRight      = 4,      //!<设置约束为 上左下右
    HKConstraintTypeTopLeftRightHeight      = 5,      //!<设置约束为 上左右高
    HKConstraintTypeLeftBottomRightHeight   = 6,      //!<设置约束为 左下右高
    HKConstraintTypeTopWidthHeightCenterX   = 7,      //!<设置约束为 上宽高中心x
    HKConstraintTypeLeftWidthHeightCenterY  = 8       //!<设置约束为 左宽高中心y
};//!<约束类型

@interface UIView (HKSetConstraints)

/**
 *  设置约束(与父视图的约束)
 *
 *  @param type             约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraints      约束值结构体
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue;

/**
 *  设置约束
 *
 *  @param type             约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraints      约束值结构体
 *  @param arrConstraints   约束值对应的约束属性(4个)
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue
              constraintsArray:(NSArray *)arrConstraints;

/**
 *  设置约束(带乘积)
 *
 *  @param type             约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraints      约束值结构体
 *  @param arrConstraints   约束值对应的约束属性(4个)
 *  @param multipliedBy     约束的乘积
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue
              constraintsArray:(NSArray *)arrConstraints
                  multipliedBy:(HKConstraints)multipliedBy;

@end
