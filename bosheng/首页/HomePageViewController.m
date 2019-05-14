//
//  HomePageViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "HomePageViewController.h"
#import "bigImgCollectionViewCell.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

-(void)homepage{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//    NSDictionary*dic=@{@"city":@"39"};
    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"HomePage/GetHomePage"] parameters:@{} type:2 success:^(id responseObject){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"code"]intValue]==200) {

            
            
        }else{
            [self showMessage:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(NSError *error){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=getColor(@"f5f5f5");
    [self.navigationController.navigationBar.tintColor = [UIColor grayColor]CGColor];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    //创建collectionview
    UICollectionViewFlowLayout * folwlayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT-SafeAreaBottomHeighttabbar) collectionViewLayout:folwlayout];
    _collectionView.contentInset=UIEdgeInsetsMake(660*SCREENWIDTHS+115*SCREENWIDTHS*3,0, 0, 0);
    _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(660*SCREENWIDTHS+115*SCREENWIDTHS*3, 0, 0, 0);

    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    [_collectionView registerClass:[bigImgCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    [_collectionView registerClass:[goodsCollectionViewCell class] forCellWithReuseIdentifier:@"tuijiancell"];
    
//    [_collectionView registerClass:[headCollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    heade=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self->tuijianArray removeAllObjects];
        [self->hotArray removeAllObjects];
        [self->sortResultArr removeAllObjects];
        
//        [self tuijianinfo];
//        [self hotinfo];
//        [self fenlieinfo];
        
    }];
    heade.ignoredScrollViewContentInsetTop = 660*SCREENWIDTHS+115*SCREENWIDTHS*3;
//    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = self.collectionView.contentInset.top;

    
    _collectionView.mj_header=heade;
    heade.lastUpdatedTimeLabel.hidden=YES;
    
    [self addHeaderContent];
//    [self homepage];
    
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
//
//    view.layer.zPosition = 0.0;
//
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    hotGoodsViewController*gz=[[hotGoodsViewController alloc]init];
//    gz.goodsname=textField.text;
//    [self.navigationController pushViewController:gz animated:YES];
    
    
    [textField resignFirstResponder];
    return YES;
}

