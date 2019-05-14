//
//  sexViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/6.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "sexViewController.h"
#import "loginViewController.h"
#import "interestViewController.h"

@interface sexViewController ()

@end

@implementation sexViewController
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:@"" style: HAOYOUGUANLI];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel*des=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"选择您的性别和年纪" andTextColor:[UIColor blackColor] andFont:[UIFont systemFontOfSize:20*SCREENWIDTHS] andAlignment:1];
    [self.view addSubview:des];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(20*SCREENWIDTHS);
    }];
    
    UILabel*bottomdes=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"完善信息，个性化你的内容" andTextColor:blackColorPER andFont:[UIFont systemFontOfSize:13*SCREENWIDTHS] andAlignment:1];
    [self.view addSubview:bottomdes];
    [bottomdes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(des.mas_bottom).offset(5*SCREENWIDTHS);
    }];
    
    
    boy =[[UIButton alloc] init];
    [boy setImage:[UIImage imageNamed:@"男孩未选中"] forState:UIControlStateNormal];
    [boy setImage:[UIImage imageNamed:@"男孩选中"] forState:UIControlStateSelected];
    
    [boy addTarget:self action:@selector(buttonboy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boy];
    [boy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(65*SCREENWIDTHS);
        make.width.height.equalTo(@(75*SCREENWIDTHS));
        make.top.equalTo(bottomdes).offset(50*SCREENWIDTHS);
    }];
    boy.selected=YES;
    
    
    boydui =[[UIButton alloc] init];
    [boydui setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [boydui addTarget:self action:@selector(buttonboy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boydui];
    [boydui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->boy);
        make.width.height.equalTo(@(34*SCREENWIDTHS));
        make.centerY.equalTo(self->boy.mas_bottom);
    }];
    
    
    girl =[[UIButton alloc] init];
    [girl setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    [girl setImage:[UIImage imageNamed:@"选中-女"] forState:UIControlStateSelected];
    [girl addTarget:self action:@selector(buttongirl) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:girl];
    [girl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-65*SCREENWIDTHS);
        make.width.height.equalTo(@(75*SCREENWIDTHS));
        make.top.equalTo(self->boy);
    }];
    
    
    girldui =[[UIButton alloc] init];
    [girldui setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [girldui addTarget:self action:@selector(buttongirl) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:girldui];
    [girldui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->girl);
        make.width.height.equalTo(self->boydui);
        make.centerY.equalTo(self->girl.mas_bottom);
    }];
    
    girldui.hidden=YES;


    UILabel*choose=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"选择你的生日" andTextColor:[UIColor grayColor] andFont:[UIFont systemFontOfSize:15*SCREENWIDTHS] andAlignment:0];
    [self.view addSubview:choose];
    [choose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50*SCREENWIDTHS);
        make.top.equalTo(self->boy.mas_bottom).offset(50*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-50*SCREENWIDTHS);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    date=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"" andTextColor:[UIColor grayColor] andFont:[UIFont systemFontOfSize:15*SCREENWIDTHS] andAlignment:2];
    [self.view addSubview:date];
    [date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50*SCREENWIDTHS);
        make.top.bottom.equalTo(choose);
        make.right.equalTo(self.view).offset(-50*SCREENWIDTHS);
    }];
    
    
    //显示时间
    UIButton *timeclick=[[UIButton alloc]init];
