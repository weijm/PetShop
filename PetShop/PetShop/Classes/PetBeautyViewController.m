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

@interface PetBeautyViewController ()

@end

@implementation PetBeautyViewController
@synthesize segmentView,tqMultiTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物美容院";
    
    //tableView
    tqMultiTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 24, kWidth, kHeight)];
    tqMultiTableView.dataSource = self;
    tqMultiTableView.delegate   = self;
    tqMultiTableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tqMultiTableView];
    
    //
    segmentView = [[SegementBtnView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 44)];
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
    }
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    
    view.backgroundColor = [UIColor colorWithRed:128/255.0 green:156/255.0 blue:151/255.0 alpha:1];
    cell.backgroundView = view;
    
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
    return 100;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * control = [[UIView alloc] init];
    control.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, tableView.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%d",section];
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(20, 0, 200, 40);
    [control addSubview:label];
    [control addSubview:view];
    return control;
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


@end

