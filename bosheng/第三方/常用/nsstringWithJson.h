//
//  nsstringWithJson.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/2/19.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface nsstringWithJson : NSObject

+(NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (id)dictionaryWithJsonString:(NSString *)jsonString;


@end

NS_ASSUME_NONNULL_END
