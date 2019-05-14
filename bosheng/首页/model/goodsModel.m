//
//  goodsModel.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/1/19.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import "goodsModel.h"

@implementation goodsModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"goodsID" : @"id",//前边的是你想用的key，后边的是返回的key
             };
}

@end
