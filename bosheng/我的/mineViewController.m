//
//  mineViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/5.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "mineViewController.h"
#import "loginViewController.h"
#import "sexViewController.h"
#import "setupViewController.h"
#import "collectiongoodsController.h"
#import "followStoreViewController.h"

@interface mineViewController ()

@end

@implementation mineViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//    NSString*shen=[userDefault savedvalueForKey:shenFen];
//    if ([shen intValue] ==geren) {
//
//    }else{
//        geren=[shen intValue];
//        [self qiyeinfo];
//    }
//
//
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=bgColorPER;
    [self.navigationController.navigationBar.tintColor = [UIColor grayColor]CGColor];
    dataArr=@[@{@"img":@"形状6",@"title":@"收货地址"},@{@"img":@"标签",@"title":@"修改兴趣标签"},@{@"img":@"矢量智能对象",@"title":@"客服服务"},@{@"img":@"设置",@"title":@"设置"}];
    
    
    
    //列表
    _customTableViews = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, PHONE_WIDTH , PHONE_HEIGHT-SafeAreaBottomHeighttabbar) ];
    _customTableViews.backgroundColor = [UIColor clearColor];
//    _customTableViews.separatorStyle = UITableViewCellSeparatorStyleNone;
    _customTableViews.dataSource = self;
    _customTableViews.delegate = self;
    //    _customTableViews.rowHeight = UITableViewAutomaticDimension;
    //    _customTableViews.estimatedRowHeight = 110*SCREENWIDTHS;
    
    [self.view addSubview:_customTableViews];
    if (@available(iOS 11.0, *)) {
        _customTableViews.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        _customTableViews.estimatedRowHeight = 0;
        _customTableViews.estimatedSectionHeaderHeight = 0;
        _customTableViews.estimatedSectionFooterHeight = 0;
    }else {
        self.automaticallyAdjustsScrollViewInsets = false;
    }
