//
//  phoneNViewController.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/27.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface phoneNViewController : baseViewController<UITextFieldDelegate>
{
    UITextField *messagephone;
    UITextField *messagepas;
    UIButton *loginmess;

    UIButton *buttons;
}
@end

NS_ASSUME_NONNULL_END
