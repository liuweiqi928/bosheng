//
//  baseViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "baseViewController.h"

@interface baseViewController ()

@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];

}

- (void)initNavBar:(NSString*)title style:(RightButtonStyle)_style{
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(230,55,50, 44)];
    label.text =title;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:13];
    
    self.navigationItem.titleView = label;
    _buttonStyle = _style;
    switch (_style) {
        case FINANC:{
            //mero_icon_ubg_nor
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"licaishi_btn_info_nor"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case XUANZHE:{
            //添加
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case REFRESH:{
            //无按钮
            
        }
            break;
        case ALERT:{
            //保存
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 40, 30);
            [backBtn setTitle:@"保存" forState: UIControlStateNormal];
            backBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
            [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case CUSTOMSTYLE:{
            //分享
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"矢量智能对象-1"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case LOGIN:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 80, 30);
            [backBtn setTitle:@"发布" forState: UIControlStateNormal];
            [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            backBtn.titleLabel.font = [UIFont systemFontOfSize: 15];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
            
        }
            break;
            
        case DELETEBZ:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 50, 30);
            [backBtn setTitle:@"删除" forState: UIControlStateNormal];
            [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            backBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
            
        }
            break;
        case UNLOGIN:{
            //            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录/注册" style:UIBarButtonItemStylePlain target:self action:@selector(tapRightButton:)];
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"registerimang"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
            
        }
            break;
        case CANCEL:{
            //明细
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 50, 30);
            [backBtn setTitle:@"确定" forState: UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            backBtn.titleLabel.font=[UIFont systemFontOfSize:15];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case SWITCHACCOUNT:{
            //邀请好友
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"yaoqing_1"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
            
        }
            break;
        case SETTING:
        {
            //明细
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"yaoqing_1"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
            
        }
            break;
        case CAST:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 30, 30);
            [backBtn setImage:[UIImage imageNamed:@"my_mingxi_btn_nor"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        case QUANYI:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 80, 30);
            [backBtn setImage:[UIImage imageNamed:@"会员权益图-35"] forState:UIControlStateNormal];
            
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
            
        case HAOYOUGUANLI:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 80, 30);
            [backBtn setTitle:@"跳过" forState: UIControlStateNormal];
            backBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
            [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
            
        case JIFENGONGLUE:{
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.frame = CGRectMake(0, 0, 80, 30);
            [backBtn setTitle:@"积分攻略" forState: UIControlStateNormal];
            backBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
            [backBtn addTarget:self action:@selector(tapRightButton:) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            self.navigationItem.rightBarButtonItem = backItem;
        }
            break;
        default:
            break;
    }
}

//点击导航栏右侧按钮
- (void)tapRightButton:(UIButton*)_button{
}

//显示提示信息
- (void)showMessage:(NSString*)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    //改变title的大小和颜色
//    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
//    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, message.length)];
//    [messageAtt addAttribute:NSForegroundColorAttributeName value:zhuColorPER range:NSMakeRange(0, message.length)];
//    [alertController setValue:messageAtt forKey:@"attributedMessage"];
    [self presentViewController:alertController animated:YES completion:nil];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
//    [alert show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
        [self dismissViewControllerAnimated:alertController completion:nil];
    });
    
    
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