//    MJRefreshNormalHeader*header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//
//    }];
//    _customTableViews.mj_header=header;
//    header.lastUpdatedTimeLabel.hidden=YES;
    
    
    UIView *hadview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 370*SCREENWIDTHS)];
    hadview.backgroundColor=[UIColor whiteColor];
    //    hadview.backgroundColor=zhuColorPER;
    [_customTableViews setTableHeaderView:hadview];
    
    
    UIImageView *boimg=[[UIImageView alloc]init];
    boimg.image=[UIImage imageNamed:@"我的组7"];
    [hadview addSubview:boimg];
    
    [boimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(hadview);
        make.height.equalTo(@(200*SCREENWIDTHS));
    }];
    


    //渐变
    UIImageView *boimg2=[[UIImageView alloc]init];
    boimg2.image=[UIImage imageNamed:@"矩形4"];
    [boimg addSubview:boimg2];
    
    [boimg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(boimg);
        make.height.equalTo(@(75*SCREENWIDTHS));
    }];
    
    //线
    UIView*xian1=[[UIView alloc]init];
    xian1.backgroundColor=bgColorPER;
    [hadview addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(hadview);
        make.bottom.equalTo(boimg2.mas_top).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    //底部线
    UIView*xian2=[[UIView alloc]init];
    xian2.backgroundColor=bgColorPER;
    [hadview addSubview:xian2];
    [xian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(boimg.mas_bottom).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    //头像
    headImg=[[UIImageView alloc]init];
    headImg.layer.cornerRadius=25*SCREENWIDTHS;
    headImg.layer.masksToBounds=YES;
    headImg.backgroundColor=bgColorPER;
    headImg.image=[UIImage imageNamed:@"头像"];
    [hadview addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(xian1).offset(-15*SCREENWIDTHS);
        make.width.height.equalTo(@(50*SCREENWIDTHS));
        make.left.equalTo(hadview).offset(25*SCREENWIDTHS);
    }];
    
//    login=[[UIButton alloc]init];
//    [login setTitle:@"登录" forState:UIControlStateNormal];
//    [login setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [hadview addSubview:login];
//    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//    [login mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.height.equalTo(self->headImg);
//    }];
//    login.hidden=YES;
    
    nameLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"昵称" andTextColor:[UIColor blackColor] andFont:normalFontPER andAlignment:0];
    [hadview addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->headImg.mas_right).offset(10*SCREENWIDTHS);
        make.right.equalTo(hadview);
        make.top.equalTo(self->headImg);
        make.height.equalTo(@(25*SCREENWIDTHS));
    }];

    idLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"ID " andTextColor:RGBCOLOR(146, 125, 108) andFont:middleFontPER andAlignment:0];
    [hadview addSubview:idLab];
    [idLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->nameLab);
        make.top.equalTo(self->nameLab.mas_bottom);
        make.height.equalTo(@(25*SCREENWIDTHS));
    }];
    
    
    //我的文章
    wenZhangLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:wenZhangLab];
    [wenZhangLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.width.equalTo(@(PHONE_WIDTH/4));
        make.top.equalTo(xian1.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(@(30*SCREENWIDTHS));
    }];
    
    
    UILabel* wenZhang=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"我的文章" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:wenZhang];
    [wenZhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->wenZhangLab);
        make.top.equalTo(self->wenZhangLab.mas_bottom).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(25*SCREENWIDTHS));
    }];
    
    
    UIButton*wenzhangbtn=[[UIButton alloc]init];
    wenzhangbtn.backgroundColor=[UIColor clearColor];
    [wenzhangbtn addTarget:self action:@selector(wenzhangbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:wenzhangbtn];
    [wenzhangbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(wenZhang);
        make.top.equalTo(self->wenZhangLab);
    }];

    
    
    //优惠券
    youHuiLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:youHuiLab];
    [youHuiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wenZhang.mas_right);
        make.width.equalTo(@(PHONE_WIDTH/4));
        make.top.bottom.equalTo(self->wenZhangLab);
    }];
    
    
    UILabel* youHui=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"优惠券" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:youHui];
    [youHui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->youHuiLab);
        make.top.bottom.equalTo(wenZhang);
    }];
    
    
    //收藏商品
    goodsLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:goodsLab];
    [goodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(youHui.mas_right);
        make.width.equalTo(@(PHONE_WIDTH/4));
        make.top.bottom.equalTo(self->wenZhangLab);
    }];
    
    
    UILabel* goods=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"收藏商品" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:goods];
    [goods mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->goodsLab);
        make.top.bottom.equalTo(wenZhang);
    }];
    
    UIButton*goodsbtn=[[UIButton alloc]init];
    goodsbtn.backgroundColor=[UIColor clearColor];
    [goodsbtn addTarget:self action:@selector(goodsbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:goodsbtn];
    [goodsbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(goods);
        make.top.equalTo(self->goodsLab);
    }];

    //关注店铺
    dianpuLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:dianpuLab];
    [dianpuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goods.mas_right);
        make.width.equalTo(@(PHONE_WIDTH/4));
        make.top.bottom.equalTo(self->wenZhangLab);
    }];
    
    
    UILabel* dianpu=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"关注店铺" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:dianpu];
    [dianpu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->dianpuLab);
        make.top.bottom.equalTo(wenZhang);
    }];
    
    UIButton*dianpubtn=[[UIButton alloc]init];
    dianpubtn.backgroundColor=[UIColor clearColor];
    [dianpubtn addTarget:self action:@selector(dianpubtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:dianpubtn];
    [dianpubtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(dianpu);
        make.top.equalTo(self->dianpuLab);
    }];

    
    //我的订单
    UILabel* mydingdan=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"我的订单" andTextColor:[UIColor blackColor] andFont:normalFontPER andAlignment:0];
    [hadview addSubview:mydingdan];
    [mydingdan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10*SCREENWIDTHS);
        make.right.equalTo(self.view);
        make.top.equalTo(xian2.mas_bottom).offset(0);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    //全部订单
    UIButton*mydingdanBtn=[[UIButton alloc]init];
    [mydingdanBtn setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [mydingdanBtn setTitle:@"全部订单" forState:UIControlStateNormal];
    mydingdanBtn.titleLabel.font=normalFontPER;
    [mydingdanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [mydingdanBtn layoutButtonWithEdgeInsetsStyle:TYButtonEdgeInsetsStyleRight imageTitleSpace:10*SCREENWIDTHS];
    [mydingdanBtn addTarget:self action:@selector(allDingdan) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:mydingdanBtn];
    [mydingdanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-6*SCREENWIDTHS);
        make.top.bottom.equalTo(mydingdan);
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];


    //待付款
    daifuLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daifuLab];
    [daifuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.width.equalTo(@((PHONE_WIDTH-20*SCREENWIDTHS)/5));
        make.top.equalTo(mydingdan.mas_bottom).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(30*SCREENWIDTHS));
    }];


    UILabel* daifu=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"待付款" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daifu];
    [daifu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->daifuLab);
        make.top.equalTo(self->daifuLab.mas_bottom).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(30*SCREENWIDTHS));
    }];
    
    UIButton*daifubtn=[[UIButton alloc]init];
    daifubtn.backgroundColor=[UIColor clearColor];
    [daifubtn addTarget:self action:@selector(daifubtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:daifubtn];
    [daifubtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(daifu);
        make.top.equalTo(self->daifuLab);
    }];



    //待发货
    daifaLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daifaLab];
    [daifaLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(daifu.mas_right);
        make.width.equalTo(self->daifuLab);
        make.top.bottom.equalTo(self->daifuLab);
    }];


    UILabel* daifa=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"待发货" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daifa];
    [daifa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->daifaLab);
        make.top.bottom.equalTo(daifu);
    }];
    
    
    UIButton*daifabtn=[[UIButton alloc]init];
    daifabtn.backgroundColor=[UIColor clearColor];
    [daifubtn addTarget:self action:@selector(daifabtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:daifabtn];
    [daifabtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(daifa);
        make.top.equalTo(self->daifaLab);
    }];



    //待收货
    daishouLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daishouLab];
    [daishouLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(daifa.mas_right);
        make.width.equalTo(self->daifuLab);
        make.top.bottom.equalTo(self->daifuLab);
    }];


    UILabel* daishou=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"待收货" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daishou];
    [daishou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->daishouLab);
        make.top.bottom.equalTo(daifu);
    }];
    
    UIButton*daishoubtn=[[UIButton alloc]init];
    daishoubtn.backgroundColor=[UIColor clearColor];
    [daishoubtn addTarget:self action:@selector(daishoubtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:daishoubtn];
    [daishoubtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(daishou);
        make.top.equalTo(self->daishouLab);
    }];


    //待评价
    daipingLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daipingLab];
    [daipingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(daishou.mas_right);
        make.width.equalTo(self->daifuLab);
        make.top.bottom.equalTo(self->daifuLab);
    }];


    UILabel* daiping=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"待评价" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:daiping];
    [daiping mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->daipingLab);
        make.top.bottom.equalTo(daifu);
    }];

    UIButton*daipingbtn=[[UIButton alloc]init];
    daipingbtn.backgroundColor=[UIColor clearColor];
    [daipingbtn addTarget:self action:@selector(daipingbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:daipingbtn];
    [daipingbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(daiping);
        make.top.equalTo(self->daipingLab);
    }];

    //退款/售后
    tuikuanLab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"0" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:tuikuanLab];
    [tuikuanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(daiping.mas_right);
        make.right.equalTo(self.view);
        make.top.bottom.equalTo(self->daifuLab);
    }];


    UILabel* tuikuan=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"退款/售后" andTextColor:[UIColor grayColor] andFont:middleFontPER andAlignment:1];
    [hadview addSubview:tuikuan];
    [tuikuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->tuikuanLab);
        make.top.bottom.equalTo(daifu);
    }];
    
    UIButton*tuikuanbtn=[[UIButton alloc]init];
    tuikuanbtn.backgroundColor=[UIColor clearColor];
    [tuikuanbtn addTarget:self action:@selector(tuikuanbtnclick) forControlEvents:UIControlEventTouchUpInside];
    [hadview addSubview:tuikuanbtn];
    [tuikuanbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(tuikuan);
        make.top.equalTo(self->tuikuanLab);
    }];

    
    
    //我的服务
    UILabel* myfuwu=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"我的服务" andTextColor:[UIColor blackColor] andFont:normalFontPER andAlignment:0];
    [hadview addSubview:myfuwu];
    [myfuwu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10*SCREENWIDTHS);
        make.right.equalTo(self.view);
        make.top.equalTo(daifu.mas_bottom).offset(5);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];


    

    

    
