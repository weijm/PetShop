//
//  CreateAddressViewController.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CreateAddressViewController.h"
#import "CreateAddressTableViewCell.h"

#define FOOTERTAG 10
#define FOOTERHEIGHT 50

@interface CreateAddressViewController ()

@end

@implementation CreateAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"编辑收货地址";
    //删除按钮
    UIButton *rightBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightBt setTitle:@"删除" forState:UIControlStateNormal];
    [rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBt addTarget:self action:@selector(deleteAddress) forControlEvents:UIControlEventTouchUpInside];
    rightBt.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 0, 0);
    rightBt.titleLabel.font = [UIFont systemFontOfSize:16];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBt];
    self.navigationItem.rightBarButtonItem = rightItem;
    //去掉tableView的分割线
    dataTableView.separatorColor = [UIColor clearColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 删除事件
-(void)deleteAddress
{
    NSLog(@"删除");
}
#pragma mark -UItableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CreateAddressTableViewCell *tcell= [[[NSBundle mainBundle] loadNibNamed:@"CreateAddressTableViewCell" owner:nil options:nil] lastObject];
    tcell.tag = indexPath.row;

    UITableViewCell *cell = tcell;
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, FOOTERHEIGHT)];
    footerView.tag = FOOTERTAG;
    UIButton *saveBt = [[UIButton alloc] initWithFrame:CGRectMake((kWidth-150)/2, FOOTERHEIGHT-40, 150, 40)];
    [saveBt setTitle:@"保存并使用" forState:UIControlStateNormal];
    [saveBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveBt.backgroundColor = kNavigationBgColor;
    [saveBt addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:saveBt];
    return footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FOOTERHEIGHT;
}
#pragma mark - 保存地址
-(void)saveData
{
    
}
@end
