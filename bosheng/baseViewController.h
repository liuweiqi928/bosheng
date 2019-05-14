//
//  baseViewController.h
//  zhiyoubao
//
//  Created by 刘伟奇 on 2018/12/24.
//  Copyright © 2018 Jindouyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    FINANC,    //介绍
    REFRESH,   //无按钮
    ALERT,    //
    CUSTOMSTYLE,//消息
    LOGIN,  //--登录
    UNLOGIN, //未登录或注册
    CANCEL, //取消
    SWITCHACCOUNT, //切换账号
    SETTING,
    XUANZHE,
    CAST,
    QUANYI,
    HAOYOUGUANLI,
    DELETEBZ,
    JIFENGONGLUE
}RightButtonStyle;

@interface baseViewController : UIViewController
@property (assign)RightButtonStyle buttonStyle;

- (void)initNavBar:(NSString*)title style:(RightButtonStyle)_style;

- (void) showMessage:(NSString*)message;

@end

NS_ASSUME_NONNULL_END
