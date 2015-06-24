//
//  SuppliesViewController.m
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesViewController.h"

#import "SuppliesTableViewCell.h"
#import "SuppliesListViewController.h"

#import "SuppliesDetailsViewController.h"

#define BTCOUNT 3
#define ListBgTag 100
@interface SuppliesViewController ()
{
    UITableView *dataTableView; //数据展示的tableView
    
    NSMutableArray *dataArray;
    
    NSInteger selectStatus;//1选中全部商品，2选中价格排序 3选中销售排序
    
    NSArray *bannerArray; //banner的数据数组
    
    CGRect bannerFrame ;
}

@end

@implementation SuppliesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宠物用品";
    self.view.backgroundColor = Rgb(231, 220, 220);
    //初始化首排按钮
    [self initSegmentBt];
    
    //适配bannerView的高度
    bannerFrame = bannerBg.frame;
    bannerFrame.size.height = [Util myYOrHeight:bannerFrame.size.height];
    bannerBg.frame = bannerFrame;
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //初始化选中状态
    selectStatus = 1;
    
    //添加tableView视图
    dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bannerFrame.origin.y, kWidth, kHeight-bannerFrame.origin.y) style:UITableViewStylePlain];
    dataTableView.separatorColor = [UIColor clearColor];
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    [self.view addSubview:dataTableView];
    
    dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"", nil];
    
    
    bannerArray = [NSArray arrayWithObjects:@"homepage_banner1",@"homepage_banner1",@"homepage_banner1",@"homepage_banner1", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (selectStatus ==1) {
        [dataArray insertObject:@"" atIndex:0];
    }
    return [dataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"CELL";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        if (selectStatus == 1&&indexPath.row==0) {//bannerView
            cell = [UITableViewCell new];
            SuppliesBannerView *bannerView = [[SuppliesBannerView alloc] initWithFrame:CGRectMake(0, 0, kWidth, bannerFrame.size.height)];
            bannerView.delegate = self;
            [bannerView loadScrollViewSubView:bannerArray];
            [cell.contentView addSubview:bannerView];
            
        }else
        { //商品列表
            cell= [[[NSBundle mainBundle] loadNibNamed:@"SuppliesTableViewCell" owner:nil options:nil] lastObject];
            CGRect frame = cell.frame;
            frame.size.width = kWidth;
            cell.frame = frame;
        }
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectStatus == 1&&indexPath.row==0) {
        
        return bannerFrame.size.height;
    }
    return [Util myYOrHeight:90];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //展示商品详情
    SuppliesDetailsViewController *detailsVC = [[SuppliesDetailsViewController alloc] init];
    [self.navigationController pushViewController:detailsVC animated:YES];
}
#pragma mark - 初始化SegmentBt
-(void)initSegmentBt
{
    CGRect frame;
    float btWidht = kWidth/BTCOUNT;
    for (int i =0; i < BTCOUNT; i++) {
        frame = CGRectMake(btWidht*i, 0, btWidht, segmentView.frame.size.height);
        CustomSegmentView *segmentBt = [[CustomSegmentView alloc] initWithFrame:frame];
        segmentBt.tag = i+1;
        segmentBt.delegate = self;
        [segmentBt loadButtonView];
        [segmentView addSubview:segmentBt];
    }
}
#pragma mark -CustonSegmentViewDelegate
-(void)ClickBtByTag:(NSInteger)viewTag
{
    selectStatus = viewTag;//选中状态
    for (UIView *view in [segmentView subviews]) {
        if ([view isKindOfClass:[CustomSegmentView class]]&&view.tag!=viewTag) {//将为选中的按钮的下划线隐藏
            CustomSegmentView *tempView = (CustomSegmentView *)view;
            tempView.hLine.hidden = YES;
            tempView.backgroundColor = [UIColor whiteColor];
            //将显示的遮罩界面去除
            [self removeListBg];
        }
    }
    if (viewTag == 1) {//全部用品的点击事件
        [self clickAllSupplies];
        //获取数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"", nil];
      
    }else if (viewTag == 2) //价格排序的点击事件
    {
        //更新数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
   
        
    }else if (viewTag == 3) //销售排序的点击事件
    {
        //更新数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", @"",@"",nil];
   
    }
    [dataTableView reloadData];
    
}
#pragma mark - 首排按钮的相关事件
-(void)clickAllSupplies
{
    //点击某个按钮时的响应事件
    CGRect nFrame = segmentView.frame;
    CGRect frame = CGRectMake(nFrame.origin.x, nFrame.origin.y+nFrame.size.height, kWidth, (self.view.frame.size.height-nFrame.origin.y-nFrame.size.height));
    UIView *subBg = [[UIView alloc] initWithFrame:frame];
    subBg.backgroundColor = [UIColor clearColor];
    subBg.userInteractionEnabled = YES;
    subBg.tag = ListBgTag;
    [self.view addSubview:subBg];
    //透明度视图
    UIView *listBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    listBg.backgroundColor = [UIColor lightGrayColor];
    listBg.alpha = 0.6;
    [subBg addSubview:listBg];
    //下拉按钮
    NSArray *titArray = [NSArray arrayWithObjects:@"狗狗用品",@"猫猫用品",@"小宠用品",@"水族用品", nil];
    for (int i=0 ; i < 4 ; i++) {
        frame = CGRectMake(0, nFrame.size.height*i, kWidth/3, nFrame.size.height);
        UIButton *bt = [[UIButton alloc] initWithFrame:frame];
        [bt setTitle:[titArray objectAtIndex:i] forState:UIControlStateNormal];
        [bt setTitleColor:Rgb(117, 117, 117) forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:15];
        bt.backgroundColor = Rgb(234, 234, 234);
        [bt addTarget:self action:@selector(clickListBtAction:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag =i;
        [subBg addSubview:bt];
        if (i == 0) {//最后一行不需要加线
            continue;
        }
        frame.size.height = 0.5;
        frame.origin.y = frame.origin.y-0.5;
        UIView *lineView = [[UIView alloc] initWithFrame:frame];
        lineView.backgroundColor = [UIColor grayColor];
        [subBg addSubview:lineView];
    }
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeListBg)];
    [subBg addGestureRecognizer:tap];
}
//点击全部用品下拉列表中的按钮的响应事件
-(void)clickListBtAction:(id)sender
{
    [self removeListBg];
    /*0 狗狗用品 1 猫猫用品 2 小宠用品 3 水族用品 */
    UIButton *bt = (UIButton*)sender;
    NSString *titleString ;
    NSInteger btTag = bt.tag;
    switch (btTag) {
        case 0:
            titleString = @"狗狗用品";
            break;
        case 1:
            titleString = @"猫猫用品";
            break;
        case 2:
            titleString = @"小宠用品";
            break;
        case 3:
            titleString = @"水族用品";
            break;
        default:
            break;
    }
    SuppliesListViewController *listVC = [[SuppliesListViewController alloc] init];
    listVC.title = titleString;
    listVC.categoryType = btTag;
    [self.navigationController pushViewController:listVC animated:YES];
    
}
-(void)removeListBg
{
    UIView *tempListBg = [self.view viewWithTag:ListBgTag];
    if (tempListBg) {
        [tempListBg removeFromSuperview];
    }
    CustomSegmentView * tempBt = (CustomSegmentView *)[segmentView viewWithTag:1];
    tempBt.isShowCoverView = NO;
}

@end
