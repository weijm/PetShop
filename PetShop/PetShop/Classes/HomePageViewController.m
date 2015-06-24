//
//  HomePageViewController.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "HomePageViewController.h"
#import "BannerView.h"
#import "PetBeautyViewController.h"
#import "SignViewController.h"
#import "SuppliesViewController.h"


#define kSearchBarRect CGRectMake(50,22,(kWidth - 50*2),40)
#define kSearchBarTag 100
#define kBannerViewTag 10
#define kBtBgTag 9
@interface HomePageViewController ()
{
}
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = Rgb(231, 220, 220);
    //初始化导航条的搜索框
    [self initSearchBar];
    //初始化导航条上的item
    [self initNavigationItem];
    //添加bannaerView
    CGRect frame;
    float bHeight = [Util myYOrHeight:bannerViewBg.frame.size.height];
    frame = CGRectMake(0, 0, kWidth,bHeight );
    BannerView *bannerView = [[BannerView alloc] initWithFrame:frame];
    bannerView.tag = kBannerViewTag;
    [bannerView loadImageAndData:[[NSArray alloc] initWithObjects:@"homepage_banner1",@"homepage_banner1", nil]];
    [bannerViewBg addSubview:bannerView];
    
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //初始化按钮界面
    CGRect  btBgframe = CGRectMake(0, bannerViewBg.frame.origin.y+frame.size.height-35, kWidth, kHeight-frame.origin.y-frame.size.height-60);
    HomePageButtonView *btbg = [[HomePageButtonView alloc] initWithFrame:btBgframe];
    btbg.delegate = self;
    [self.view addSubview:btbg];
}
-(void)viewWillDisappear:(BOOL)animated
{

}
-(void)viewWillAppear:(BOOL)animated
{

    
}
-(void)viewDidAppear:(BOOL)animated
{
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航条上的相关操作
//初始化导航条
-(void)initSearchBar
{
    UISearchBar *tempSearchBar = (UISearchBar *)[[UIApplication sharedApplication].windows[0] viewWithTag:kSearchBarTag];
    if (tempSearchBar) {
        [tempSearchBar removeFromSuperview];
    }
    UISearchBar *customSearchBar = [[UISearchBar alloc] initWithFrame:kSearchBarRect];
    //添加的searchBar标记
    customSearchBar.tag = kSearchBarTag;
    customSearchBar.delegate = self;
    //设置searchBar的背景图片
    customSearchBar.backgroundImage = [Util imageWithColor:[UIColor clearColor]];
    //searchBar的提示文字
    customSearchBar.placeholder = @"输入关键字                             ";
    //将searchBar上的🔍设置为透明
    [customSearchBar setImage:[Util imageWithColor:[UIColor clearColor]] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    //设置textFiled的背景
     [customSearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"homepage_searchbg"] forState:UIControlStateNormal];
    //添加到页面上
    self.navigationItem.titleView = customSearchBar;
}
//初始化导航条上的item
-(void)initNavigationItem
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"homepage_list_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"homepage_shopcart"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    //设置子控制器的返回按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //设置子控制器返回按钮上的文字不显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
}
-(void)leftAction
{
    
}
-(void)rightAction
{
    
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;
{
    searchBar.text = nil;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
#pragma mark - HomePageButtonViewDelegate
-(void)clickedBtAction:(NSInteger)index
{
    switch (index) {
        case 1:
            NSLog(@"宠物用品11");
        {
            SuppliesViewController *suppliesVC = [[SuppliesViewController alloc] init];
            suppliesVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:suppliesVC animated:YES];
       
        }
            break;
        case 2:
            NSLog(@"宠物专卖22");
            break;
        case 3:
        {
            NSLog(@"宠物美容33");
            PetBeautyViewController *pet = [[PetBeautyViewController alloc] init];
            pet.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pet animated:YES];
        }
            break;
        case 4:
            NSLog(@"宠物医院44");
            break;
        case 5:
            NSLog(@"团购55");
            break;
        case 6:
            NSLog(@"上门服务66");
            break;
        case 7:
            NSLog(@"签到77");
        {
            SignViewController *signVC = [[SignViewController alloc] init];
            signVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:signVC animated:YES];
        }
            break;
           default:
            break;
    }
}

@end
