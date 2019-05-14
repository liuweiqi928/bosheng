//
//  registerViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "registerViewController.h"
//#import "passWordViewController.h"
//#import "yinsiXieyiViewController.h"

@interface registerViewController ()

@end

@implementation registerViewController
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
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *headImage=[[UIImageView alloc]init];
    headImage.image=[UIImage imageNamed:@"advertisement-businessman-hands-533444的副本"];
    headImage.backgroundColor=[UIColor grayColor];
    [self.view addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(207*SCREENWIDTHS));
        make.top.equalTo(self.view).offset(SafeAreaTop);
    }];
    
    
    //
    UIView *phoneview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 90*SCREENWIDTHS, 40*SCREENWIDTHS)];
    
    textfieldphone.leftViewMode = UITextFieldViewModeAlways;
    textfieldphone.leftView = phoneview;
    

    
    UIImageView*im=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25*SCREENWIDTHS, 40*SCREENWIDTHS)];
    im.image=[UIImage imageNamed:@"phone"];
    [phoneview addSubview:im];
    
    
    
    //86
    baliu=[[UILabel alloc]init];
    baliu.text=@"+86";
    baliu.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    baliu.textAlignment=NSTextAlignmentCenter;
    baliu.textColor=[UIColor lightGrayColor];
    [phoneview addSubview:baliu];
    [baliu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(im.mas_right).offset(5*SCREENWIDTHS);
        make.top.bottom.equalTo(phoneview);
    }];
    
    
    UIImageView*im2=[[UIImageView alloc]init];
    im2.image=[UIImage imageNamed:@"phone"];
    [phoneview addSubview:im2];
    [im2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->baliu.mas_right).offset(5*SCREENWIDTHS);
        make.top.bottom.equalTo(phoneview);
        make.width.equalTo(@(15*SCREENWIDTHS));
    }];
    
    
    
    //请输入手机号
    textfieldphone =[[UITextField alloc]init];
    textfieldphone.placeholder = @"请输入手机号";
    textfieldphone.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    textfieldphone.returnKeyType = UIReturnKeyDone;
    textfieldphone.delegate = self;
    textfieldphone.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:textfieldphone];
    [textfieldphone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.top.equalTo(headImage.mas_bottom).offset(30*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
        make.height.equalTo(@(40*SCREENWIDTHS));
    }];
    
    
    
    UILabel*xian1=[[UILabel alloc]init];
    xian1.backgroundColor=textColorPER;
    [self.view addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->textfieldphone);
        make.top.equalTo(self->textfieldphone.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    //密码
    textfieldcode =[[UITextField alloc]init];
    textfieldcode.placeholder = @"请输入验证码";
    textfieldcode.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    UIImage*imcode=[UIImage imageNamed:@"phone"];
    UIImageView *ivcode = [[UIImageView alloc] initWithImage:imcode];
    ivcode.frame=CGRectMake(0, 0, 40*SCREENWIDTHS, 40*SCREENWIDTHS);
    //设置左侧视图的显示模式
    textfieldcode.leftViewMode = UITextFieldViewModeAlways;
    textfieldcode.leftView = ivcode;
    textfieldcode.returnKeyType = UIReturnKeyDone;
    textfieldcode.delegate = self;
    textfieldcode.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:textfieldcode];
    [textfieldcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(xian1.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->textfieldphone);
    }];
    
    
    
    buttons=[[UIButton alloc]init];
    [buttons setTitle:@"获取验证码" forState:UIControlStateNormal];
    //    [buttons setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self->buttons setBackgroundColor:RGBCOLOR(227, 190, 140)];
    buttons.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonYanzheng) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.height.equalTo(self->textfieldcode);
        make.width.equalTo(@(90*SCREENWIDTHS));
    }];

    
    
    UILabel*xian2=[[UILabel alloc]init];
    xian2.backgroundColor=textColorPER;
    [self.view addSubview:xian2];
    [xian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->textfieldphone);
        make.top.equalTo(self->textfieldcode.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    

    
    
    
    
    
    
    
    
    //密码
    textfieldpas =[[UITextField alloc]init];
    textfieldpas.placeholder = @"输入新密码";
    //    textfieldpas.textColor = [UIColor lightGrayColor];
    textfieldpas.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    
    textfieldpas.returnKeyType = UIReturnKeyDone;
    textfieldpas.delegate = self;
    textfieldpas.keyboardType = UIKeyboardTypeASCIICapable;
    textfieldpas.secureTextEntry = YES;
    [self.view addSubview:textfieldpas];
    [textfieldpas mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(xian2.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->textfieldphone);
    }];
    
    
    
    
    UILabel*xian3=[[UILabel alloc]init];
    xian3.backgroundColor=textColorPER;
    [self.view addSubview:xian3];
    [xian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(self->textfieldpas.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    //新密码
    textfieldpas2 =[[UITextField alloc]init];
    textfieldpas2.placeholder = @"请确认密码";
    textfieldpas2.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    
    textfieldpas2.returnKeyType = UIReturnKeyDone;
    textfieldpas2.delegate = self;
    textfieldpas2.keyboardType = UIKeyboardTypeASCIICapable;
    textfieldpas2.secureTextEntry = YES;
    [self.view addSubview:textfieldpas2];
    [textfieldpas2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(xian3.mas_bottom).offset(10*SCREENWIDTHS);
        make.height.equalTo(self->textfieldphone);
    }];
    
    
    
    
    UILabel*xian4=[[UILabel alloc]init];
    xian4.backgroundColor=textColorPER;
    [self.view addSubview:xian4];
    [xian4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(xian1);
        make.top.equalTo(self->textfieldpas2.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    
    
    
    
    
    //点击注册
    UIButton*reg =[[UIButton alloc] init];
    [reg setImage:[UIImage imageNamed:@"组7"] forState:UIControlStateNormal];
//    [reg setTitle:@"" forState:UIControlStateNormal];
//    reg.backgroundColor=[UIColor colorWithRed:210.0/255 green:110.0/255 blue:87.0/255 alpha:1];
//    [[reg layer]setCornerRadius:20*SCREENWIDTHS];
//
//    [reg setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    reg.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [reg addTarget:self action:@selector(buttonnext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reg];
    [reg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->textfieldpas2.mas_bottom).offset(30*SCREENWIDTHS);
        make.width.equalTo(@(315*SCREENWIDTHS));
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.centerX.equalTo(self.view);
    }];
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20*SCREENWIDTHS, PHONE_HEIGHT-95*SCREENWIDTHS,PHONE_WIDTH-40*SCREENWIDTHS, 40*SCREENWIDTHS)];
    label1.textColor = [UIColor grayColor];
    label1.textAlignment = 1;
    label1.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
    [self.view addSubview:label1];
    NSString *perStr = [NSString stringWithFormat:@"%@",@"《用户协议与隐私政策》"];
    NSString *text = [NSString stringWithFormat:@"%@%@",@"点击下一步代表你已同意",perStr];
    if ([label1 respondsToSelector:@selector(setAttributedText:)]) {
        NSDictionary *attribs = @{NSForegroundColorAttributeName:label1.textColor,
                                  NSFontAttributeName:label1.font
                                  };
    NSMutableAttributedString *attributedText =[[NSMutableAttributedString alloc] initWithString:text attributes:attribs];
        
//        UIColor *aColor =getColor(@"0080ff");
//        NSRange redTextRange =[text rangeOfString:perStr];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
//        [attributedText setAttributes:@{NSForegroundColorAttributeName:aColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:13]} range:redTextRange];
        NSRange contentRange = {11,11};
        [attributedText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
        label1.attributedText = attributedText;
    }
    //协议按钮
    UIButton *buttonssf = [[UIButton alloc]initWithFrame:CGRectMake(PHONE_WIDTH/2, PHONE_HEIGHT-95*SCREENWIDTHS,PHONE_WIDTH-20*SCREENWIDTHS, 40*SCREENWIDTHS)];
    [buttonssf addTarget:self action:@selector(buttonssf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonssf];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

//
-(void)buttonYanzheng{
    if (textfieldphone.text.length==0) {
        [self showMessage:@"请先输入你的手机号"];
    }else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];

        NSDictionary*dic=@{@"phone":textfieldphone.text};
        [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"index.php?m=Home&c=WebQ&a=SendMsg"] parameters:dic type:2 success:^(id responseObject){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"%@",responseObject);
            if ([[responseObject objectForKey:@"code"]intValue]==1000) {
                [self buttonYz];
            }else {
                [self showMessage:[responseObject objectForKey:@"message"]];
            }
            
        } failure:^(NSError *error){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }];
    }
}


