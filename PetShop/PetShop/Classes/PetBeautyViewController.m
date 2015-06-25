//
//  PetBeautyViewController.m
//  PetShop
//
//  Created by long on 15-6-14.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

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
    // Dispose of any resources that can be recreated.
}
#pragma mark - segmentDelegate
- (void)touchButton:(UIButton *)sender{
    NSLog(@"选择的butn是：%ld",(long)sender.tag);
    
}


#pragma mark - TQTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return 10;
}

- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

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

- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor colorWithRed:187/255.0 green:206/255.0 blue:190/255.0 alpha:1];;
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
            return 200;
            break;
        case 1:
            return 150;
            break;
        case 2:
            return 80;
            break;
            
        default:
            break;
    }
    return 100;
}
#pragma mark - 第一级cell
- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PetBeautyCareCell *petBcc = [[PetBeautyCareCell alloc] initWithFrame:CGRectMake(0, 0, kWidth, 100) andDictionary:nil];
    petBcc.delegate =self;
    
    //分割线
    UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.3)];
    lineViewTop.backgroundColor = [UIColor lightGrayColor];
    
    //分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 99.5, tableView.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [petBcc addSubview:lineViewTop];
    [petBcc addSubview:lineView];
    return petBcc;
    
}

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

