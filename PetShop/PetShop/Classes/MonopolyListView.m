//
//  MonopolyListView.m
//  PetShop
//
//  Created by lyk on 15/7/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonopolyListView.h"
#import "MonopolyListTableViewCell.h"

#define  BTCOUNT 3

@implementation MonopolyListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"MonopolyListView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
-(void)initData:(int)type
{
    cateType = type;
    if (type == 1) {
        listArray = [[NSMutableArray alloc] initWithObjects:@"狗狗用品",@"猫猫用品",@"小宠用品",@"水族用品", nil];
    }else if (type == 2)
    {
        listArray = [[NSMutableArray alloc] initWithObjects:@"销售排序",@"信用排序", nil];
    }else
    {
        listArray = [[NSMutableArray alloc] initWithObjects:@"东城区",@"西城区",@"朝阳区",@"丰台区",@"石景山区",@"海淀区",@"门头沟区",@"房山区", nil];
    }
    
    [listTableView reloadData];
}
-(void)showView:(UIView *)view
{
    CGRect frame = view.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    UIView *areaBg = [[UIView alloc] initWithFrame:frame];
    areaBg.backgroundColor = [UIColor clearColor];
    areaBg.tag = 250;
    [view addSubview:areaBg];
    
    UIView *alphBg = [[UIView alloc] initWithFrame:frame];
    alphBg.backgroundColor = [UIColor grayColor];
    alphBg.alpha = 0;
    [areaBg addSubview:alphBg];
    
    float height = [Util myXOrWidth:20]*[listArray count];
    float btWidht = kWidth/BTCOUNT;
    self.frame = CGRectMake(btWidht*(cateType-1), 0, btWidht, height);
    [view addSubview:self];
    
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        
        alphBg.alpha = 0.8;
        self.alpha = 1.0;
        
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelView)];
    [areaBg addGestureRecognizer:tap];
}
-(void)cancelView
{
    UIView *supView = [self superview];
    UIView *areaBg = [supView viewWithTag:250];
    [UIView animateWithDuration:0.3 animations:^{
        areaBg.alpha = 0;
        self.alpha = 0;
    } completion:^(BOOL finished){
        [areaBg removeFromSuperview];
        [self removeFromSuperview];
    }];
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
return [listArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"MonopolyListTableViewCellID";
    MonopolyListTableViewCell *cell = (MonopolyListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];//（寻找标识符为cellid并且没被用到的cell用于重用）
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MonopolyListTableViewCell" owner:self options:nil] lastObject];
    }
    NSString *title = [listArray objectAtIndex:indexPath.row];
    cell.titLab.text = title;
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [Util myYOrHeight:20];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow((int)indexPath.row,[listArray objectAtIndex:indexPath.row]);
}
@end
