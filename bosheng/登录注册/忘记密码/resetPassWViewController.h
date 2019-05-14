//
//  resetPassWViewController.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/27.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface resetPassWViewController : baseViewController<UITextFieldDelegate>
{
    UITextField *registpas;
    UITextField *registrepas;
    UIButton *rebuttons;

    
}
@property(nonatomic,copy)NSString*phoneN;
@end

NS_ASSUME_NONNULL_END
