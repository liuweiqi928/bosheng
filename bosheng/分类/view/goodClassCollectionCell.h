//
//  goodClassCollectionCell.h
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/12.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodsClassModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface goodClassCollectionCell : UICollectionViewCell
{
    UIImageView*img;
    UILabel*name;
    UILabel*money;
}

@property (assign, nonatomic)goodsClassModel *bean;
@end

NS_ASSUME_NONNULL_END
