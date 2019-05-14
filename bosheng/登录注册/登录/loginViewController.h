//
//  loginViewController.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface loginViewController : baseViewController<UITextFieldDelegate>{
    UIView*codeview;
    UITextField *textfieldphone;
    UITextField *textfieldpas;
    UIButton *buttons;

    UIView*messageview;//验证码登录
    UITextField *messagephone;
    UITextField *messagepas;
    UIButton *mebuttons;
    UIButton *loginmess;

    UIView*registview;//验证码注册
    UITextField *registphone;
    UITextField *registcode;
    UITextField *registpas;
    UITextField *registrepas;
    UIButton *regmess;
    UILabel*baliu;

    

    UIButton *rebuttons;

    NSString*openid;
    NSString*keys;
    UIButton *headlogin;
    UIButton *headreg;
    UIView*loginPoint;
    UIView*registPoint;

    UIView *bgview;//区号背景

    UIButton *boy;
    UIButton *boydui;
    
    UIButton *girl;
    UIButton *girldui;

}

@end

NS_ASSUME_NONNULL_END