//验证码按钮
-(void)buttonYz{
    ///index.php?c=smssend&a=ajaxcode
//    NSString *b = [self.iphoneString substringToIndex:3];
//    NSString *a =[self.iphoneString substringWithRange:NSMakeRange(7,4)];
//    label.text = [NSString stringWithFormat:@"短信已发送到%@****%@",b,a];

    
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->buttons setTitle:@"重新发送" forState:UIControlStateNormal];
                self->buttons.userInteractionEnabled = YES;
                self->buttons.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self->buttons setTitle:[NSString stringWithFormat:@"重新发送(%ds)",timeout] forState:UIControlStateNormal];
                self->buttons.titleLabel.font = [UIFont systemFontOfSize:13*SCREENWIDTHS];
                [self->buttons setBackgroundColor:bgColorPER];
                [UIView commitAnimations];
                self->buttons.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}

//下一步
-(void)buttonnext{
    if (textfieldphone.text.length==0) {
        [self showMessage:@"请先输入你的手机号"];
    }else if (textfieldpas.text.length==0){
        [self showMessage:@"请输入验证码"];
    }else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        NSDictionary*dic=@{@"phone":textfieldphone.text,@"code":textfieldpas.text};
        [httpManager requestWithURLString:[NSString stringWithFormat:@"%@%@",baseUrl,@"index.php?m=Home&c=WebQ&a=Register"] parameters:dic type:2 success:^(id responseObject){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"%@",responseObject);
            if ([[responseObject objectForKey:@"code"]intValue]==1000) {

            }else{
                [self showMessage:[responseObject objectForKey:@"message"]];
            }
            
        } failure:^(NSError *error){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    }
}

//协议
-(void)buttonssf{
    
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
