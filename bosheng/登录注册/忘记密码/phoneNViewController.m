//
//  phoneNViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/27.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "phoneNViewController.h"
#import "resetPassWViewController.h"

@interface phoneNViewController ()

@end

@implementation phoneNViewController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:@"忘记密码" style:REFRESH];
    

    //请输入手机号
    //请输入手机号
    messagephone =[[UITextField alloc]init];
    messagephone.placeholder = @"请输入手机号/用户名";
    UIImage*imme=[UIImage imageNamed:@"phone"];
    UIImageView *ivme = [[UIImageView alloc] initWithImage:imme];
    ivme.contentMode=UIViewContentModeScaleAspectFit;
    ivme.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    messagephone.leftViewMode = UITextFieldViewModeAlways;
    messagephone.leftView = ivme;
    messagephone.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    messagephone.textColor = [UIColor grayColor];
    messagephone.returnKeyType = UIReturnKeyDone;
    messagephone.delegate = self;
    messagephone.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:messagephone];
    [messagephone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];
    
    UILabel*xianme=[[UILabel alloc]init];
    xianme.backgroundColor=textColorPER;
    [self.view addSubview:xianme];
    [xianme mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->messagephone);
        make.top.equalTo(self->messagephone.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    //密码
    messagepas =[[UITextField alloc]init];
    messagepas.placeholder = @"请输入短信验证码";
    messagepas.textColor = [UIColor grayColor];
    messagepas.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*mepas=[UIImage imageNamed:@"组7me"];
    UIImageView *ivmepas = [[UIImageView alloc] initWithImage:mepas];
    ivmepas.contentMode=UIViewContentModeScaleAspectFit;
    
    ivmepas.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 15*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    messagepas.leftViewMode = UITextFieldViewModeAlways;
    messagepas.leftView = ivmepas;
    
    
    
    messagepas.returnKeyType = UIReturnKeyDone;
    messagepas.delegate = self;
    messagepas.keyboardType = UIKeyboardTypeASCIICapable;
    [self.view addSubview:messagepas];
    [messagepas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianme);
        make.top.equalTo(xianme.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->messagephone);
    }];
    
    
    //短信验证码
    loginmess=[[UIButton alloc]init];
    [loginmess setTitle:@"验证码" forState:UIControlStateNormal];
    //    [buttons setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    loginmess.layer.masksToBounds=YES;
    loginmess.layer.cornerRadius=12*SCREENWIDTHS;
    [loginmess setBackgroundColor:RGBCOLOR(255, 237, 219)];
    loginmess.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
    [loginmess setTitleColor:zhuColorPER forState:UIControlStateNormal];
    [loginmess addTarget:self action:@selector(loginsend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginmess];
    [loginmess mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(self->messagepas);
        make.height.equalTo(@(25*SCREENWIDTHS));
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];
    
    
    
    
    UILabel*xianme2=[[UILabel alloc]init];
    xianme2.backgroundColor=textColorPER;
    [self.view addSubview:xianme2];
    [xianme2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianme);
        make.top.equalTo(self->messagepas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    
    //点击
    buttons =[[UIButton alloc] init];
    buttons.backgroundColor =zhuColorPER;
    [buttons setTitle:@"完成" forState:UIControlStateNormal];
    buttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[buttons layer]setCornerRadius:20*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonnext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xianme);
        make.bottom.equalTo(self.view).offset(-100*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

//验证码按钮
-(void)loginsend{
    ///index.php?c=smssend&a=ajaxcode
    //    NSString *b = [self.iphoneString substringToIndex:3];
    //    NSString *a =[self.iphoneString substringWithRange:NSMakeRange(7,4)];
    //    label.text = [NSString stringWithFormat:@"短信已发送到%@****%@",b,a];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary*dic=@{@"phoneNumber":messagephone.text,@"templateType":@"0"};
    
    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"SMSAuthorize/AlibabaSMSAuthorize"] parameters:dic type:2 success:^(id responseObject){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"code"]intValue]==200) {
            
            [self loginmessage];
        }else{
            [self showMessage:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(NSError *error){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    
    
    
}


-(void)loginmessage{
    
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->loginmess setTitle:@"重新发送" forState:UIControlStateNormal];
                self->loginmess.userInteractionEnabled = YES;
                self->loginmess.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self->loginmess setTitle:[NSString stringWithFormat:@"%ds后重新发送",timeout] forState:UIControlStateNormal];
                self->loginmess.titleLabel.font = [UIFont systemFontOfSize:11*SCREENWIDTHS];
                //                [self->loginmess setBackgroundColor:bgColorPER];
                [UIView commitAnimations];
                self->loginmess.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


-(void)buttonnext{
    
//    if (textfieldphone.text.length==0) {
//        [self showMessage:@"请输入手机号"];
//    }else{
//
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
//    NSDictionary*dic=@{@"phone":textfieldphone.text};
//    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@""] parameters:dic type:2 success:^(id responseObject){
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        NSLog(@"%@",responseObject);
//        if ([[responseObject objectForKey:@"code"]intValue]==1000) {
            resetPassWViewController*reg=[[resetPassWViewController alloc]init];
            reg.phoneN=self->messagephone.text;
            [self.navigationController pushViewController:reg animated:YES];
//
//        }else {
//            [self showMessage:[responseObject objectForKey:@"message"]];
//        }
//
//    } failure:^(NSError *error){
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//
//    }];
//
//    }

}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
