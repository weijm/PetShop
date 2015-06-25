//
//  PetBeautyViewController.m
//  PetShop
//
//  Created by long on 15-6-14.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#define firstCellHeight    200
#define secondCellHeight   150
#define thirdCellHeight    80

#import "PetBeautyViewController.h"
#import "SegementBtnView.h"
#import "TQMultistageTableView.h"
#import "PetBeautyCareCell.h"

@interface PetBeautyViewController ()
{
    UIWebView *phoneWebView;//打电话
}
@end

@implementation PetBeautyViewController
@synthesize segmentView,tqMultiTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物美容院";
    
    //tableView
    tqMultiTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 14, kWidth, kHeight-16)];
    tqMultiTableView.dataSource = self;
    tqMultiTableView.delegate   = self;
    tqMultiTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tqMultiTableView];
    
    //
    segmentView = [[SegementBtnView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 30)];
    segmentView.backgroundColor = [UIColor whiteColor];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - segmentDelegate
- (void)touchButton:(UIButton *)sender{
    NSLog(@"选择的butn是：%ld",(long)sender.tag);
    
}


#pragma mark - TQTableViewDataSource
#pragma mark -- 一级cell的个数
- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return 10;
}
#pragma mark -- 二级cell的个数
- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
#pragma mark - 第二级cell
- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }else{
        if ([cell.contentView.subviews lastObject]!=nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    UILabel *rowLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, kWidth-100, 30)];
    rowLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    switch (indexPath.row) {
        case 0:
            rowLabel.text = @"个人简历";
            break;
        case 1:
            rowLabel.text = @"成功案例";
            break;
        case 2:
            rowLabel.text = @"医治对象";
            break;
            
        default:
            break;
    }
    [cell.contentView addSubview:rowLabel];
    
    cell.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];

    return cell;
}

#pragma mark - 第三极cell
- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.editable = NO;
    
    switch (indexPath.row) {
        case 0:
        {
            view.frame = CGRectMake(0, 0, kWidth, firstCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, firstCellHeight-16);
            textView.text = @"还记得电影007中的那种便携式喷气背包吗？喷气背包中国首飞即将来临，能让你像007一样遨游天际。7月11日，百度新闻与极客公园联合主办的“The BIG Talk·新飞行时代”峰会，见证喷气背包中国首飞！除了喷气背包中国首飞，还有无人机等全球最前沿的飞行科技，让飞行不再是梦想。";
            
        }
            break;
        case 1:
        {
            view.frame = CGRectMake(0, 0, kWidth, secondCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, secondCellHeight-16);
            textView.text = @"还记得电影007中的那种便携式喷气背包吗？\n喷气背包中国首飞即将来临，能让你像007一样遨游天际。\n7月11日，百度新闻与极客公园联合主办的“The BIG Talk·新飞行时代”峰会，见证喷气背包中国首飞！\n除了喷气背包中国首飞，还有无人机等全球最前沿的飞行科技，让飞行不再是梦想。";
        }
            break;
        case 2:
        {
            view.frame = CGRectMake(0, 0, kWidth, thirdCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, thirdCellHeight-16);
            textView.text = @"主治大型犬：像金毛等";
        }
            break;
            
        default:
            break;
    }
    
    [view addSubview:textView];
    return view;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return firstCellHeight;
            break;
        case 1:
            return secondCellHeight;
            break;
        case 2:
            return thirdCellHeight;
            break;
            
        default:
            break;
    }
    return thirdCellHeight;
}
#pragma mark - 第一级cell
- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PetBeautyCareCell *petBcc = [[PetBeautyCareCell alloc] initWithFrame:CGRectMake(0, 0, kWidth, 100) andDictionary:nil];
    petBcc.delegate =self;
    
    //上分割线
    UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.3)];
    lineViewTop.backgroundColor = [UIColor lightGrayColor];
    
    //下分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 99.5, tableView.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [petBcc addSubview:lineViewTop];
    [petBcc addSubview:lineView];
    return petBcc;
    
}
//header点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClick%d",section);
}

//celll点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellClick%@",indexPath);
}

//header展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerOpen%d",section);
}

//header关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClose%d",section);
}

- (void)mTableView:(TQMultistageTableView *)tableView willOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"OpenCell%@",indexPath);
}

- (void)mTableView:(TQMultistageTableView *)tableView willCloseCellAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"CloseCell%@",indexPath);
}

/////////////////////////////////////PetBeautyCareCellDelegate//////////////////////////
- (void)CallPetbeautyCarePhoneNumber:(NSString *)phoneNumber{
    if (phoneWebView==nil) {
        phoneWebView = [[UIWebView alloc] init];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]];
    [phoneWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
@end

