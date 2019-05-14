//
//  setupViewController.h
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/10.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "baseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface setupViewController : baseViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView*headimg;
    UILabel*nicheng;
    UILabel*sex;
    UILabel*birthday;
    UILabel*name;
    UILabel*phone;
    UILabel*pas;

    NSData*imageData;
    UIPickerView *pickerView;
    UIView*shaixuan2;
    UIDatePicker *datePicker;

}
@end

NS_ASSUME_NONNULL_END
