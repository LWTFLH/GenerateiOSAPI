//
//  UIView+HKSetConstraints.m
//  设置约束类别
//
//  Created by hiko on 15/10/26.
//  Copyright (c) 2015年 hiko. All rights reserved.
//

#import "UIView+HKSetConstraints.h"

const int i_constraints = 4;        //!<固定是四个约束属性
@implementation UIView (HKSetConstraints)

/**
 *  设置约束(与父视图的约束)
 *
 *  @param type             约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraints      约束值结构体
 *  @param arrConstraints   约束值对应的约束属性(4个)
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue
{
    switch (type)
    {
        case HKConstraintTypeTopLeftWidthHeight:  //设置约束类型为 上左宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(constraintsValue.f_value1);
                make.left.mas_equalTo(constraintsValue.f_value2);
                make.width.mas_equalTo(constraintsValue.f_value3);
                make.height.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopLeftBottomRight:  //设置约束类型为 上左下右
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(constraintsValue.f_value1);
                make.left.mas_equalTo(constraintsValue.f_value2);
                make.bottom.mas_equalTo(constraintsValue.f_value3);
                make.right.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopLeftRightHeight:  //设置约束类型为 上左右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(constraintsValue.f_value1);
                make.left.mas_equalTo(constraintsValue.f_value2);
                make.right.mas_equalTo(constraintsValue.f_value3);
                make.height.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopRightWidthHeight:  //设置约束类型为 上右宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(constraintsValue.f_value1);
                make.right.mas_equalTo(constraintsValue.f_value2);
                make.width.mas_equalTo(constraintsValue.f_value3);
                make.height.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeWidthHeightCenter:  //设置约束类型为 宽高居中
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(constraintsValue.f_value1);
                make.height.mas_equalTo(constraintsValue.f_value2);
                make.centerX.mas_equalTo(constraintsValue.f_value3);
                make.centerY.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftBottomRightHeight:  //设置约束类型为 左下右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(constraintsValue.f_value1);
                make.bottom.mas_equalTo(constraintsValue.f_value2);
                make.right.mas_equalTo(constraintsValue.f_value3);
                make.height.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopWidthHeightCenterX:  //设置约束为 上宽高中心x
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(constraintsValue.f_value1);
                make.width.mas_equalTo(constraintsValue.f_value2);
                make.height.mas_equalTo(constraintsValue.f_value3);
                make.centerX.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftWidthHeightCenterY:  //设置约束为 左宽高中心y
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(constraintsValue.f_value1);
                make.width.mas_equalTo(constraintsValue.f_value2);
                make.height.mas_equalTo(constraintsValue.f_value3);
                make.centerY.mas_equalTo(constraintsValue.f_value4);
            }];
        }
            break;
        default:
            break;
    }
}

/**
 *  设置约束
 *
 *  @param type                  约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraintsValue      约束值结构体
 *  @param arrConstraints        约束值对应的约束属性(4个)
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue
              constraintsArray:(NSArray *)arrConstraints;
{
    if (arrConstraints.count != i_constraints)  //如果约束的数量不等于4
    {
        return;
    }
    for (id obj in arrConstraints)  //如果包含非约束属性类型  返回
    {
        if (![obj isKindOfClass:[MASViewAttribute class]])
        {
            return;
        }
    }
    switch (type)
    {
        case HKConstraintTypeTopLeftWidthHeight:  //设置约束类型为 上左宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                if ([arrConstraints objectAtIndex:2] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value3);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                }
                
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopLeftBottomRight:  //设置约束类型为 上左下右
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                make.bottom.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                make.right.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopLeftRightHeight:  //设置约束类型为 上左右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                make.right.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopRightWidthHeight:  //设置约束类型为 上右宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.right.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                if ([arrConstraints objectAtIndex:2] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value3);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                }
                
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeWidthHeightCenter:  //设置约束类型为 宽高居中
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                if ([arrConstraints objectAtIndex:0] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value1);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                }
                
                if ([arrConstraints objectAtIndex:1] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value2);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                }
                make.centerX.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                make.centerY.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftBottomRightHeight:  //设置约束类型为 左下右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.bottom.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                make.right.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                if ([arrConstraints objectAtIndex:3] == self.mas_height)
                {
                    make.height.mas_equalTo(constraintsValue.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopWidthHeightCenterX:  //设置约束为 上宽高中心x
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.width.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                make.height.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                make.centerX.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftWidthHeightCenterY:  //设置约束为 左宽高中心y
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1);
                make.width.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2);
                make.height.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3);
                make.centerY.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4);
            }];
        }
            break;
        default:
            break;
    }
}

/**
 *  设置约束(带乘积)
 *
 *  @param type             约束类型 注：设置什么类型，值的顺序要和类型的值一一对应（上左下右类型，那么值结构体对应的值分别就是 上左下右）
 *  @param constraints      约束值结构体
 *  @param arrConstraints   约束值对应的约束属性(4个)
 *  @param multipliedBy     约束的乘积(值不能为0)
 */
