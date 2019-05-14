//
//  loginViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "loginViewController.h"
#import "registerViewController.h"
//#import <UMShare/UMShare.h>
#import "phoneNViewController.h"
#import "HomeViewController.h"
#import <CommonCrypto/CommonDigest.h>
//#import "weixinPhoneViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.navigationController.navigationBar.tintColor = [UIColor grayColor]CGColor];


    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    UIImageView *headImage=[[UIImageView alloc]init];
    headImage.image=[UIImage imageNamed:@"WechatIMG22"];
    headImage.backgroundColor=[UIColor clearColor];
    [self.view addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(212*SCREENWIDTHS));
    }];
    
    
    headlogin = [[UIButton alloc] init];
    NSMutableAttributedString*str=[[NSMutableAttributedString alloc]initWithString:@"登录" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENWIDTHS]}];
    NSMutableAttributedString*str2=[[NSMutableAttributedString alloc]initWithString:@"登录" attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:13*SCREENWIDTHS]}];
    
    [headlogin setAttributedTitle:str2 forState:UIControlStateNormal];
    [headlogin setAttributedTitle:str forState:UIControlStateSelected];
    [self.view addSubview:headlogin];
    [headlogin addTarget:self action:@selector(loginType) forControlEvents:UIControlEventTouchUpInside];
    [headlogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10*SCREENWIDTHS);
        make.top.equalTo(headImage.mas_bottom);
        make.height.equalTo(@(50*SCREENWIDTHS));
        make.width.equalTo(@(60*SCREENWIDTHS));
    }];
    headlogin.selected=YES;
    
    loginPoint = [[UIButton alloc] init];
    loginPoint.backgroundColor=zhuColorPER;
    loginPoint.layer.masksToBounds=YES;
    loginPoint.layer.cornerRadius=5*SCREENWIDTHS;
    [self.view addSubview:loginPoint];
    [loginPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->headlogin);
        make.top.equalTo(self->headlogin.mas_bottom).offset(-4*SCREENWIDTHS);;
        make.height.width.equalTo(@(8*SCREENWIDTHS));
    }];
    
    
    
    headreg = [[UIButton alloc] init];
    NSMutableAttributedString*strreg=[[NSMutableAttributedString alloc]initWithString:@"注册" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18*SCREENWIDTHS]}];
    NSMutableAttributedString*strreg2=[[NSMutableAttributedString alloc]initWithString:@"注册" attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:13*SCREENWIDTHS]}];
    [headreg addTarget:self action:@selector(registType) forControlEvents:UIControlEventTouchUpInside];

    [headreg setAttributedTitle:strreg2 forState:UIControlStateNormal];
    [headreg setAttributedTitle:strreg forState:UIControlStateSelected];
    [self.view addSubview:headreg];
    [headreg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->headlogin.mas_right).offset(5*SCREENWIDTHS);
        make.top.bottom.width.equalTo(self->headlogin);
    }];
    
    registPoint = [[UIButton alloc] init];
    registPoint.backgroundColor=zhuColorPER;
    registPoint.layer.masksToBounds=YES;
    registPoint.layer.cornerRadius=5*SCREENWIDTHS;
    [self.view addSubview:registPoint];
    [registPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->headreg);
        make.top.equalTo(self->headreg.mas_bottom).offset(-4*SCREENWIDTHS);
        make.height.width.equalTo(@(8*SCREENWIDTHS));
    }];
    registPoint.hidden=YES;
    
    
    
    
    //密码登录
    codeview=[[UIView alloc]init];
    codeview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:codeview];
    [codeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
    }];
    
    
    
    
    
    
    //请输入手机号
    textfieldphone =[[UITextField alloc]init];
    textfieldphone.placeholder = @"请输入手机号/用户名";
    UIImage*im=[UIImage imageNamed:@"phone"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:im];
    iv.contentMode=UIViewContentModeScaleAspectFit;
    iv.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    textfieldphone.leftViewMode = UITextFieldViewModeAlways;
    textfieldphone.leftView = iv;
    textfieldphone.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    textfieldphone.textColor = [UIColor grayColor];
    textfieldphone.returnKeyType = UIReturnKeyDone;
    textfieldphone.delegate = self;
    textfieldphone.keyboardType = UIKeyboardTypePhonePad;
    [codeview addSubview:textfieldphone];
    [textfieldphone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];
    
    UILabel*xian1=[[UILabel alloc]init];
    xian1.backgroundColor=textColorPER;
    [codeview addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->textfieldphone);
        make.top.equalTo(self->textfieldphone.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    //密码
    textfieldpas =[[UITextField alloc]init];
    textfieldpas.placeholder = @"请输入密码";
    textfieldpas.textColor = [UIColor grayColor];
    textfieldpas.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*impas=[UIImage imageNamed:@"possword拷贝"];
    UIImageView *ivpas = [[UIImageView alloc] initWithImage:impas];
    ivpas.contentMode=UIViewContentModeScaleAspectFit;

    ivpas.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    textfieldpas.leftViewMode = UITextFieldViewModeAlways;
    textfieldpas.leftView = ivpas;
    UIButton*showpas=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS)];
    [showpas setImage:[UIImage imageNamed:@"组5"] forState:UIControlStateNormal];
    [showpas setImage:[UIImage imageNamed:@"WechatIMG14"] forState:UIControlStateSelected];
    [showpas addTarget:self action:@selector(showpass:) forControlEvents:UIControlEventTouchUpInside];
    //设置右侧视图的显示模式
    textfieldpas.rightViewMode = UITextFieldViewModeAlways;
    textfieldpas.rightView = showpas;

    
    
    
    textfieldpas.returnKeyType = UIReturnKeyDone;
    textfieldpas.delegate = self;
    textfieldpas.keyboardType = UIKeyboardTypeASCIICapable;
    textfieldpas.secureTextEntry = YES;
    [codeview addSubview:textfieldpas];
    [textfieldpas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(xian1.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->textfieldphone);
    }];
    
    

    
    UILabel*xian2=[[UILabel alloc]init];
    xian2.backgroundColor=textColorPER;
    [codeview addSubview:xian2];
    [xian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(self->textfieldpas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    



    
    
    //点击
    UIButton*reg =[[UIButton alloc]init];
    [reg setTitle:@"验证码登录" forState:UIControlStateNormal];
    reg.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [reg setTitleColor:blackColorPER forState:UIControlStateNormal];
    reg.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [reg addTarget:self action:@selector(buttonpaslogin) forControlEvents:UIControlEventTouchUpInside];
    [codeview addSubview:reg];
    [reg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->textfieldpas);
        make.top.equalTo(xian2.mas_bottom).offset(10*SCREENWIDTHS);
        make.width.equalTo(@(100*SCREENWIDTHS));
        make.height.equalTo(@(34*SCREENWIDTHS));
    }];
    
    //点击忘记
    UIButton*forget =[[UIButton alloc] init];
    [forget setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forget.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [forget setTitleColor:blackColorPER forState:UIControlStateNormal];
    forget.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [forget addTarget:self action:@selector(buttonwangji) forControlEvents:UIControlEventTouchUpInside];
    [codeview addSubview:forget];
    [forget mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->textfieldphone);
        make.top.height.equalTo(reg);
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];
    
    
    //点击登录
    buttons =[[UIButton alloc] init];
    buttons.backgroundColor =zhuColorPER;
    [buttons setTitle:@"登录" forState:UIControlStateNormal];
    buttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[buttons layer]setCornerRadius:20*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonlogin) forControlEvents:UIControlEventTouchUpInside];
    [codeview addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xian2);
        make.top.equalTo(self->textfieldpas.mas_bottom).offset(70*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    
    
    
    
    
    
    
    
    
    //验证码登录
    messageview=[[UIView alloc]init];
    messageview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:messageview];
    [messageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
    }];
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
    [messageview addSubview:messagephone];
    [messagephone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];
    
    UILabel*xianme=[[UILabel alloc]init];
    xianme.backgroundColor=textColorPER;
    [messageview addSubview:xianme];
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
    [messageview addSubview:messagepas];
    [messagepas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(xian1.mas_bottom).offset(10*SCREENWIDTHS);
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
    [messageview addSubview:loginmess];
    [loginmess mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(self->messagepas);
        make.height.equalTo(@(25*SCREENWIDTHS));
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];
    
    
    
    
    UILabel*xianme2=[[UILabel alloc]init];
    xianme2.backgroundColor=textColorPER;
    [messageview addSubview:xianme2];
    [xianme2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(self->messagepas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    
    
    
    
    //点击注册
    UIButton*mereg =[[UIButton alloc]init];
    [mereg setTitle:@"密码登录" forState:UIControlStateNormal];
    mereg.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [mereg setTitleColor:blackColorPER forState:UIControlStateNormal];
    mereg.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [mereg addTarget:self action:@selector(mimalogin) forControlEvents:UIControlEventTouchUpInside];
    [messageview addSubview:mereg];
    [mereg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->messagepas);
        make.top.equalTo(xianme2.mas_bottom).offset(10*SCREENWIDTHS);
        make.width.equalTo(@(100*SCREENWIDTHS));
        make.height.equalTo(@(34*SCREENWIDTHS));
    }];
    
    //点击忘记
    UIButton*meforget =[[UIButton alloc] init];
    [meforget setTitle:@"忘记密码？" forState:UIControlStateNormal];
    meforget.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [meforget setTitleColor:blackColorPER forState:UIControlStateNormal];
    meforget.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [meforget addTarget:self action:@selector(buttonwangji) forControlEvents:UIControlEventTouchUpInside];
    [messageview addSubview:meforget];
    [meforget mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->messagephone);
        make.top.height.equalTo(mereg);
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];
    
    
    //点击登录
    mebuttons =[[UIButton alloc] init];
    mebuttons.backgroundColor =zhuColorPER;
    [mebuttons setTitle:@"登录" forState:UIControlStateNormal];
    mebuttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[mebuttons layer]setCornerRadius:20*SCREENWIDTHS];
    [mebuttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mebuttons addTarget:self action:@selector(messagebuttonlogin) forControlEvents:UIControlEventTouchUpInside];
    [messageview addSubview:mebuttons];
    [mebuttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xianme2);
        make.top.equalTo(self->messagepas.mas_bottom).offset(70*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    
    


    //注册
    registview=[[UIView alloc]init];
    registview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:registview];
    [registview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
    }];

