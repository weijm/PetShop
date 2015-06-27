//
//  MakeSureOrderViewController.m
//  PetShop
//
//  Created by wjm on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MakeSureOrderViewController.h"
#import "OrderTableViewCell.h"

@interface MakeSureOrderViewController ()
{
    __block NSMutableDictionary *countInfoDic;
}

@end

@implementation MakeSureOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"确认订单";
    //将cell的分割线去掉
    dataTalbeView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0 ) {
        return 1;
    }
    return 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSString *xibName = [NSString stringWithFormat:@"OrderTableViewCellS%ldR%ld",(long)indexPath.section,(long)indexPath.row];
    OrderTableViewCell *tcell= [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    tcell.updateCell = ^(OrderTableViewCell *cell)
    {
        [self updateCell:cell];
    };
    if (countInfoDic) {
        int count = [[countInfoDic objectForKey:@"count"] intValue];
//        float price = [[countInfoDic objectForKey:@"price"] floatValue];
        [tcell loadNumber:count];
    }
    cell = tcell;

    if (indexPath.section == 1) {
        if (indexPath.row !=2) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, [Util myYOrHeight:10])];
        headerView.backgroundColor = Rgb(212, 212, 212);
        headerView.alpha = 0.8;
        return headerView;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (section == 1)?10:0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [Util myYOrHeight:80];
    }else
    {
        if (indexPath.row ==0) {
            return [Util myYOrHeight:130];
        }
        else if (indexPath.row ==1)
        {
            return [Util myYOrHeight:60];
        }
        return [Util myYOrHeight:40];
   
    }
}
//更新界面
-(void)updateCell:(OrderTableViewCell*)cell
{
    countInfoDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:cell.suppliesCount],@"count",[NSNumber numberWithFloat:cell.price],@"price", nil];
    [dataTalbeView reloadData];
    int count = [[countInfoDic objectForKey:@"count"] intValue];
    tPriceLab.text = [NSString stringWithFormat:@"¥ %.2f",(count*29.0)*100/100];
}
@end
