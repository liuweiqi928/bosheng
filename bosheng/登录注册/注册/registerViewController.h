//
//  registerViewController.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface registerViewController : baseViewController<UITextFieldDelegate>{
    UITextField *textfieldphone;
    UITextField *textfieldcode;
    UITextField *textfieldpas;
    UITextField *textfieldpas2;

    UIButton *buttons;
    UIButton *next;
    UILabel*baliu;
}

@end

NS_ASSUME_NONNULL_END
