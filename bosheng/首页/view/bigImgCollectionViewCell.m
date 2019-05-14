//
//  bigImgCollectionViewCell.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/1/19.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import "bigImgCollectionViewCell.h"

@implementation bigImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];

        img=[[UIImageView alloc]init];
        img.backgroundColor=bgColorPER;
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.equalTo(@(165*SCREENWIDTHS));
        }];
        
        name=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"" andTextColor:blackColorPER andFont:middleFontPER andAlignment:1];
        [self addSubview:name];
        name.numberOfLines=2;
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self->img);
            make.top.equalTo(self->img.mas_bottom);
            make.height.equalTo(@(30*SCREENWIDTHS));
        }];
        
        money=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"" andTextColor:zhuColorPER andFont:middleFontPER andAlignment:1];
        [self addSubview:money];
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self->img);
            make.top.equalTo(self->name.mas_bottom);
            make.height.equalTo(@(30*SCREENWIDTHS));
        }];
        
        img.backgroundColor=[UIColor lightGrayColor];
        name.text=@"mingcheng";
        money.text=@"100";
    }
    return self;
}

//
-(void)setBean:(goodsModel *)bean{
    
    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@commdityimg/%@",homepage, bean.picture[0]]] placeholderImage:[UIImage imageNamed:@""]];
    name.text=bean.commodityname;
    money.text=[NSString stringWithFormat:@"￥%.2f",floor(([bean.price floatValue]/100)*100)/100];
}


@end
