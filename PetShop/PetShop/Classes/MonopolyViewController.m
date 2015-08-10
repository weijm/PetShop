//
//  MonopolyViewController.m
//  宠物专卖
//
//  Created by wjm on 15/7/25.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonopolyViewController.h"
#import "MonopolyTableViewCell.h"
#import "MonopolyListView.h"
#import "MonopolyInfoViewController.h"

#define BTCOUNT 3
@interface MonopolyViewController ()
{
    UIView *segmentView;
    
    NSInteger selectStatus;
    
    NSMutableArray *dataArray;
    
    UITableView *dataTableView;
    
    MonopolyListView *monopolyListView;
}
@end

@implementation MonopolyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宠物专卖";
    //初始化按钮
    [self initSegmentBt];
    //初始化tableView
    [self initTableView];
    
    [self initItems];
    
    dataArray = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 初始化items
-(void)initItems
{
    UIView *rightItemBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    UIImageView *locationimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 8, 10)];
    locationimg.image = [UIImage imageNamed:@"homepage_mono_locationbt"];
    [rightItemBg addSubview:locationimg];
    UIButton *rightBt = [[UIButton alloc] initWithFrame:CGRectMake(9, 20, 40, 10)];
    [rightBt setTitle:@"北京市" forState:UIControlStateNormal];
    [rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [UIFont systemFontOfSize:12];
    [rightBt addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [rightItemBg addSubview:rightBt];
    UIImageView *locationimg1 = [[UIImageView alloc] initWithFrame:CGRectMake(rightBt.frame.origin.x+rightBt.frame.size.width+3, 25, 10, 5)];
    locationimg1.image = [UIImage imageNamed:@"homepage_mono_right_bt"];
    [rightItemBg addSubview:locationimg1];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightItemBg];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)rightAction
{
    NSLog(@"更换地址");
}
#pragma mark - 初始化选项列表
-(void)initMonopolyListView
{
    if (monopolyListView) {
        [monopolyListView cancelView];
        monopolyListView = nil;
    }
    float btWidht = kWidth/BTCOUNT;
    monopolyListView = [[MonopolyListView alloc] initWithFrame:CGRectMake(0, dataTableView.frame.origin.y, btWidht, 100)];
    [monopolyListView initData:(int)selectStatus];
    __weak MonopolyViewController *wself = self;
    monopolyListView.selectedRow = ^(int index,NSString *string)
    {
        MonopolyViewController *sself = wself;
        [sself selectedSubListRow:index content:string];
        
    };
    [monopolyListView showView:dataTableView];
    
}
-(void)selectedSubListRow:(int)row content:(NSString*)string
{
    NSLog(@"选择第%ld个按钮，第%d行，内容是： %@",selectStatus,row,string);
}
#pragma mark - 初始化tableView
-(void)initTableView
{
    float tableViewY = topBarheight+segmentView.frame.size.height;
    dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,tableViewY , kWidth, kHeight-tableViewY)];
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    dataTableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:dataTableView];
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"MonopolyTableViewCellID";
    MonopolyTableViewCell *cell = (MonopolyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];//（寻找标识符为cellid并且没被用到的cell用于重用）
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MonopolyTableViewCell" owner:self options:nil] lastObject];
    }
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [Util myYOrHeight:90];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MonopolyInfoViewController *infoVC = [[MonopolyInfoViewController alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
}
#pragma mark - 初始化SegmentBt
-(void)initSegmentBt
{
    CGRect frame = CGRectMake(0, topBarheight, kWidth, 30);
    segmentView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:segmentView];
    
    float btWidht = kWidth/BTCOUNT;
    for (int i =0; i < BTCOUNT; i++) {
        frame = CGRectMake(btWidht*i, 0, btWidht, segmentView.frame.size.height);
        CustomSegmentView *segmentBt = [[CustomSegmentView alloc] initWithFrame:frame];
        segmentBt.tag = i+1;
        segmentBt.delegate = self;
        [segmentBt loadButtonViewInMonopoly];
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
        }
    }
    if (viewTag == 1) {//全部用品的点击事件
        //        [self clickAllSupplies];
        NSLog(@"全部专卖店");
        [self initMonopolyListView];
        //获取数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"", nil];
        
    }else if (viewTag == 2) //价格排序的点击事件
    {
        NSLog(@"默认排序");
        [self initMonopolyListView];
        //更新数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
        
        
    }else if (viewTag == 3) //销售排序的点击事件
    {
        NSLog(@"筛选区域");
        [self initMonopolyListView];
        //更新数据
        dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", @"",@"",nil];
        
    }
    //    [dataTableView reloadData];
    
}

@end
