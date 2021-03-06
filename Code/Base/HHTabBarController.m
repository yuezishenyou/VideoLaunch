//
//  HHTabBarController.m
//  mj_videoLaunch
//
//  Created by maoziyue on 2017/9/28.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHTabBarController.h"
#import "HHMainController.h"
#import "HHNavigationController.h"

@interface HHTabBarController ()

@end

@implementation HHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
    
}

- (void)initSubViews
{
    //修改下面文字大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    
    
    //第三级控制器
    //资讯
    HHMainController *inforCtrl = [[HHMainController alloc] init];
    inforCtrl.title = @"首页";
    UIImage *image = [[UIImage imageNamed:@"icon_tabbar_homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    inforCtrl.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:image  selectedImage:selectImage];
    
    //应用
    HHMainController *appCtrl = [[HHMainController alloc] init];
    appCtrl.title = @"商家";
    UIImage *image1 = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage1 = [[UIImage imageNamed:@"icon_tabbar_merchant_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    appCtrl.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"商家" image:image1 selectedImage:selectImage1];
    
    //我的
    HHMainController *myCtrl = [[HHMainController alloc] init];
    myCtrl.title = @"我";
    UIImage *image2 = [[UIImage imageNamed:@"icon_tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage2 = [[UIImage imageNamed:@"icon_tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myCtrl.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:image2 selectedImage:selectImage2];
    
    
    //创建数组
    NSArray *viewCtrls = @[inforCtrl,appCtrl,myCtrl];
    
    //创建可变数组,存储导航控制器
    NSMutableArray *navs = [NSMutableArray arrayWithCapacity:viewCtrls.count];
    
    //创建二级控制器导航控制器
    for (UIViewController *ctrl in viewCtrls)
    {
        HHNavigationController *nav = [[HHNavigationController alloc] initWithRootViewController:ctrl];
        
        //将导航控制器加入到数组中
        [navs addObject:nav];
    }
    
    //将导航控制器交给标签控制器管理
    self.viewControllers = navs;
    
    
    
}







@end