-(void)addHeaderContent{
    headview = [[UIView alloc] initWithFrame:CGRectMake(0, -660*SCREENWIDTHS-(115*SCREENWIDTHS*3), PHONE_WIDTH, 660*SCREENWIDTHS+(115*SCREENWIDTHS*3))];
    headview.backgroundColor=bgColorPER;
    [_collectionView addSubview:headview];
//    [headview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@(660*SCREENWIDTHS));
//        make.top.equalTo(self->_collectionView).offset(-660*SCREENWIDTHS);
//    }];
//    [headview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@(660*SCREENWIDTHS+115*SCREENWIDTHS*3));
//    make.top.equalTo(self->_collectionView).offset(-660*SCREENWIDTHS-115*SCREENWIDTHS*3);
//    }];
    
    
    //广告条
    _header = [[shopbannerView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 230*SCREENWIDTHS)];
    _header.backgroundColor=[UIColor grayColor];
    __weak typeof(self) weakSelf = self;
    
    _header.clickbanner  = ^(NSInteger tag){
//        [weakSelf tiaozhuan:tag];
        
    };
    [headview addSubview:_header];
    
    
    //分类
    UIButton*class=[[UIButton alloc]init];
//    class.backgroundColor=[UIColor grayColor];
    [class setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [class addTarget:self action:@selector(classclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:class];
    [class mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10*SCREENWIDTHS);
        make.width.height.equalTo(@(40*SCREENWIDTHS));
        make.top.equalTo(self->_collectionView).offset(28*SCREENWIDTHS);
    }];
    
    
    //搜索
    textfield =[[UITextField alloc]init];
    textfield.placeholder = @"搜索你想要的";
    textfield.alpha=0.6;
    textfield.font=[UIFont systemFontOfSize:13*SCREENWIDTHS];
    textfield.backgroundColor=bgColorPER;
    textfield.layer.cornerRadius=8*SCREENWIDTHS;
    textfield.layer.masksToBounds=YES;
    textfield.returnKeyType = UIReturnKeySearch;
    textfield.delegate = self;
    textfield.enablesReturnKeyAutomatically = YES;
    UIImageView*im=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5*SCREENWIDTHS, 20*SCREENWIDTHS, 15*SCREENWIDTHS)];
    im.contentMode=UIViewContentModeScaleAspectFit;
    im.image= [UIImage imageNamed:@"icon-搜索"];
    textfield.leftView=im;
    textfield.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:textfield];
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(class.mas_right).offset(10*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-60*SCREENWIDTHS);
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.top.equalTo(self->_collectionView).offset(28*SCREENWIDTHS);
    }];
    
    
    //my
    UIButton*mine=[[UIButton alloc]init];
    [mine setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [mine addTarget:self action:@selector(mine) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mine];
    [mine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10*SCREENWIDTHS);
        make.width.height.equalTo(@(40*SCREENWIDTHS));
        make.top.equalTo(self->_collectionView).offset(28*SCREENWIDTHS);
    }];
    
    zhuanqu=[[UIButton alloc]init];
    zhuanqu.backgroundColor=[UIColor grayColor];
    zhuanqu.layer.masksToBounds=YES;
    zhuanqu.layer.cornerRadius=10*SCREENWIDTHS;
    [zhuanqu addTarget:self action:@selector(zhuanqu) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:zhuanqu];
    [zhuanqu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->headview).offset(10*SCREENWIDTHS);
        make.width.equalTo(@((PHONE_WIDTH-30*SCREENWIDTHS)/2));
        make.top.equalTo(self->_header.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(@(80*SCREENWIDTHS));
    }];

    shengxian=[[UIButton alloc]init];
    shengxian.backgroundColor=[UIColor grayColor];
    shengxian.layer.masksToBounds=YES;
    shengxian.layer.cornerRadius=10*SCREENWIDTHS;
    [shengxian addTarget:self action:@selector(shengxian) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:shengxian];
    [shengxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->zhuanqu.mas_right).offset(10*SCREENWIDTHS);
        make.right.equalTo(self->headview).offset(-10*SCREENWIDTHS);
        make.top.height.equalTo(self->zhuanqu);
    }];
    
    //推荐商品
    tuijiangoods=[[UIButton alloc]init];
    tuijiangoods.backgroundColor=[UIColor grayColor];
    tuijiangoods.layer.masksToBounds=YES;
    tuijiangoods.layer.cornerRadius=10*SCREENWIDTHS;
    [tuijiangoods addTarget:self action:@selector(shengxian) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:tuijiangoods];
    [tuijiangoods mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->zhuanqu);
        make.right.equalTo(self->shengxian);
        make.top.equalTo(self->shengxian.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(@(100*SCREENWIDTHS));
    }];
    
    UILabel*des=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"#岁月美好点  生活精致些#" andTextColor:[UIColor blackColor] andFont:[UIFont systemFontOfSize:16*SCREENWIDTHS] andAlignment:1];
    [headview addSubview:des];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->headview);
        make.top.equalTo(self->tuijiangoods.mas_bottom);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    //分类背景
    classView=[[UIView alloc]init];
    classView.backgroundColor=[UIColor clearColor];
    [headview addSubview:classView];
//    [classView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self->headview);
//        make.top.equalTo(des.mas_bottom);
//        make.height.equalTo(@(1));
//    }];
    [classView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->headview);
        make.top.equalTo(des.mas_bottom);
        make.height.equalTo(@(115*SCREENWIDTHS*3));
    }];

    
    
    
    //特惠
    tehuiView=[[UIView alloc]init];
    tehuiView.backgroundColor=[UIColor whiteColor];
    [headview addSubview:tehuiView];
    [tehuiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->headview);
        make.top.equalTo(self->classView.mas_bottom);
        make.height.equalTo(@(150*SCREENWIDTHS));
    }];
    
    UILabel*tehui=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"特惠专区" andTextColor:[UIColor blackColor] andFont:[UIFont systemFontOfSize:14*SCREENWIDTHS] andAlignment:0];
    [tehuiView addSubview:tehui];
    [tehui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->tehuiView).offset(10*SCREENWIDTHS);
        make.top.equalTo(self->tehuiView).offset(10*SCREENWIDTHS);
        make.width.equalTo(@(100*SCREENWIDTHS));
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];

    //更多
    UIButton*more=[[UIButton alloc]init];
    [more setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [more setTitle:@"更多" forState:UIControlStateNormal];
    more.titleLabel.font=normalFontPER;
    [more setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [more layoutButtonWithEdgeInsetsStyle:TYButtonEdgeInsetsStyleRight imageTitleSpace:10*SCREENWIDTHS];
    [more addTarget:self action:@selector(moretehui) forControlEvents:UIControlEventTouchUpInside];
    [tehuiView addSubview:more];
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->tehuiView).offset(-10*SCREENWIDTHS);
        make.top.bottom.equalTo(tehui);
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];
    
    
    
