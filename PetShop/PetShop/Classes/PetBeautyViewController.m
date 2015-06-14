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
    
    segmentView = [[SegementBtnView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 44)];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
    
    tqMultiTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, kHeight)];
    tqMultiTableView.dataSource = self;
    tqMultiTableView.delegate   = self;
    tqMultiTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tqMultiTableView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tqMultiTableView.bounds.size.width, 100)];
    view.backgroundColor = [UIColor colorWithRed:251/255.0 green:125/255.0 blue:91/255.0 alpha:1];
    
    tqMultiTableView.atomView = view;

    
    
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

- (NSInteger)mTableView:(TQMultistageTableView *)mTableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)mTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [mTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    view.layer.backgroundColor  = [UIColor colorWithRed:246/255.0 green:213/255.0 blue:105/255.0 alpha:1].CGColor;
    view.layer.masksToBounds    = YES;
    view.layer.borderWidth      = 0.5;
    view.layer.borderColor      = [UIColor colorWithRed:250/255.0 green:77/255.0 blue:83/255.0 alpha:1].CGColor;
    
    cell.backgroundView = view;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)mTableView
{
    return 3;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForAtomAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UIView *)mTableView:(TQMultistageTableView *)mTableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *header = [[UIView alloc] init];
    
    header.layer.backgroundColor    = [UIColor colorWithRed:218/255.0 green:249/255.0 blue:255/255.0 alpha:1].CGColor;
    header.layer.masksToBounds      = YES;
    header.layer.borderWidth        = 0.5;
    header.layer.borderColor        = [UIColor colorWithRed:179/255.0 green:143/255.0 blue:195/255.0 alpha:1].CGColor;
    return header;
}

- (void)mTableView:(TQMultistageTableView *)mTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRow ----%d",indexPath.row);
}

#pragma mark - Header Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"Open Header ----%d",section);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"Close Header ---%d",section);
}

#pragma mark - Row Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Open Row ----%d",indexPath.row);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Close Row ----%d",indexPath.row);
}

@end

