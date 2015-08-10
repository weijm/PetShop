//
//  HomePageViewController.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "HomePageViewController.h"
#import "BannerView.h"
#import "PetHospitalViewController.h"
#import "PetBeautyViewController.h"
#import "SignViewController.h"
#import "SuppliesViewController.h"
#import "MonopolyViewController.h"
#import "DoorServerViewController.h"


#define kSearchBarRect CGRectMake(50,22,(kWidth - 50*2),40)
#define kBtBgTag 9

#define bannerHeight 160
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
    float banHeight = bannerHeight;
    float bHeight = [Util myYOrHeight:banHeight];
    frame = CGRectMake(0, 64, kWidth,bHeight );
    BannerView *bannerView = [[BannerView alloc] initWithFrame:frame];
    [bannerView loadImageAndData:[[NSArray alloc] initWithObjects:@"homepage_banner1",@"homepage_banner1", nil]];
    [self.view addSubview:bannerView];
    
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //初始化按钮界面
    CGRect  btBgframe = CGRectMake(0, bannerView.frame.origin.y+frame.size.height-25, kWidth, kHeight-frame.origin.y-frame.size.height);
    HomePageButtonView *btbg = [[HomePageButtonView alloc] initWithFrame:btBgframe];
    btbg.delegate = self;
    [self.view addSubview:btbg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航条上的相关操作
//初始化导航条
-(void)initSearchBar
{
    UISearchBar *customSearchBar = [[UISearchBar alloc] initWithFrame:kSearchBarRect];
    //添加的searchBar标记
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
        {
            MonopolyViewController *monopolyVC = [[MonopolyViewController alloc] init];
            monopolyVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:monopolyVC animated:YES];
        }
            break;
        case 3:
        {
            NSLog(@"宠物美容33");
            PetBeautyViewController *petBeauty = [[PetBeautyViewController alloc] init];
            petBeauty.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:petBeauty animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"宠物医院44");
            PetHospitalViewController *petHospital = [[PetHospitalViewController alloc] init];
            petHospital.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:petHospital animated:YES];
        }
            break;
        case 5:
            NSLog(@"团购55");
        {
            SuppliesViewController *suppliesVC = [[SuppliesViewController alloc] init];
            suppliesVC.isPurchase = YES;
            suppliesVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:suppliesVC animated:YES];

       
        }
            break;
        case 6:
            NSLog(@"上门服务66");
        {
            DoorServerViewController *doorServerVC = [[DoorServerViewController alloc] init];
            doorServerVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:doorServerVC animated:YES];
       
        }
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
