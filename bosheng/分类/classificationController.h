//
//  classificationController.h
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface classificationController : baseViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
        NSMutableArray*jipinArray;//大类
        NSMutableArray*hotArray;
    
        int sys;
    
}
@property (nonatomic ,assign)NSInteger leftRow;
@property (nonatomic ,strong)UITableView * customTableViews;
@property (nonatomic ,strong)UICollectionView * collectionView;

@end

NS_ASSUME_NONNULL_END