//
//
//
//
//
    //请输入手机号
    registphone =[[UITextField alloc]init];
    registphone.placeholder = @"请输入手机号";
    UIView *phoneview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 90*SCREENWIDTHS, 40*SCREENWIDTHS)];





    UIImageView*reimph=[[UIImageView alloc]initWithFrame:CGRectMake(0, 10*SCREENWIDTHS, 30*SCREENWIDTHS, 20*SCREENWIDTHS)];
    reimph.image=[UIImage imageNamed:@"phone"];
    reimph.contentMode=UIViewContentModeScaleAspectFit;
    [phoneview addSubview:reimph];



    //86
    baliu=[[UILabel alloc]init];
    baliu.text=@"+86";
    baliu.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    baliu.textAlignment=NSTextAlignmentCenter;
    baliu.textColor=[UIColor lightGrayColor];
    [phoneview addSubview:baliu];
    [baliu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(reimph.mas_right).offset(5*SCREENWIDTHS);
        make.top.bottom.equalTo(phoneview);
    }];

    //
    UIImageView*jianim=[[UIImageView alloc]init];
    jianim.image=[UIImage imageNamed:@""];
    jianim.contentMode=UIViewContentModeScaleAspectFit;
    [phoneview addSubview:jianim];
    [jianim mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->baliu.mas_right).offset(5*SCREENWIDTHS);
        make.top.bottom.equalTo(phoneview);
        make.right.equalTo(phoneview);
    }];



    UIButton*clickArea=[[UIButton alloc]init];
    clickArea.backgroundColor=[UIColor clearColor];
    [clickArea addTarget:self action:@selector(clickAreabtn) forControlEvents:UIControlEventTouchUpInside];
    [phoneview addSubview:clickArea];
    [clickArea mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(phoneview);
    }];



    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    registphone.leftViewMode = UITextFieldViewModeAlways;
    registphone.leftView = phoneview;
    registphone.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    registphone.textColor = [UIColor grayColor];
    registphone.returnKeyType = UIReturnKeyDone;
    registphone.delegate = self;
    registphone.keyboardType = UIKeyboardTypePhonePad;
    [registview addSubview:registphone];
    [registphone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self->headlogin.mas_bottom).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];





    UILabel*xianre=[[UILabel alloc]init];
    xianre.backgroundColor=textColorPER;
    [registview addSubview:xianre];
    [xianre mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->registphone);
        make.top.equalTo(self->registphone.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];


    //密码
    registcode =[[UITextField alloc]init];
    registcode.placeholder = @"请输入短信验证码";
    registcode.textColor = [UIColor grayColor];
    registcode.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*recod=[UIImage imageNamed:@"组7me"];
    UIImageView *ivrecod = [[UIImageView alloc] initWithImage:recod];
    ivrecod.contentMode=UIViewContentModeScaleAspectFit;

    ivrecod.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 15*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    registcode.leftViewMode = UITextFieldViewModeAlways;
    registcode.leftView = ivrecod;



    registcode.returnKeyType = UIReturnKeyDone;
    registcode.delegate = self;
    
    registcode.keyboardType = UIKeyboardTypeASCIICapable;
    [registview addSubview:registcode];
    [registcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(xianre.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->registphone);
    }];


    //短信验证码
    regmess=[[UIButton alloc]init];
    [regmess setTitle:@"验证码" forState:UIControlStateNormal];
    [regmess setBackgroundColor:RGBCOLOR(255, 237, 219)];
    regmess.layer.masksToBounds=YES;
    regmess.layer.cornerRadius=12*SCREENWIDTHS;
    regmess.titleLabel.font = [UIFont systemFontOfSize:12*SCREENWIDTHS];
    [regmess setTitleColor:zhuColorPER forState:UIControlStateNormal];
    [regmess addTarget:self action:@selector(registsend) forControlEvents:UIControlEventTouchUpInside];
    [registview addSubview:regmess];
    [regmess mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(self->registcode);
        make.height.equalTo(@(25*SCREENWIDTHS));
        make.width.equalTo(@(100*SCREENWIDTHS));
    }];




    UIView*xianre2=[[UIView alloc]init];
    xianre2.backgroundColor=textColorPER;
    [registview addSubview:xianre2];
    [xianre2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(self->registcode.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];




    //密码
    registpas =[[UITextField alloc]init];
    registpas.placeholder = @"6-20位登录密码";
    registpas.textColor = [UIColor grayColor];
    registpas.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*repas=[UIImage imageNamed:@"possword拷贝"];
    UIImageView *ivrepas = [[UIImageView alloc] initWithImage:repas];
    ivrepas.contentMode=UIViewContentModeScaleAspectFit;
    ivrepas.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    registpas.leftViewMode = UITextFieldViewModeAlways;
    registpas.leftView = ivrepas;



    registpas.returnKeyType = UIReturnKeyDone;
    registpas.delegate = self;
    registpas.keyboardType = UIKeyboardTypeASCIICapable;
    [registview addSubview:registpas];
    [registpas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(xianre2.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->registphone);
    }];



    UILabel*xianre3=[[UILabel alloc]init];
    xianre3.backgroundColor=textColorPER;
    [registview addSubview:xianre3];
    [xianre3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(self->registpas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];


    //密码
    registrepas =[[UITextField alloc]init];
    registrepas.placeholder = @"再次确认密码";
    registrepas.textColor = [UIColor grayColor];
    registrepas.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*repass=[UIImage imageNamed:@"possword拷贝"];
    UIImageView *ivrepass = [[UIImageView alloc] initWithImage:repass];
    ivrepass.contentMode=UIViewContentModeScaleAspectFit;
    ivrepass.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    registrepas.leftViewMode = UITextFieldViewModeAlways;
    registrepas.leftView = ivrepass;



    registrepas.returnKeyType = UIReturnKeyDone;
    registrepas.delegate = self;
    registrepas.keyboardType = UIKeyboardTypeASCIICapable;
    [registview addSubview:registrepas];
    [registrepas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(xianre3.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->registphone);
    }];



    UILabel*xianre4=[[UILabel alloc]init];
    xianre4.backgroundColor=textColorPER;
    [registview addSubview:xianre4];
    [xianre4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre);
        make.top.equalTo(self->registrepas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];




    //点击登录
    rebuttons =[[UIButton alloc] init];
    rebuttons.backgroundColor =zhuColorPER;
    [rebuttons setTitle:@"立即注册" forState:UIControlStateNormal];
    rebuttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[rebuttons layer]setCornerRadius:20*SCREENWIDTHS];
    [rebuttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rebuttons addTarget:self action:@selector(buttonRegist) forControlEvents:UIControlEventTouchUpInside];
    [registview addSubview:rebuttons];
    [rebuttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xianre2);
        make.top.equalTo(xianre4.mas_bottom).offset(20*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];

    UIButton*xieyi =[[UIButton alloc] init];
    [xieyi setTitle:@"注册即代表您同意《用户协议及隐私政策》" forState:UIControlStateNormal];
    xieyi.titleLabel.font=[UIFont systemFontOfSize:11*SCREENWIDTHS];
    [xieyi setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [xieyi addTarget:self action:@selector(xieyiclick) forControlEvents:UIControlEventTouchUpInside];
    [registview addSubview:xieyi];
    [xieyi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(20*SCREENWIDTHS));
        make.left.right.equalTo(xianre2);
        make.top.equalTo(self->rebuttons.mas_bottom).offset(12*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    
    
    [self.view bringSubviewToFront:codeview];


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

//发送注册验证码
-(void)registsend{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary*dic=@{@"phoneNumber":registphone.text,@"templateType":@"0"};
    
    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"SMSAuthorize/AlibabaSMSAuthorize"] parameters:dic type:2 success:^(id responseObject){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"code"]intValue]==200) {

            [self registmessage];
        }else{
            [self showMessage:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(NSError *error){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    

}

-(void)registmessage{

    
    
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->regmess setTitle:@"重新发送" forState:UIControlStateNormal];
                self->regmess.userInteractionEnabled = YES;
                self->regmess.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self->regmess setTitle:[NSString stringWithFormat:@"%ds后重新发送",timeout] forState:UIControlStateNormal];
                self->regmess.titleLabel.font = [UIFont systemFontOfSize:11*SCREENWIDTHS];
                //                [self->regmess setBackgroundColor:bgColorPER];
                [UIView commitAnimations];
                self->regmess.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);

}


