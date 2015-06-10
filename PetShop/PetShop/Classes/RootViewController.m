//
//  RootViewController.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "RootViewController.h"



@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tabbar的title
    NSArray *titleArray = [NSArray arrayWithObjects:@"首页",@"社区",@"积分商城",@"我的", nil];
    //tabbar的控制器类前缀 如 HomePageViewController这个控制器的名称为HomePage
    NSArray *classArray = [NSArray arrayWithObjects:@"HomePage",@"Community",@"Integral",@"Mine", nil];
    //生成tabbar的控制器数组
    NSMutableArray *vcArray = [Util generateViewControllerByName:[NSDictionary dictionaryWithObjectsAndKeys:titleArray,@"title",classArray,@"name", nil]];
    
    self.viewControllers = vcArray;
    self.selectedViewController = [vcArray firstObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
