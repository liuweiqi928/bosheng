//
//  bigImgCollectionViewCell.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/1/19.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface bigImgCollectionViewCell : UICollectionViewCell
{
    UIImageView*img;
    UILabel*name;
    UILabel*money;
}

@property (assign, nonatomic)goodsModel *bean;

@end

NS_ASSUME_NONNULL_END