//    UIButton* login=[[UIButton alloc]init];
//    [login setTitle:@"登录" forState:UIControlStateNormal];
//    [login setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [self.view addSubview:login];
//    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//    [login mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.view);
//        make.width.height.equalTo(@(80*SCREENWIDTHS));
//    }];
    
    
    
}

//文章
-(void)wenzhangbtnclick{
    
}
//收藏商品
-(void)goodsbtnclick{
    collectiongoodsController*set=[[collectiongoodsController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}
//店铺
-(void)dianpubtnclick{
    followStoreViewController*set=[[followStoreViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}
//待付款
-(void)daifubtnclick{
    
}
//代发货
-(void)daifabtnclick{
    
}
//待收货
-(void)daishoubtnclick{
    
}
//待评价
-(void)daipingbtnclick{
    
}
//退款
-(void)tuikuanbtnclick{
    
}


//全部订单
-(void)allDingdan{
    
}


//登录
-(void)login{
    
    sexViewController *login=[[sexViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 10*SCREENWIDTHS;
    }
    return 0.001*SCREENWIDTHS;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot=[[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, 10*SCREENWIDTHS)];
    foot.backgroundColor=[UIColor clearColor];
    return foot;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001*SCREENWIDTHS;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 0;

    if (section==0) {
        return 3;
    }
    return 1;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45*SCREENWIDTHS;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        static NSString *CellIdentifier = @"myCellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.font=normalFontPER;
            cell.textLabel.textColor=[UIColor grayColor];
            cell.backgroundColor=[UIColor whiteColor];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            

        }

    
    //cell右侧的小箭头
    if (indexPath.section==0) {
        NSLog(@"%@",dataArr);
        
        cell.textLabel.text = [dataArr[indexPath.row] objectForKey:@"title"];
        cell.imageView.image =[UIImage imageNamed: [dataArr[indexPath.row] objectForKey:@"img"]];
    }else{
        cell.textLabel.text = [dataArr[3] objectForKey:@"title"];
        cell.imageView.image = [UIImage imageNamed: [dataArr[3] objectForKey:@"img"]];
    }
    return cell;

}
//点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString*useid=[userDefault savedvalueForKey:userToken];
    if (useid.length==0) {
        [self showMessage:@"请先登录!"];
    }else{
        if (indexPath.section==0) {
            if (indexPath.row==0) {
                
            }else if (indexPath.row==1){
                
            }else{
                
            }
        }else{
            setupViewController*set=[[setupViewController alloc]init];
            [self.navigationController pushViewController:set animated:YES];
        }
    }
    
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
