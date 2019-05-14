//
//  setupViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/10.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "setupViewController.h"
#import "changeNichengViewController.h"
#import "resetPassWViewController.h"

@interface setupViewController ()

@end

@implementation setupViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavBar:@"个人资料" style:REFRESH];
    
    self.view.backgroundColor=bgColorPER;

    
    UILabel*headimglab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    头像" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:headimglab];
    [headimglab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10*SCREENWIDTHS);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //箭头
    UIButton*jian1=[[UIButton alloc]init];
    [jian1 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
//    jian1.backgroundColor=bgColorPER;
//    jian1.image=[UIImage imageNamed:@"形状2拷贝2"];
//    jian1.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:jian1];
    [jian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(headimglab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];

    
    //头像
    headimg=[[UIImageView alloc]init];
    headimg.image=[UIImage imageNamed:@"头像"];
    headimg.layer.masksToBounds=YES;
    headimg.layer.cornerRadius=20*SCREENWIDTHS;
    [self.view addSubview:headimg];
    [headimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.centerY.equalTo(headimglab);
        make.width.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    UIButton*headbtn=[[UIButton alloc]init];
    headbtn.backgroundColor=[UIColor clearColor];
    [headbtn addTarget:self action:@selector(headclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headbtn];
    [headbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(@(200*SCREENWIDTHS));
        make.top.bottom.equalTo(headimglab);
    }];
    
    
    //昵称
    UILabel*nechenglab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    昵称" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:nechenglab];
    [nechenglab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headimglab.mas_bottom).offset(2*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian2=[[UIButton alloc]init];
    [jian2 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [self.view addSubview:jian2];
    [jian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(nechenglab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    //昵称
    nicheng=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:nicheng];
    [nicheng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(nechenglab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*nichengbtn=[[UIButton alloc]init];
    nichengbtn.backgroundColor=[UIColor clearColor];
    [nichengbtn addTarget:self action:@selector(nichengclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nichengbtn];
    [nichengbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(nechenglab);
    }];
    
    
    //性别
    UILabel*sexlab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    性别" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:sexlab];
    [sexlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nechenglab.mas_bottom).offset(2*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian3=[[UIButton alloc]init];
    [jian3 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [self.view addSubview:jian3];
    [jian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(sexlab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //
    sex=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:sex];
    [sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(sexlab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*sexbtn=[[UIButton alloc]init];
    sexbtn.backgroundColor=[UIColor clearColor];
    [sexbtn addTarget:self action:@selector(sexclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sexbtn];
    [sexbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(sexlab);
    }];
    
    
    //出生日期
    UILabel*birthlab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    出生日期" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:birthlab];
    [birthlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sexlab.mas_bottom).offset(2*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian4=[[UIButton alloc]init];
    [jian4 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [self.view addSubview:jian4];
    [jian4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(birthlab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //
    birthday=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:birthday];
    [birthday mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(birthlab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*birthbtn=[[UIButton alloc]init];
    birthbtn.backgroundColor=[UIColor clearColor];
    [birthbtn addTarget:self action:@selector(birthclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:birthbtn];
    [birthbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(birthlab);
    }];
    
    
    
    //用户名
    UILabel*namelab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    用户名" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:namelab];
    [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(birthlab.mas_bottom).offset(10*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian5=[[UIButton alloc]init];
    [jian5 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];

    [self.view addSubview:jian5];
    [jian5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(namelab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //
    name=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(namelab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*namebtn=[[UIButton alloc]init];
    namebtn.backgroundColor=[UIColor clearColor];
    [namebtn addTarget:self action:@selector(nameclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:namebtn];
    [namebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(namelab);
    }];

    
    
    //绑定手机
    UILabel*phonelab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    绑定手机" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:phonelab];
    [phonelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(namelab.mas_bottom).offset(2*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian6=[[UIButton alloc]init];
    [jian6 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [self.view addSubview:jian6];
    [jian6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(phonelab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //
    phone=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(phonelab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*phonebtn=[[UIButton alloc]init];
    phonebtn.backgroundColor=[UIColor clearColor];
    [phonebtn addTarget:self action:@selector(phoneclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phonebtn];
    [phonebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(phonelab);
    }];
    
    
    
    //修改登录密码
    UILabel*paslab=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"    修改登录密码" andTextColor:blackColorPER andFont:normalFontPER andAlignment:0];
    [self.view addSubview:paslab];
    [paslab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phonelab.mas_bottom).offset(2*SCREENWIDTHS);
        make.left.right.equalTo(headimglab);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    //箭头
    UIButton*jian7=[[UIButton alloc]init];
    [jian7 setImage:[UIImage imageNamed:@"形状2拷贝2"] forState:UIControlStateNormal];
    [self.view addSubview:jian7];
    [jian7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(paslab);
        make.width.equalTo(@(50*SCREENWIDTHS));
    }];
    
    
    
    //
    pas=[myUI myUILabelWithBackgroundColor:[UIColor whiteColor] andText:@"" andTextColor:[UIColor grayColor] andFont:normalFontPER andAlignment:2];
    [self.view addSubview:pas];
    [pas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_left);
        make.top.bottom.equalTo(paslab);
        make.width.equalTo(headbtn);
    }];
    
    UIButton*pasbtn=[[UIButton alloc]init];
    pasbtn.backgroundColor=[UIColor clearColor];
    [pasbtn addTarget:self action:@selector(pasclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pasbtn];
    [pasbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jian1.mas_right);
        make.width.equalTo(headbtn);
        make.top.bottom.equalTo(paslab);
    }];


    
}

//点击头像
-(void)headclick{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:@"头像" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //通过拍照上传图片
    UIAlertAction * takingPicAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    //从手机相册中选择上传图片
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.navigationBar.tintColor=[UIColor whiteColor];
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePicker animated:YES completion:nil];
            imagePicker.navigationBar.tintColor=[UIColor whiteColor];
        }
    }];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:takingPicAction];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage* headimage = [info objectForKey:UIImagePickerControllerEditedImage];
    headimg.image=headimage;
    imageData = UIImageJPEGRepresentation(headimage, 0.5);
    
    //    [self saveImage:headimage withName:@"headImage2.png"];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


//点击昵称
-(void)nichengclick{
    changeNichengViewController*set=[[changeNichengViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}
//点击性别
-(void)sexclick{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    shaixuan2=[[UIView alloc]init];
    shaixuan2.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    [window addSubview:shaixuan2];
    [shaixuan2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view);
        make.top.left.right.bottom.equalTo(window);
    }];
    
    UIView* pickerviews = [[UIView alloc] initWithFrame:CGRectMake(0, PHONE_HEIGHT-214*SCREENWIDTHS, PHONE_WIDTH, 214*SCREENWIDTHS)];
    pickerviews.backgroundColor = [UIColor whiteColor];
//    pickerviews.hidden = YES;
    [shaixuan2 addSubview:pickerviews];
    
    UIButton *buttons1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80*SCREENWIDTHS, 50*SCREENWIDTHS)];
    buttons1.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [buttons1 setTitle:@"取消" forState:UIControlStateNormal];
    [buttons1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttons1 addTarget:self action:@selector(getCurrentSelectedInfo1) forControlEvents:UIControlEventTouchUpInside];
    [pickerviews addSubview:buttons1];
    
    UIButton *buttons2 = [[UIButton alloc]initWithFrame:CGRectMake(PHONE_WIDTH-80*SCREENWIDTHS, 0,80*SCREENWIDTHS, 50*SCREENWIDTHS)];
    buttons2.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [buttons2 setTitle:@"确定" forState:UIControlStateNormal];
    [buttons2 setTitleColor:zhuColorPER forState:UIControlStateNormal];
    [buttons2 addTarget:self action:@selector(getCurrentSelectedInfo) forControlEvents:UIControlEventTouchUpInside];
    [pickerviews addSubview:buttons2];
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50*SCREENWIDTHS, PHONE_WIDTH, 130*SCREENWIDTHS)];
    pickerView.backgroundColor = [UIColor whiteColor];
//    pickerView.hidden = YES;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [pickerviews addSubview:pickerView];
    
}

//取消
-(void)getCurrentSelectedInfo1{
    [shaixuan2 removeFromSuperview];
}
//确定
-(void)getCurrentSelectedInfo{
    [shaixuan2 removeFromSuperview];

}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    if (row==0) {
        sex.text=@"女";
    }else{
        sex.text=@"男";
    }
    
}

#pragma mark UIPickerView Delegate Method 代理方法

//指定每行如何展示数据（此处和tableview类似）
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (row==0) {
        return @"女";

    }else{
        return @"男";
    }

}
//点击生日
-(void)birthclick{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    shaixuan2=[[UIView alloc]init];
    shaixuan2.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    [window addSubview:shaixuan2];
    [shaixuan2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.view);
        make.top.left.right.bottom.equalTo(window);
    }];
    
    UIView* pickerviews = [[UIView alloc] initWithFrame:CGRectMake(0, PHONE_HEIGHT-214*SCREENWIDTHS, PHONE_WIDTH, 214*SCREENWIDTHS)];
    pickerviews.backgroundColor = [UIColor whiteColor];
    //    pickerviews.hidden = YES;
    [shaixuan2 addSubview:pickerviews];
    
    UIButton *buttons1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80*SCREENWIDTHS, 50*SCREENWIDTHS)];
    buttons1.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [buttons1 setTitle:@"取消" forState:UIControlStateNormal];
    [buttons1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttons1 addTarget:self action:@selector(getCurrentSelectedInfo1) forControlEvents:UIControlEventTouchUpInside];
    [pickerviews addSubview:buttons1];
    
    UIButton *buttons2 = [[UIButton alloc]initWithFrame:CGRectMake(PHONE_WIDTH-80*SCREENWIDTHS, 0,80*SCREENWIDTHS, 50*SCREENWIDTHS)];
    buttons2.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [buttons2 setTitle:@"确定" forState:UIControlStateNormal];
    [buttons2 setTitleColor:zhuColorPER forState:UIControlStateNormal];
    [buttons2 addTarget:self action:@selector(getCurrentSelectedInfo) forControlEvents:UIControlEventTouchUpInside];
    [pickerviews addSubview:buttons2];
    
    datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50*SCREENWIDTHS, PHONE_WIDTH, 130*SCREENWIDTHS)];
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
    [pickerviews addSubview:datePicker];
//    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self->shaixuan2);
//        make.height.equalTo(@(150*SCREENWIDTHS));
//        make.bottom.equalTo(self->shaixuan2).offset(-30*SCREENWIDTHS);
//    }];
}

- (void)valueChange:(UIDatePicker *)datePicker{
    //创建一个日期格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //设置日期的显示格式
    fmt.dateFormat = @"yyyy-MM-dd";
    //将日期转为指定格式显示
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    birthday.text=dateStr;
}

//点击name
-(void)nameclick{
    changeNichengViewController*set=[[changeNichengViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];

}
//点击绑定手机
-(void)phoneclick{
    
}

//点击修改密码
-(void)pasclick{
    resetPassWViewController*reg=[[resetPassWViewController alloc]init];
//    reg.phoneN=self->messagephone.text;
    [self.navigationController pushViewController:reg animated:YES];
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