//选择注册页面
-(void)registType{
    headlogin.selected=NO;
    headreg.selected=YES;
    registPoint.hidden=NO;
    loginPoint.hidden=YES;
    [self.view bringSubviewToFront:registview];

}

//选择区号
-(void)clickAreabtn{
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow ;
    bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT)];
    bgview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
    [window addSubview:bgview];
    
    UIView *bottomview=[[UIView alloc]init];
    bottomview.backgroundColor=[UIColor whiteColor];
    [bgview addSubview:bottomview];
    [bottomview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self->bgview);
        make.height.equalTo(@(200*SCREENWIDTHS));
    }];
    
    
    UILabel*des=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"选择所在城市" andTextColor:[UIColor grayColor] andFont:[UIFont systemFontOfSize:14*SCREENWIDTHS] andAlignment:1];
    [bottomview addSubview:des];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bottomview);
        make.top.equalTo(bottomview);
        make.height.equalTo(@(50*SCREENWIDTHS));
    }];
    
    //
    UIButton*cancel =[[UIButton alloc] init];
    [cancel setImage:[UIImage imageNamed:@"times"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:cancel];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(50*SCREENWIDTHS));
        make.top.right.equalTo(bottomview);
    }];
    
    
    
    boy =[[UIButton alloc] init];
    [boy setImage:[UIImage imageNamed:@"男孩未选中"] forState:UIControlStateNormal];
    [boy setImage:[UIImage imageNamed:@"男孩选中"] forState:UIControlStateSelected];
    
    [boy addTarget:self action:@selector(buttonboy) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:boy];
    [boy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(65*SCREENWIDTHS);
        make.width.height.equalTo(@(75*SCREENWIDTHS));
        make.top.equalTo(bottomview).offset(60*SCREENWIDTHS);
    }];
    boy.selected=YES;
    
    
    boydui =[[UIButton alloc] init];
    [boydui setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [boydui addTarget:self action:@selector(buttonboy) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:boydui];
    [boydui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->boy);
        make.width.height.equalTo(@(34*SCREENWIDTHS));
        make.centerY.equalTo(self->boy.mas_bottom);
    }];
    
    
    UILabel*dalu=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"中国大陆" andTextColor:[UIColor grayColor] andFont:[UIFont systemFontOfSize:13*SCREENWIDTHS] andAlignment:1];
    [bottomview addSubview:dalu];
    [dalu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->boy);
        make.top.equalTo(self->boy.mas_bottom).offset(20*SCREENWIDTHS);
        make.height.equalTo(@(20*SCREENWIDTHS));
    }];
    
    
    girl =[[UIButton alloc] init];
    [girl setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    [girl setImage:[UIImage imageNamed:@"选中-女"] forState:UIControlStateSelected];
    [girl addTarget:self action:@selector(buttongirl) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:girl];
    [girl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-65*SCREENWIDTHS);
        make.width.height.equalTo(@(75*SCREENWIDTHS));
        make.top.equalTo(self->boy);
    }];
    
    
    
    girldui =[[UIButton alloc] init];
    [girldui setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [girldui addTarget:self action:@selector(buttongirl) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:girldui];
    [girldui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->girl);
        make.width.height.equalTo(self->boydui);
        make.centerY.equalTo(self->girl.mas_bottom);
    }];
    
    UILabel*hongkong=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"中国香港" andTextColor:[UIColor grayColor] andFont:[UIFont systemFontOfSize:13*SCREENWIDTHS] andAlignment:1];
    [bottomview addSubview:hongkong];
    [hongkong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->girl);
        make.top.equalTo(self->girl.mas_bottom).offset(20*SCREENWIDTHS);
        make.height.equalTo(@(20*SCREENWIDTHS));
    }];

    
    girldui.hidden=YES;
    
    


}