//    timeclick.backgroundColor=[UIColor grayColor];
    [timeclick addTarget:self action:@selector(dateclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:timeclick];
    [timeclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.equalTo(self->date);
        
    }];

    
    
    //线
    UILabel*xian1=[[UILabel alloc]init];
    xian1.backgroundColor=textColorPER;
    [self.view addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(choose);
        make.top.equalTo(choose.mas_bottom).offset(0*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    buttons =[[UIButton alloc] init];
    buttons.backgroundColor =zhuColorPER;
    [buttons setTitle:@"下一步" forState:UIControlStateNormal];
    buttons.titleLabel.font=[UIFont systemFontOfSize:16*SCREENWIDTHS];
    [[buttons layer]setCornerRadius:20*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xian1);
        make.bottom.equalTo(self.view).offset(-50*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    
    shaixuan2=[[UIView alloc]init];
    shaixuan2.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    [self.view addSubview:shaixuan2];
    shaixuan2.hidden=YES;
    
    UITapGestureRecognizer *shaixuan2tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideshaixuan1:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    //    shaixuan2tap.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [shaixuan2 addGestureRecognizer:shaixuan2tap];
    [shaixuan2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    UIView*bg2=[[UIView alloc]init];
    bg2.backgroundColor=bgColorPER;
    [shaixuan2 addSubview:bg2];
    [bg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self->shaixuan2);
        make.height.equalTo(@(230*SCREENWIDTHS));
    }];

    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.backgroundColor=[UIColor clearColor];
    datePicker.locale=[NSLocale localeWithLocaleIdentifier:@"zh"];
    //设置日期显示的格式
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    //    [datePicker setCalendar:[NSCalendar currentCalendar]];
    //创建一个日期格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //设置日期的显示格式
    fmt.dateFormat = @"yyyy-MM-dd";
    //将日期转为指定格式显示
    NSDate*now=[NSDate date];
    NSString *nowstr=[fmt stringFromDate:now];
    NSDate *maxDate = [fmt dateFromString:nowstr];
//    [datePicker setDate:minDate animated:YES];
    
    
    [datePicker setMaximumDate:maxDate];
    [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [shaixuan2 addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->shaixuan2);
        make.height.equalTo(@(150*SCREENWIDTHS));
        make.bottom.equalTo(self->shaixuan2).offset(-30*SCREENWIDTHS);
    }];
    
    

    

//    UIButton *chongzhi=[[UIButton alloc]init];
//    chongzhi.backgroundColor=[UIColor whiteColor];
//    [chongzhi setTitle:@"重置" forState:UIControlStateNormal];
//    [chongzhi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    chongzhi.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
//
//    [chongzhi addTarget:self action:@selector(datechongzhi) forControlEvents:UIControlEventTouchUpInside];
//    [shaixuan2 addSubview:chongzhi];
//    [chongzhi mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(shaixuan2);
//        make.height.equalTo(@(45*SCREENWIDTHS));
//        make.top.equalTo(datePicker.mas_bottom);
//        make.width.equalTo(@(SCREENWIDTH/2));
//    }];
    
    UIButton *sure=[[UIButton alloc]init];
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    [sure setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [sure addTarget:self action:@selector(datesure) forControlEvents:UIControlEventTouchUpInside];
    sure.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    
    [bg2 addSubview:sure];
    [sure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->shaixuan2);
        make.width.equalTo(@(70*SCREENWIDTHS));
        make.top.equalTo(bg2);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    //

    
}


//下一步
-(void)buttonlogin{
    interestViewController*inter=[[interestViewController alloc]init];
    [self.navigationController pushViewController:inter animated:YES];
}

//选择时间
-(void)dateclick{
    shaixuan2.hidden=NO;

}

//选男
-(void)buttonboy{
    
    boydui.hidden=NO;
    boy.selected=YES;
    girl.selected=NO;
    girldui.hidden=YES;
    
}

//选女
-(void)buttongirl{
    boydui.hidden=YES;
    boy.selected=NO;
    girl.selected=YES;
    girldui.hidden=NO;
}

//时间确定
-(void)datesure{
    
    shaixuan2.hidden=YES;

    
}

//
- (void)valueChange:(UIDatePicker *)datePicker{
    //创建一个日期格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //设置日期的显示格式
    fmt.dateFormat = @"yyyy-MM-dd";
    //将日期转为指定格式显示
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    date.text=dateStr;
}

-(void)hideshaixuan1:(UITapGestureRecognizer*)tap{
    shaixuan2.hidden=YES;
    
}



//点击导航栏右侧按钮
- (void)tapRightButton:(UIButton*)_button{
    
    loginViewController *login=[[loginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];

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
