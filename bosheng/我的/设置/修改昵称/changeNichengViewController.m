//
//  changeNichengViewController.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/10.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "changeNichengViewController.h"

@interface changeNichengViewController ()

@end

@implementation changeNichengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavBar:@"修改用户名" style:REFRESH];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    
    //请输入昵称
    textfieldphone =[[UITextField alloc]init];
    textfieldphone.placeholder = @"请输入昵称";
    UIImage*im=[UIImage imageNamed:@"用户"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:im];
    iv.contentMode=UIViewContentModeScaleAspectFit;
    iv.frame=CGRectMake(0, 0, 30*SCREENWIDTHS, 20*SCREENWIDTHS);
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    textfieldphone.leftViewMode = UITextFieldViewModeAlways;
    textfieldphone.leftView = iv;
    textfieldphone.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    textfieldphone.textColor = [UIColor grayColor];
    textfieldphone.returnKeyType = UIReturnKeyDone;
    textfieldphone.delegate = self;
    textfieldphone.keyboardType = UIKeyboardTypeASCIICapable;
    [self.view addSubview:textfieldphone];
    [textfieldphone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.height.equalTo(@(35*SCREENWIDTHS));
        make.top.equalTo(self.view).offset(40*SCREENWIDTHS);
        make.right.equalTo(self.view).offset(-30*SCREENWIDTHS);
    }];
    
    UILabel*xian1=[[UILabel alloc]init];
    xian1.backgroundColor=textColorPER;
    [self.view addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->textfieldphone);
        make.top.equalTo(self->textfieldphone.mas_bottom).offset(5*SCREENWIDTHS);
        make.height.equalTo(@(1*SCREENWIDTHS));
    }];
    
    UIImageView*des=[[UIImageView alloc]init];
    des.image=[UIImage imageNamed:@"提示组5"];
    [self.view addSubview:des];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.top.equalTo(xian1).offset(20*SCREENWIDTHS);
        make.width.height.equalTo(@(20*SCREENWIDTHS));
    }];
    
    UILabel*deslab=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"用户名只允许修改一次，请谨慎修改" andTextColor:RGBCOLOR(146, 125, 108) andFont:[UIFont systemFontOfSize:12*SCREENWIDTHS] andAlignment:0];
    [self.view addSubview:deslab];
    [deslab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(des.mas_right).offset(15*SCREENWIDTHS);
        make.top.bottom.equalTo(des);
        make.right.equalTo(self.view);
    }];
    
    
    UIImageView*des2=[[UIImageView alloc]init];
    des2.image=[UIImage imageNamed:@"提示组5"];
    [self.view addSubview:des2];
    [des2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*SCREENWIDTHS);
        make.top.equalTo(des.mas_bottom).offset(20*SCREENWIDTHS);
        make.width.height.equalTo(@(20*SCREENWIDTHS));
    }];
    
    UILabel*deslab2=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"用户名要以字母和数字进行组合" andTextColor:RGBCOLOR(146, 125, 108) andFont:[UIFont systemFontOfSize:12*SCREENWIDTHS] andAlignment:0];
    [self.view addSubview:deslab2];
    [deslab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(des.mas_right).offset(15*SCREENWIDTHS);
        make.top.bottom.equalTo(des2);
        make.right.equalTo(self.view);
    }];
    
    //点击登录
    UIButton* buttons =[[UIButton alloc] init];
    buttons.backgroundColor =zhuColorPER;
    [buttons setTitle:@"完成" forState:UIControlStateNormal];
    buttons.titleLabel.font=[UIFont systemFontOfSize:14*SCREENWIDTHS];
    [[buttons layer]setCornerRadius:20*SCREENWIDTHS];
    [buttons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttons addTarget:self action:@selector(buttonsure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40*SCREENWIDTHS));
        make.left.right.equalTo(xian1);
        make.bottom.equalTo(self.view).offset(-90*SCREENWIDTHS);
        make.centerX.equalTo(self.view);
    }];

    
    
    
}


-(void)buttonsure{
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    //tableViews.hidden = YES;
    [self.view endEditing:YES];
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
