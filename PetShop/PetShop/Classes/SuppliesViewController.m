//
//  SuppliesViewController.m
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesViewController.h"
#import "SuppliesBannerView.h"
#import "SuppliesTableViewCell.h"

#define BTCOUNT 3
#define ListBgTag 100
@interface SuppliesViewController ()

@end

@implementation SuppliesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宠物用品";
    
    [self initSegmentBt];
    
    //适配bannerView的高度
    CGRect frame = bannerBg.frame;
    frame.size.height = [Util myYOrHeight:frame.size.height];
    bannerBg.frame = frame;
    NSLog(@"yy == %f.height == %f",frame.origin.y,frame.size.height);
    //ios7以上的版本滚动视图自动产生竖向偏移
    if (kDeviceVersion>=7.0 &&[self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //初始化bannerView
    [self initBannerView];
    
    //添加tableView视图
    float originY = frame.size.height;
    float sizeHeight = frame.origin.y;
    CGRect  tableFrame = CGRectMake(0, originY+sizeHeight, kWidth, kHeight-originY-sizeHeight);
    
    UITableView *dataTableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    [self.view addSubview:dataTableView];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    
//    frame.size.height = [Util myYOrHeight:frame.size.height];
//    dataTableView.frame = frame;

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
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"CELL";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        // cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:ID];
        //通过xib文件加载cell
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
    for (UIView *view in [segmentView subviews]) {
        if ([view isKindOfClass:[CustomSegmentView class]]&&view.tag!=viewTag) {//将为选中的按钮的下划线隐藏
            CustomSegmentView *tempView = (CustomSegmentView *)view;
            tempView.hLine.hidden = YES;
            tempView.backgroundColor = [UIColor whiteColor];
        }
    }
    if (viewTag == 1) {//全部用品的点击事件
        [self clickAllSupplies];
    }
    
    
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
    /*0 狗狗用品 1 猫猫用品 2 小宠用品 3 水族用品 */
    UIButton *bt = (UIButton*)sender;
    NSLog(@"tag == %d",bt.tag);
    switch (bt.tag) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
    
    [self removeListBg];
}
-(void)removeListBg
{
    UIView *tempListBg = [self.view viewWithTag:ListBgTag];
    if (tempListBg) {
        [tempListBg removeFromSuperview];
    }
}
#pragma mark - 初始化bannerview
-(void)initBannerView
{
    SuppliesBannerView *bannerView = [[SuppliesBannerView alloc] initWithFrame:CGRectMake(0, 0,kWidth, bannerBg.frame.size.height)];
    [bannerView loadScrollViewSubView:[NSArray arrayWithObjects:@"homepage_banner1",@"homepage_banner1", nil]];
    [bannerBg addSubview:bannerView];
}
@end
