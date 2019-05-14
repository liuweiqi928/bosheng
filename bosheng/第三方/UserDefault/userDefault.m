//
//  userDefault.m
//  CarAndHouse
//
//  Created by 久久财富 on 2018/6/4.
//  Copyright © 2018年 有车有房. All rights reserved.
//

#import "userDefault.h"

@implementation userDefault

NSString * const userName = @"userName";
NSString * const userPas = @"userPas";
NSString * const userToken = @"userToken";
NSString * const shenFen = @"shenFen";
NSString * const userID = @"userID";
NSString * const history = @"history";
NSString * const currentDingWei = @"currentDingWei";


+(void)saveValue:(id)value forKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)savedvalueForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{key:@""}];

    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+(NSArray*)savedvaluearrayForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{key:@[]}];
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];

}
@end
