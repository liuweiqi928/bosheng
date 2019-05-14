//
//  HomePageViewController.h
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "baseViewController.h"
#import "shopbannerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : baseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
{
    UITextField*textfield;
    NSMutableArray*tuijianArray;
    NSMutableArray*hotArray;
    NSMutableArray*sortResultArr;
    NSMutableArray*bannerArray;
    
    NSDictionary *listArray;
    UIView *bgview;
    NSInteger nu;
    UIView *headview;//collection head
    UIButton *zhuanqu;//购物专区
    UIButton *shengxian;//生鲜专区
    UIButton *tuijiangoods;//推荐商品
    UIView *classView;//分区背景
    UIView *tehuiView;//特惠专区
    MJRefreshNormalHeader*heade;
}


@property (nonatomic , strong)shopbannerView * header;//banner
@property (nonatomic ,strong)UICollectionView * collectionView;

@end

NS_ASSUME_NONNULL_END
