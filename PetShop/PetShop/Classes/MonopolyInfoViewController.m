//
//  MonopolyInfoViewController.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonopolyInfoViewController.h"
#import "MonoImgAndInfoTableViewCell.h"
#import "MonoBaseInfoTableViewCell.h"
#import "MonoCommendTableViewCell.h"
#import "MonopolyLacationViewController.h"

@interface MonopolyInfoViewController ()

@end

@implementation MonopolyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商户详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *cellid0=@"MonoImgAndInfoTableViewCellID";
        MonoImgAndInfoTableViewCell *cell = (MonoImgAndInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid0];//（寻找标识符为cellid并且没被用到的cell用于重用）
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MonoImgAndInfoTableViewCell" owner:self options:nil] lastObject];
        }
        cell.tag = indexPath.row;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2||indexPath.row == 3 || indexPath.row == 5 ||indexPath.row == 6||indexPath.row == 10)
    {
        static NSString *cellid1=@"MonoBaseInfoTableViewCellID";
        MonoBaseInfoTableViewCell *cell = (MonoBaseInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid1];//（寻找标识符为cellid并且没被用到的cell用于重用）
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MonoBaseInfoTableViewCell" owner:self options:nil] lastObject];
        }
        cell.tag = indexPath.row;
        [cell loadSubView:@""];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.row==8)
    {
        static NSString *cellid2=@"MonoCommendTableViewCellID";
        MonoCommendTableViewCell *cell = (MonoCommendTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid2];//（寻找标识符为cellid并且没被用到的cell用于重用）
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MonoCommendTableViewCell" owner:self options:nil] lastObject];
        }
        cell.tag = indexPath.row;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else
    {
        static NSString *cellid3=@"CellId";
        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid3];//（寻找标识符为cellid并且没被用到的cell用于重用）
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid3];
        }
        cell.contentView.backgroundColor = Rgb(231, 232, 234);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [Util myYOrHeight:220];
    }else if (indexPath.row == 2||indexPath.row == 3||indexPath.row == 5||indexPath.row == 6||indexPath.row == 10)
    {
        return [Util myYOrHeight:40];
    }else if(indexPath.row ==8)
    {
        return [Util myYOrHeight:200]+30;
    }else
    {
        return [Util myYOrHeight:10];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        MonopolyLacationViewController *locationVC = [[MonopolyLacationViewController alloc] init];
        [self.navigationController pushViewController:locationVC animated:YES];
    }
}
@end
