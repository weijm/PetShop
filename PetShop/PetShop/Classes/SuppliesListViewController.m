//
//  SuppliesListViewController.m
//  分类的商品类表
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesListViewController.h"
#import "SuppliesTableViewCell.h"


#define BTCOUNT 3

@interface SuppliesListViewController ()
{
    NSMutableArray *dataArray;
    UIView *segmentView;
    
    NSInteger selectStatus;//点击了哪个按钮
}
@end

@implementation SuppliesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    searchBar.placeholder = @"请输入搜索关键字                        ";
    //设置searchBar的背景图片
    searchBar.backgroundImage = [Util imageWithColor:[UIColor clearColor]];
    //将searchBar上的🔍设置为透明
    [searchBar setImage:[Util imageWithColor:[UIColor clearColor]] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    //设置textFiled的背景
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"homepage_supp_list_searchBg"] forState:UIControlStateNormal];
    //加载按钮
    [self initSegmentBt];
    
    float tY = segmentView.frame.origin.y+segmentView.frame.size.height;
    listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tY, kWidth,kHeight-tY )];
    listTableView.backgroundColor = [UIColor clearColor];
    listTableView.separatorColor = [UIColor clearColor];
    listTableView.delegate = self;
    listTableView.dataSource = self;
    [self.view addSubview:listTableView];
    listTableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 初始化SegmentBt
-(void)initSegmentBt
{
    CGRect frame = CGRectMake(0, searchBg.frame.origin.y+searchBg.frame.size.height, kWidth, 30);
    segmentView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:segmentView];
    
    float btWidht = kWidth/BTCOUNT;
    for (int i =0; i < BTCOUNT; i++) {
        frame = CGRectMake(btWidht*i, 0, btWidht, segmentView.frame.size.height);
        CustomSegmentView *segmentBt = [[CustomSegmentView alloc] initWithFrame:frame];
        segmentBt.categaryType = 1;
        segmentBt.tag = i+1;
        segmentBt.delegate = self;
        [segmentBt loadButtonViewInSuppList];
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
//            [self removeListBg];
        }
    }
    if (viewTag == 1) {//全部用品的点击事件
//        [self clickAllSupplies];
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
//    [dataTableView reloadData];
    
}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"CELL";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        //商品列表
        cell= [[[NSBundle mainBundle] loadNibNamed:@"SuppliesTableViewCell" owner:nil options:nil] lastObject];
        CGRect frame = cell.frame;
        frame.size.width = kWidth;
        cell.frame = frame;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [Util myYOrHeight:90];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //展示商品详情
}

@end
