//
//  mineViewController.h
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface mineViewController : baseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *headImg;
    UILabel*nameLab;
    UILabel*idLab;
    
    UILabel*wenZhangLab;//文章
    UILabel*youHuiLab;//优惠
    UILabel*goodsLab;//收藏商品
    UILabel*dianpuLab;//关注店铺
    UILabel*daifuLab;//待付款
    UILabel*daifaLab;//代发货
    UILabel*daishouLab;//待收货
    UILabel*daipingLab;//待评价
    UILabel*tuikuanLab;//退款、售后

    NSArray*dataArr;

}

@property (nonatomic ,strong)UITableView * customTableViews;
//@property (nonatomic ,assign)NSArray*dataArr;

@end

NS_ASSUME_NONNULL_END