//选大陆
-(void)buttonboy{
    
    boydui.hidden=NO;
    boy.selected=YES;
    girl.selected=NO;
    girldui.hidden=YES;
    
    baliu.text=@"+86";
    
}

//选香港
-(void)buttongirl{
    boydui.hidden=YES;
    boy.selected=NO;
    girl.selected=YES;
    girldui.hidden=NO;
    baliu.text=@"+853";

}

//关闭
-(void)cancel{
    [bgview removeFromSuperview];
}


//选择登录页面
-(void)loginType{
    headlogin.selected=YES;
    headreg.selected=NO;
    registPoint.hidden=YES;
    loginPoint.hidden=NO;
    
    [self.view bringSubviewToFront:codeview];


}


-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    //tableViews.hidden = YES;
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

//显示密码
-(void)showpass:(UIButton*)btn{
    if (btn.selected==YES) {
        btn.selected=NO;
        textfieldpas.secureTextEntry=YES;

    }else{
        btn.selected=YES;
        textfieldpas.secureTextEntry=NO;
    }
}

//注册
-(void)buttonRegist{
    if (registphone.text.length==0) {
        [self showMessage:@"请输入手机号"];
    }else if(registcode.text.length==0){
        [self showMessage:@"请输入验证码"];
        
    }else if(registpas.text.length==0){
        [self showMessage:@"请输入密码"];
        
    }else if(![registrepas.text isEqualToString:registrepas.text]){
        [self showMessage:@"密码不一致"];
        
    }else{
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        NSDictionary*dic=@{@"phoneNumber":registphone.text,@"password":registpas.text};
        
        [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"User/RegisterUser"] parameters:dic type:2 success:^(id responseObject){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"%@",responseObject);
            if ([[responseObject objectForKey:@"code"]intValue]==200) {
                
                [self.view bringSubviewToFront:self->codeview];

                
            }else{
                [self showMessage:[responseObject objectForKey:@"msg"]];
            }
            
        } failure:^(NSError *error){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }];
        
    }
}