- (void)setConstraintsWithType:(HKConstraintType)type
               constraintValue:(HKConstraints)constraintsValue
              constraintsArray:(NSArray *)arrConstraints
                  multipliedBy:(HKConstraints)multipliedBy
{
    if (arrConstraints.count != i_constraints)  //如果约束的数量不等于4
    {
        return;
    }
    for (id obj in arrConstraints)  //如果包含非约束属性类型  返回
    {
        if (![obj isKindOfClass:[MASViewAttribute class]])
        {
            return;
        }
    }
    if (multipliedBy.f_value1 == 0 || multipliedBy.f_value2 == 0 || multipliedBy.f_value3 == 0 || multipliedBy.f_value4 == 0)  //比例为0有时会崩
    {
        return;
    }
    switch (type)
    {
        case HKConstraintTypeTopLeftWidthHeight:  //设置约束类型为 上左宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                if ([arrConstraints objectAtIndex:2] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                }
                
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopLeftBottomRight:  //设置约束类型为 上左下右
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                make.bottom.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                make.right.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
            }];
        }
            break;
        case HKConstraintTypeTopLeftRightHeight:  //设置约束类型为 上左右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.left.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                make.right.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopRightWidthHeight:  //设置约束类型为 上右宽高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.right.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                if ([arrConstraints objectAtIndex:2] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                }
                
                if ([arrConstraints objectAtIndex:3] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeWidthHeightCenter:  //设置约束类型为 宽高居中
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                if ([arrConstraints objectAtIndex:0] == self.mas_width) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.width.mas_equalTo(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                }
                else
                {
                    make.width.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                }
                
                if ([arrConstraints objectAtIndex:1] == self.mas_height) //如果是相对自己的宽高约束，直接设置宽高的数值
                {
                    make.height.mas_equalTo(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                }
                make.centerX.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                make.centerY.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftBottomRightHeight:  //设置约束类型为 左下右高
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.bottom.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                make.right.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                if ([arrConstraints objectAtIndex:3] == self.mas_height)
                {
                    make.height.mas_equalTo(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
                else
                {
                    make.height.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
                }
            }];
        }
            break;
        case HKConstraintTypeTopWidthHeightCenterX:  //设置约束为 上宽高中心x
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.width.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                make.height.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                make.centerX.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
            }];
        }
            break;
        case HKConstraintTypeLeftWidthHeightCenterY:  //设置约束为 左宽高中心y
        {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([arrConstraints objectAtIndex:0]).with.offset(constraintsValue.f_value1).multipliedBy(multipliedBy.f_value1);
                make.width.equalTo([arrConstraints objectAtIndex:1]).with.offset(constraintsValue.f_value2).multipliedBy(multipliedBy.f_value2);
                make.height.equalTo([arrConstraints objectAtIndex:2]).with.offset(constraintsValue.f_value3).multipliedBy(multipliedBy.f_value3);
                make.centerY.equalTo([arrConstraints objectAtIndex:3]).with.offset(constraintsValue.f_value4).multipliedBy(multipliedBy.f_value4);
            }];
        }
            break;
        default:
            break;
    }
}

@end
