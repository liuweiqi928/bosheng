//
//  resetPassWViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/27.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "resetPassWViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "HomeViewController.h"

@interface resetPassWViewController ()

@end

@implementation resetPassWViewController
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
    [self initNavBar:@"修改密码" style:REFRESH];

    //密码
    registpas =[[UITextField alloc]init];
    registpas.placeholder = @"请输入6-20位新密码";
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
    [self.view addSubview:registpas];
    [registpas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];
    
    
    
    UILabel*xianre3=[[UILabel alloc]init];
    xianre3.backgroundColor=textColorPER;
    [self.view addSubview:xianre3];
    [xianre3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->registpas);
        make.top.equalTo(self->registpas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    //密码
    registrepas =[[UITextField alloc]init];
    registrepas.placeholder = @"请再次确认密码";
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
    [self.view addSubview:registrepas];
    [registrepas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre3);
        make.top.equalTo(xianre3.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->registpas);
    }];
    
    
    
    UILabel*xianre4=[[UILabel alloc]init];
    xianre4.backgroundColor=textColorPER;
    [self.view addSubview:xianre4];
    [xianre4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xianre3);
        make.top.equalTo(self->registrepas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    
    
    //点击登录
    rebuttons =[[UIButton alloc] init];
    rebuttons.backgroundColor =zhuColorPER;
    [rebuttons setTitle:@"完成" forState:UIControlStateNormal];
    rebuttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[rebuttons layer]setCornerRadius:20*SCREENWIDTHS];
    [rebuttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rebuttons addTarget:self action:@selector(buttonnext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rebuttons];
    [rebuttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xianre3);
        make.bottom.equalTo(self.view).offset(-100*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    
}
//


//验证码按钮

//
-(void)buttonnext{
    
    if (registpas.text.length==0) {
        [self showMessage:@"请输入密码"];
    }else if (![registpas.text isEqualToString: registrepas.text]){
        [self showMessage:@"密码不一致"];
    }else if (registrepas.text.length<6){
        [self showMessage:@"密码不能少于6位"];
    }else{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//        NSDictionary*dic=@{@"phone":_phoneN,@"code":textfieldphone.text,@"password": textfieldpas2.text,@"Rpassword":registrepas.text};
    [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@""] parameters:nil type:2 success:^(id responseObject){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"code"]intValue]==1000) {
            //两种返回
            [userDefault saveValue:self->_phoneN forKey:userName];
            [userDefault saveValue:[[responseObject objectForKey:@"user"]objectForKey:@"id"] forKey:userID];

            HomeViewController *homeVC = [[HomeViewController alloc] init];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = homeVC;
            [window makeKeyAndVisible];

            
        }else {
            [self showMessage:[responseObject objectForKey:@"message"]];
        }
        
    } failure:^(NSError *error){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
    }

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
