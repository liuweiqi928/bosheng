//
//  myUI.h
//  99Finance
//
//  Created by 久久财富 on 2018/4/8.
//  Copyright © 2018年 mac mini01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myUI : NSObject

+(UILabel *)myUILabelWithFrame:(CGRect)rect andBackgroundColor:(UIColor*)backgroundColor andText:(NSString *)text andTextColor:(UIColor *)textColor andFont:(UIFont *)font andAlignment:(NSTextAlignment)alignment;

+(UILabel *)myUILabelWithBackgroundColor:(UIColor*)backgroundColor andText:(NSString *)text andTextColor:(UIColor *)textColor andFont:(UIFont *)font andAlignment:(NSTextAlignment)alignment;

UIColor* getColor(NSString * hexColor);


@end
