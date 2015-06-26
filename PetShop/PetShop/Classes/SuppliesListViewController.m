//
//  SuppliesListViewController.m
//  分类的商品类表
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesListViewController.h"
#import "SuppliesTableViewCell.h"

@interface SuppliesListViewController ()
{
    NSMutableArray *dataArray;
}
@end

@implementation SuppliesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    listTableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"CELL";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        //商品列表
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //展示商品详情
}

@end
