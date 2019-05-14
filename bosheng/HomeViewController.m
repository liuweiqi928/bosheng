//
//  HomeViewController.m
//  zhiyoubao
//
//  Created by 刘伟奇 on 2019/1/5.
//  Copyright © 2019 Jindouyun. All rights reserved.
//

#import "HomeViewController.h"
#import "ProjectNavgationViewController.h"
#import "HomeTabBar.h"
#import "HomePageViewController.h"
#import "classificationController.h"
#import "ShoppingCartController.h"
#import "mineViewController.h"
#import "communityController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 通过appearance统一设置UITabbarItem的文字属性
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];  // 设置文字大小
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];  // 设置文字的前景色
    
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = zhuColorPER;
    
    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    // 添加控制器
    [self setupChildVC:[[HomePageViewController alloc] init] andTitle:@"首页" andImage:@"首页" andSelectImage:@"首页hover"];
    [self setupChildVC:[[classificationController alloc] init] andTitle:@"分类" andImage:@"分类-" andSelectImage:@"分类"];
    [self setupChildVC:[[communityController alloc] init] andTitle:@"社区" andImage:@"图层5" andSelectImage:@"社区hover"];
    [self setupChildVC:[[ShoppingCartController alloc] init] andTitle:@"购物车" andImage:@"图层6" andSelectImage:@"图层6-hover"];
    [self setupChildVC:[[mineViewController alloc] init] andTitle:@"我的" andImage:@"我的拷贝" andSelectImage:@"我的组6"];
    
    // 更换tabbar
//    [self setValue:[[HomeTabBar alloc]init] forKey:@"tabBar"];
    
}


/**
 * 初始化子控制器
 */
- (void)setupChildVC:(UIViewController *)vc andTitle:(NSString * )title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
    
    // 设置文字和图片
//    vc.navigationItem.title = title;
//    vc.tabBarItem.title = title;
    UIImage * imageno = [UIImage imageNamed:image];
    UIImage * imagesel = [UIImage imageNamed:selectImage];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:[imageno imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[imagesel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    vc.tabBarItem=item;
    // 包装一个导航控制器
    ProjectNavgationViewController * nav = [[ProjectNavgationViewController alloc]initWithRootViewController:vc];
    nav.view.backgroundColor = [UIColor whiteColor];

    // 添加为子控制器
    [self addChildViewController:nav];
}

@end
