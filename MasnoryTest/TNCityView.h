//
//  TNCityView.h
//  LMMPickerViewSample
//
//  Created by 李伟 on 16/12/13.
//  Copyright © 2016年 LMM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TNCityView;

@protocol  TNCityViewDelegate<NSObject>
@required
-(void)TNCityView:(TNCityView *)cityView  didSelectPro:(NSString *)pro selectCity:(NSString *)city;

@end@interface TNCityView : UIView

@property(nonatomic,weak)id<TNCityViewDelegate >delegate;
@end