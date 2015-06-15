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
    //初始化导航条的搜索框
    [self initSearchBar];
    //初始化导航条上的item
    [self initNavigationItem];
    //添加bannaerView
    BannerView *bannerView = [[[NSBundle mainBundle] loadNibNamed:@"BannerView" owner:nil options:nil] lastObject];
    bannerView.tag = kBannerViewTag;
    [bannerView loadImageAndData:[[NSArray alloc] initWithObjects:@"homepage_banner1",@"homepage_banner1", nil]];
    [bannerViewBg addSubview:bannerView];
    
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //初始化按钮界面
    allBtbg.backgroundColor = Rgb(231, 220, 220);
    HomePageButtonView *btbg = [[[NSBundle mainBundle] loadNibNamed:@"HomePageButtonView" owner:nil options:nil] lastObject];
    btbg.tag = kBtBgTag;
    btbg.delegate = self;
    [allBtbg addSubview:btbg];
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{

}
-(void)viewWillAppear:(BOOL)animated
{

    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [self autoAdapter];
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
            break;
           default:
            break;
    }
}

#pragma mark - 适配各种屏幕 
-(void)autoAdapter
{
    //适配bannerView的大小
    BannerView *bannerTemp = (BannerView *)[bannerViewBg viewWithTag:kBannerViewTag];
    CGRect frame = bannerTemp.frame;
    frame.size = bannerViewBg.frame.size;
    bannerTemp.frame = frame;
    [bannerTemp adaperScrollview:frame];
    
    //适配allBtbg 的大小
    float btbgTop = frame.size.height;
    frame = allBtbg.frame;
    float btbgOriginOldY = frame.origin.y;
    frame.origin.y = btbgTop;
    frame.size.height = frame.size.height -(btbgTop-btbgOriginOldY);
    allBtbg.frame = frame;
    
    //适配按钮视图的位置
    HomePageButtonView *btbg = (HomePageButtonView *)[allBtbg viewWithTag:kBtBgTag];
    frame = btbg.frame;
    frame.origin.x =(kWidth-btbg.frame.size.width)/2;
    frame.origin.y = (allBtbg.frame.size.height-btbg.frame.size.height)/2;
    btbg.frame = frame;
    
}
@end