//    _collectionView.contentInset=UIEdgeInsetsMake(660*SCREENWIDTHS+115*SCREENWIDTHS*3,0, 0, 0);
//    heade.ignoredScrollViewContentInsetTop = 660*SCREENWIDTHS+115*SCREENWIDTHS*3;

    for (int i=0; i<3; i++) {
        float spaceheight=15*SCREENWIDTHS;
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(10*SCREENWIDTHS, i*(spaceheight+100*SCREENWIDTHS), PHONE_WIDTH-20*SCREENWIDTHS, 100*SCREENWIDTHS)];
        btn.backgroundColor=[UIColor grayColor];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=10*SCREENWIDTHS;
        [btn addTarget:self action:@selector(shengxian) forControlEvents:UIControlEventTouchUpInside];
        [classView addSubview:btn];
        
    }
    //    [classView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.equalTo(self->headview);
    //        make.top.equalTo(des.mas_bottom);
    //        make.height.equalTo(@(115*SCREENWIDTHS*3));
    //    }];
    
//    [classView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@(115*SCREENWIDTHS*3));
//    }];
    //    [headview mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.equalTo(self.view);
    //        make.height.equalTo(@(115*SCREENWIDTHS*3+660*SCREENWIDTHS));
    //        make.top.equalTo(self->_collectionView).offset(-660*SCREENWIDTHS-115*SCREENWIDTHS*3);
    //    }];
    //
//    [headview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@(115*SCREENWIDTHS*3+ 660*SCREENWIDTHS));
//        make.top.equalTo(self->_collectionView).offset(-660*SCREENWIDTHS-115*SCREENWIDTHS*3);
//
//    }];
//
//    [_collectionView scrollsToTop];
    
    _collectionView.contentOffset = CGPointMake(0, -660*SCREENWIDTHS-115*SCREENWIDTHS*3);

}
//分类
-(void)classclick{
    
}

//登录
-(void)mine{
    
}
//购物专区
-(void)zhuanqu{
    
}
//生鲜专区
-(void)shengxian{
    
}
//推荐商品
-(void)tuijiangoods{
    
}
//更多特惠
-(void)moretehui{
    
}



//collectionview组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
    return hotArray.count;
}

//定义item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
        return CGSizeMake(165*SCREENWIDTHS, 225*SCREENWIDTHS);
    
}

//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
        bigImgCollectionViewCell *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [cell2 sizeToFit];
        goodsModel*model=[goodsModel mj_objectWithKeyValues:[hotArray objectAtIndex:indexPath.row]];
        cell2.bean=model;
        
        return cell2;
    
}
//section
//动态设置每行的间距大小

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10*SCREENWIDTHS;
}



//动态设置每列的间距大小

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10*SCREENWIDTHS;
    
}

//动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0*SCREENWIDTHS, 15*SCREENWIDTHS, 0*SCREENWIDTHS, 15*SCREENWIDTHS);
    
}
//点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
//        goodsDetailController*de=[[goodsDetailController alloc]init];
//        goodsModel*model=[goodsModel mj_objectWithKeyValues:[hotArray objectAtIndex:indexPath.row]];
//
//        de.goodsID=model.goodsID;
//        [self.navigationController pushViewController:de animated:YES];
    
}


-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    //tableViews.hidden = YES;
    [self.view endEditing:YES];
    [textfield resignFirstResponder];
    
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
