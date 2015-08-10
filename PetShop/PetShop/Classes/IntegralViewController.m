//
//  IntegralViewController.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "IntegralViewController.h"
#import "IntegralTableViewCell.h"

#define BTCOUNT 3
@interface IntegralViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *segmentView;
    NSInteger selectStatus;
    NSMutableArray *dataArray;
    UITableView *dataTableView;
}
@end

@implementation IntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSegmentBt];
    [self initTableView];
}
#pragma mark - 初始化SegmentBt
-(void)initSegmentBt
{
    segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, [Util myYOrHeight:30])];
    [self.view addSubview:segmentView];
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
#pragma mark - 初始化tableView
-(void)initTableView
{
    float tableViewY = topBarheight+[Util myYOrHeight:32];
    CGRect frame = CGRectMake(0,tableViewY , kWidth, kHeight-tableViewY-self.tabBarController.tabBar.frame.size.height);
    dataTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    dataTableView.separatorColor = [UIColor clearColor];
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    [self.view addSubview:dataTableView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- CustomSegmentViewDelegate
-(void)ClickBtByTag:(NSInteger)viewTag
{
    NSLog(@"viewTag== %ld",(long)viewTag);
    selectStatus = viewTag;//选中状态
    for (UIView *view in [segmentView subviews]) {
        if ([view isKindOfClass:[CustomSegmentView class]]&&view.tag!=viewTag) {//将为选中的按钮的下划线隐藏
            CustomSegmentView *tempView = (CustomSegmentView *)view;
            tempView.hLine.hidden = YES;
            tempView.backgroundColor = [UIColor whiteColor];

        }
    }
    if (viewTag == 1) {//全部用品的点击事件
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
#pragma mark - UITableViewDelegate
#pragma mark -UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"IntegralTableViewCellID";
    IntegralTableViewCell *cell = (IntegralTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];//（寻找标识符为cellid并且没被用到的cell用于重用）
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"IntegralTableViewCell" owner:self options:nil] lastObject];
        NSLog(@"cell row == %ld",(long)indexPath.row);
    }
    [cell loadSubView:[NSArray arrayWithObjects:@"",@"" ,nil]];
//    [cell loadSubView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [Util myYOrHeight:200];
    
}

@end
