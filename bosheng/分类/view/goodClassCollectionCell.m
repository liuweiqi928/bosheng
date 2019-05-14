//
//  goodClassCollectionCell.m
//  bosheng
//
//  Created by 刘伟奇 on 2019/5/12.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "goodClassCollectionCell.h"

@implementation goodClassCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        img=[[UIImageView alloc]init];
        img.backgroundColor=bgColorPER;
        [self addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.equalTo(@(60*SCREENWIDTHS));
        }];
        
        name=[myUI myUILabelWithBackgroundColor:[UIColor clearColor] andText:@"" andTextColor:blackColorPER andFont:[UIFont systemFontOfSize:13*SCREENWIDTHS] andAlignment:1];
        [self addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self->img);
            make.top.equalTo(self->img.mas_bottom);
            make.height.equalTo(@(35*SCREENWIDTHS));
        }];
        
        
                img.backgroundColor=[UIColor lightGrayColor];
                name.text=@"测试";
    }
    return self;
}

-(void)setBean:(goodsClassModel *)bean{
    
//    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@commdityimg/%@",homepage, bean.picture[0]]] placeholderImage:[UIImage imageNamed:@""]];
//    name.text=bean.commodityname;
//    money.text=[NSString stringWithFormat:@"￥%.2f",floor(([bean.price floatValue]/100)*100)/100];
}
@end
