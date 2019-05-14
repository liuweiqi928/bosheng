//
//  interestViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/6.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "interestViewController.h"
#import "loginViewController.h"

@interface interestViewController ()

@end

@implementation interestViewController
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:@"选择兴趣标签" style: REFRESH];
    
    sortResultArr=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    interArr=[[NSMutableArray alloc]init];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel*des=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"选择你喜欢的内容" andTextColor:[UIColor blackColor] andFont:[UIFont systemFontOfSize:20*SCREENWIDTHS] andAlignment:1];
    [self.view addSubview:des];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(20*SCREENWIDTHS);
    }];
    
    UILabel*bottomdes=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"最多选择五个兴趣标签" andTextColor:blackColorPER andFont:[UIFont systemFontOfSize:13*SCREENWIDTHS] andAlignment:1];
    [self.view addSubview:bottomdes];
    [bottomdes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(des.mas_bottom).offset(5*SCREENWIDTHS);
    }];
    
    buttons =[[UIButton alloc] init];
    buttons.backgroundColor =zhuColorPER;
    [buttons setTitle:@"完成" forState:UIControlStateNormal];
    buttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[buttons layer]setCornerRadius:20*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.equalTo(self.view).offset(50*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-50*SCREENWIDTHS);
        make.bottom.equalTo(self.view).offset(-50*SCREENWIDTHS);
    }];
    
    
    bgview=[[UIScrollView alloc]init];
    bgview.contentSize=CGSizeMake(PHONE_WIDTH, 350*SCREENWIDTHS);
    [self.view addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(bottomdes.mas_bottom).offset(50*SCREENWIDTHS);
        make.bottom.equalTo(self->buttons.mas_top).offset(-50*SCREENWIDTHS);
    }];
    
    
    

    [self headfenlei];

}

- (void)buttonlogin{
    
    loginViewController *login=[[loginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    
}

-(void)headfenlei{
    [bgview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    float Start_X = 50*SCREENWIDTHS;      // 第一个按钮的X坐标
    float Start_Y = 10*SCREENWIDTHS;      // 第一个按钮的Y坐标
    float Width_Space = 25*SCREENWIDTHS;   // 2个按钮之间的横间距
    float Height_Space = 50*SCREENWIDTHS;  // 竖间距
    // 每个按钮的宽度 记住 一定要把一行中多有按钮的边距都要算上并减掉 不然按钮会跑到屏幕外面去 这个5就是5个间距(左右各一个加中间3个间距) 4就是一行4个
    float width = (PHONE_WIDTH - 7 * Width_Space)/4;
    float height =width; // 按钮高度
    
    for (int i = 0; i < sortResultArr.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        NSInteger index = i % 4; // 一行4个
        NSInteger page = i / 4;  // 列数
        button.frame = CGRectMake(index * (width + Width_Space) + Start_X, page  * (height + Height_Space)+Start_Y,width , height);
        // 设置字体大小
        
//            [button sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",homepage,[sortResultArr[i] objectForKey:@"picture"]]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        button.backgroundColor=bgColorPER;
        
        [button addTarget:self action:@selector(fenlei:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton*lab=[[UIButton alloc]init];

//            [lab setTitle:[sortResultArr[i] objectForKey:@"name"] forState:UIControlStateNormal];
        [lab setTitle:@"测试" forState:UIControlStateNormal];

        [lab setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        lab.titleLabel.font=[UIFont systemFontOfSize:13*SCREENWIDTHS];
        lab.tag = i;
        [lab addTarget:self action:@selector(fenlei:) forControlEvents:UIControlEventTouchUpInside];
        
        //按钮事件
        [bgview addSubview:button];
        [bgview addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(button).offset(-5*SCREENWIDTHS);
            make.top.equalTo(button.mas_bottom).offset(5*SCREENWIDTHS);
            make.height.equalTo(@(20*SCREENWIDTHS));
            make.right.equalTo(button).offset(5*SCREENWIDTHS);
        }];
        
    }
    
}

//点击分类
-(void)fenlei:(UIButton*)btn{

    
    if (btn.selected) {
        btn.selected=NO;
        [interArr removeObject:[sortResultArr objectAtIndex:btn.tag]];
    }else{
        if (interArr.count>=5) {
            [self showMessage:@"最多选择五个标签"];
        }else{
            btn.selected=YES;
            [interArr addObject:[sortResultArr objectAtIndex:btn.tag]];
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