//验证码登录
-(void)messagebuttonlogin{
    if (messagephone.text.length==0) {
        [self showMessage:@"请输入手机号"];
    }else if(messagepas.text.length==0){
        [self showMessage:@"请输入验证码"];
        
    }else{
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        NSDictionary*dic=@{@"username":messagephone.text,@"password":messagepas.text};
        
        [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"User/LoginUserBySms"] parameters:dic type:2 success:^(id responseObject){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"%@",responseObject);
            if ([[responseObject objectForKey:@"code"]intValue]==200) {
                [userDefault saveValue:self->messagephone.text forKey:userName];
                NSLog(@"登录成功--%@",[userDefault savedvalueForKey:userName]);
                [userDefault saveValue:[responseObject objectForKey:@"accessToken"] forKey:userToken];
                
                HomeViewController *homeVC = [[HomeViewController alloc] init];
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                window.rootViewController = homeVC;
                [window makeKeyAndVisible];
                
            }else{
                [self showMessage:[responseObject objectForKey:@"msg"]];
            }
            
        } failure:^(NSError *error){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }];
        
    }

}


//密码登录
-(void)buttonlogin{
    
    if (textfieldphone.text.length==0) {
        [self showMessage:@"请输入手机号"];
    }else if(textfieldpas.text.length==0){
        [self showMessage:@"请输入密码"];

    }else{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
        NSDictionary*dic=@{@"username":textfieldphone.text,@"password":textfieldpas.text,@"client_id":@"Client",@"client_secret": @"Secret",@"grant_type":@"password",@"role":@"User"};
        
    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"User/LoginByPassword"] parameters:dic type:2 success:^(id responseObject){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"code"]intValue]==200) {
            [userDefault saveValue:self->textfieldphone.text forKey:userName];
            NSLog(@"登录成功--%@",[userDefault savedvalueForKey:userName]);
            [userDefault saveValue:[responseObject objectForKey:@"accessToken"] forKey:userToken];

            HomeViewController *homeVC = [[HomeViewController alloc] init];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = homeVC;
            [window makeKeyAndVisible];

        }else{
            [self showMessage:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(NSError *error){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];

    }
}

//点击协议
-(void)xieyiclick{
    
}



-(NSString *)md5:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0],result[1],result[2],result[3],
             result[4],result[5],result[6],result[7],
             result[8],result[9],result[10],result[11],
             result[12],result[13],result[14],result[15]]lowercaseString];;
    
}

//点击密码登录
-(void)mimalogin{
    [self.view bringSubviewToFront:codeview];

}


//点击验证码登录
-(void)buttonpaslogin{
    [self.view bringSubviewToFront:messageview];


}

//点击忘记
-(void)buttonwangji{
    phoneNViewController*reg=[[phoneNViewController alloc]init];
    [self.navigationController pushViewController:reg animated:YES];

}

-(void)btnControl{
    
    [self.navigationController popViewControllerAnimated:YES];
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
