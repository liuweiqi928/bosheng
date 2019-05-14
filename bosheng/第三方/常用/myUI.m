//
//  myUI.m
//  99Finance
//
//  Created by 久久财富 on 2018/4/8.
//  Copyright © 2018年 mac mini01. All rights reserved.
//

#import "myUI.h"

@implementation myUI

+(UILabel *)myUILabelWithFrame:(CGRect)rect andBackgroundColor:(UIColor*)backgroundColor andText:(NSString *)text andTextColor:(UIColor *)textColor andFont:(UIFont *)font andAlignment:(NSTextAlignment)alignment{
    UILabel *lab = [[UILabel alloc] initWithFrame:rect];
    lab.text = text;
    lab.backgroundColor = backgroundColor;
    lab.textColor = textColor;
    lab.font = font;
    lab.textAlignment = alignment;
    return lab;
}

+(UILabel *)myUILabelWithBackgroundColor:(UIColor*)backgroundColor andText:(NSString *)text andTextColor:(UIColor *)textColor andFont:(UIFont *)font andAlignment:(NSTextAlignment)alignment{
    UILabel *lab = [[UILabel alloc] init];
    lab.text = text;
    lab.backgroundColor = backgroundColor;
    lab.textColor = textColor;
    lab.font = font;
    lab.textAlignment = alignment;
    return lab;
}


UIColor* getColor(NSString * hexColor)
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}


@end
