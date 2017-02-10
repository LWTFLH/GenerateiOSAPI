//
//  TNPickView.h
//  MasnoryTest
//
//  Created by 李伟 on 17/2/9.
//  Copyright © 2017年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TNPickView;
@protocol TNPickViewDelegate <NSObject>

-(void)tnPickView:(TNPickView *)pick didSelectMoney:(NSString *)money withPeriod:(NSString *)period;
@end
@interface TNPickView : UIView
@property(nonatomic,weak)id<TNPickViewDelegate>delegate;
@property(nonatomic,copy)void (^tnMoneyBlock)(NSString *);
@property(nonatomic,copy)void (^tnPeriodBlock)(NSString *);
-(instancetype)initWithFrame:(CGRect)frame WithBlock:(void (^)(NSString *))money tnPeriodBlock:(void(^)(NSString *))period;
@end

