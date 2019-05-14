//
//  classificationController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "classificationController.h"
#import "goodClassCollectionCell.h"

@interface classificationController ()

@end

@implementation classificationController
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar.tintColor = [UIColor grayColor]CGColor];
    [self initNavBar:@"分类" style:REFRESH];
    
    jipinArray=[NSMutableArray arrayWithObjects:@"测试产品",@"测试",@"测试产品",@"测试",@"测试", nil];
    hotArray=[NSMutableArray arrayWithObjects:@"测试",@"测试产品",@"测试",@"测试产品",@"测试", nil];
    
        _customTableViews = [[UITableView alloc] initWithFrame:CGRectMake(0, 0*SCREENWIDTHS, 95*SCREENWIDTHS , PHONE_HEIGHT-SafeAreaBottomHeighttabbar)];
        _customTableViews.backgroundColor = [UIColor clearColor];
        //    _customTableViews.separatorStyle = UITableViewCellSeparatorStyleNone;
        _customTableViews.dataSource = self;
        _customTableViews.delegate = self;
        _customTableViews.tableFooterView=[[UIView alloc]init];
        NSIndexPath *firstPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_customTableViews selectRowAtIndexPath:firstPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        [self.view addSubview:_customTableViews];
    
    
        //创建collectionview
        UICollectionViewFlowLayout * folwlayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(96*SCREENWIDTHS, 0*SCREENWIDTHS, PHONE_WIDTH, PHONE_HEIGHT-SafeAreaBottomHeighttabbar) collectionViewLayout:folwlayout];
    
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.showsHorizontalScrollIndicator=NO;
        [_collectionView registerClass:[goodClassCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
    
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
    


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return jipinArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *completeCellIdentifier = @"zhiweizidingyiCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:completeCellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:completeCellIdentifier];
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.highlightedTextColor = zhuColorPER;

        cell.backgroundColor=[UIColor whiteColor];
        cell.selectedBackgroundView.backgroundColor=[UIColor whiteColor];
//        cell.textLabel.numberOfLines=2;
        //cell.textLabel.backgroundColor=[UIColor yellowColor];
        cell.textLabel.font=[UIFont systemFontOfSize:13*SCREENWIDTHS];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.textLabel.textColor=blackColorPER;

    }
    cell.textLabel.text=jipinArray[indexPath.row];


    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50*SCREENWIDTHS;

}
//点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.leftRow = indexPath.row;
//    fenleiModel*model=[fenleiModel mj_objectWithKeyValues:[self->jipinArray objectAtIndex:indexPath.row]];
//
//
//    self->classid=model.classID;
//    sys=1;
//    [self->yewuArray removeAllObjects];
//
//    [self jipininfo];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return hotArray.count;
}

//定义item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

     return CGSizeMake(60*SCREENWIDTHS, 95*SCREENWIDTHS);

}

//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

        UICollectionViewCell *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [cell2 sizeToFit];
//        goodsClassModel*model=[goodsClassModel mj_objectWithKeyValues:[hotArray objectAtIndex:indexPath.row]];
//        cell2.bean=model;

        return cell2;
}
//section
//动态设置每行的间距大小

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 20*SCREENWIDTHS;
}



//动态设置每列的间距大小

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10*SCREENWIDTHS;

}

//动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0*SCREENWIDTHS, 20*SCREENWIDTHS, 0*SCREENWIDTHS, 20*SCREENWIDTHS);

}
//点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    goodsFenleiDeViewController*de=[[goodsFenleiDeViewController alloc]init];
//    goodsFenleiModel*model=[goodsFenleiModel mj_objectWithKeyValues:[hotArray objectAtIndex:indexPath.row]];
//
//    de.leixingID=model.classID;
//    [self.navigationController pushViewController:de animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
