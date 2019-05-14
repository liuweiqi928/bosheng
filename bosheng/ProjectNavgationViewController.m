//
//  ProjectNavgationViewController.m
//  99Finance
//
//  Created by mac mini01 on 15/9/5.
//  Copyright (c) 2015年 mac mini01. All rights reserved.
//
#import "ProjectNavgationViewController.h"

@interface ProjectNavgationViewController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id popDelegate;

@end

@implementation ProjectNavgationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;

    
}

//解决手势失效问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

//


//修改返回按钮
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
    
}


+ (void)initialize
{
    // 1.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent=NO;
//    navBar.tintColor=[UIColor whiteColor];
    // 设置背景图片
//    NSString *bgName = @"NvBar_BackImg";
//
//    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage=[[UIImage alloc]init];
    navBar.barTintColor=[UIColor whiteColor];
    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attrs];

}

#pragma mark 控制状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

//新页面
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //隐藏底部tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//返回
- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
