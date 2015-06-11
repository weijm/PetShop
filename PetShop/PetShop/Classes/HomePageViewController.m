//
//  HomePageViewController.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "HomePageViewController.h"
#import "BannerView.h"



#define kSearchBarRect CGRectMake(50,20,(kWidth - 50*2),40)
#define kSearchBarTag 100
@interface HomePageViewController ()

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
    CGRect frame = bannerView.frame;
    frame.size = bannerViewBg.frame.size;
    bannerView.frame = frame;
    NSLog(@"frame == %@",NSStringFromCGRect(bannerView.frame));
    NSLog(@"bg frame == %@",NSStringFromCGRect(bannerViewBg.frame));
    [bannerView loadImageAndData:[[NSArray alloc] initWithObjects:@"homepage_banner1",@"homepage_banner1", nil]];
    [bannerViewBg addSubview:bannerView];
    
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
   //隐藏searchBar
    [self showOrHiddenSearchBar:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    //显示searchBar
    [self showOrHiddenSearchBar:NO];
    
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
    customSearchBar.tag = kSearchBarTag;
    customSearchBar.delegate = self;
    //设置searchBar的背景图片
    customSearchBar.backgroundImage = [Util imageWithColor:[UIColor clearColor]];
    //searchBar的提示文字
    customSearchBar.placeholder = @"输入关键字                             ";
    //将searchBar上的🔍设置为透明
    [customSearchBar setImage:[Util imageWithColor:[UIColor clearColor]] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    //设置textFiled的背景
     [customSearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"login_btn_input_side.png"] forState:UIControlStateNormal];
    //添加到页面上
    [[UIApplication sharedApplication].windows[0] addSubview: customSearchBar];
}
//导航条的隐藏与显示
-(void)showOrHiddenSearchBar:(BOOL)isShow
{
     UISearchBar *tempSearchBar = (UISearchBar *)[[UIApplication sharedApplication].windows[0] viewWithTag:kSearchBarTag];
    if (tempSearchBar) {
        tempSearchBar.hidden = isShow;
    }
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
@end
