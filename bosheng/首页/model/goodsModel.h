//
//  goodsModel.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/1/19.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsModel : NSObject

@property(nonatomic,copy)NSString*commodityname;
@property(nonatomic,copy)NSString*price;
@property(nonatomic,copy)NSArray*picture;
@property(nonatomic,copy)NSString*goodsID;
@property (nonatomic, assign) BOOL isSelect;
@property(nonatomic,copy)NSString*detail;
@property(nonatomic,copy)NSString*commjj;
@property(nonatomic,copy)NSString*salesvolume;
@property(nonatomic,copy)NSString*classid;
@property(nonatomic,copy)NSString*classname;
@property(nonatomic,copy)NSString*num;
@property(nonatomic,copy)NSString*ord;
@property(nonatomic,copy)NSString*carID;

@end

NS_ASSUME_NONNULL_END
