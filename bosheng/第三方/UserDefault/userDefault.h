//
//  userDefault.h
//  CarAndHouse
//
//  Created by 久久财富 on 2018/6/4.
//  Copyright © 2018年 有车有房. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userDefault : NSObject

extern NSString *const userName;
extern NSString *const userPas;

extern NSString *const userToken;
extern NSString *const shenFen;
extern NSString *const userID;
extern NSString *const history;
extern NSString *const currentDingWei;


+(void)saveValue:(id)value forKey:(NSString *)key;

+(id)savedvalueForKey:(NSString *)key;
+(NSArray*)savedvaluearrayForKey:(NSString *)key;

@end
