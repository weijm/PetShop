//
//  OrderAddressListViewController.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderAddressListViewController.h"
#import "CreateAddressViewController.h"
#import "OrderAddressListTableViewCell.h"
#import "OrderAddress.h"
#import "MakeSureOrderViewController.h"

@interface OrderAddressListViewController ()

@end

@implementation OrderAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"收获地址";
    listTableView.separatorColor = [UIColor clearColor];
//    dataArray = [[NSMutableArray alloc] initWithArray:[[OrderAddress sharedInstance] getAllData]];
    selectedRow = -1;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_bt"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    dataArray = [[NSMutableArray alloc] initWithArray:[[OrderAddress sharedInstance] getAllData]];
    [listTableView reloadData];
    
}
-(void)leftAction
{
    //返回到订单页面
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[MakeSureOrderViewController class]]) {
            MakeSureOrderViewController *tempVC = (MakeSureOrderViewController *)vc;
            tempVC.isEditAddress = YES;
            NSDictionary *dic = [dataArray objectAtIndex:selectedRow];
            tempVC.orderAddressId = [[dic objectForKey:ORDERID] intValue];
            [self.navigationController popToViewController:tempVC animated:YES];
        }
    }

    
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [dataArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellid=@"OrderAddressListId";
    OrderAddressListTableViewCell *cell = (OrderAddressListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];//（寻找标识符为cellid并且没被用到的cell用于重用）
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderAddressListTableViewCell" owner:self options:nil] lastObject];
        cell.editAddress = ^(int index){
            [self editOrderAddress:index];
        };
        cell.selectedAddress = ^(int index,BOOL isSelected){
            [self selectedAddress:index Selected:isSelected];
        };
        
    }
    cell.tag = indexPath.row;
    NSDictionary *dic = [dataArray objectAtIndex:indexPath.row];
    [cell loadCellData:dic];
    
    if (selectedRow>=0) {
        if (indexPath.row != selectedRow) {
            [cell revertView];
        }
    }


    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"delete row %ld",(long)indexPath.row);
    //删除数据库
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.row];
    [[OrderAddress sharedInstance] deleteData:[[dictionary objectForKey:ORDERID] intValue]];
    //删除cell
    [dataArray removeObjectAtIndex:indexPath.row];
    //刷新tableView
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
#pragma mark - 创建新的地址
- (IBAction)createAddress:(id)sender {
    CreateAddressViewController *createAddressVC = [[CreateAddressViewController alloc] init];
    createAddressVC.createType = 0;
    [self.navigationController pushViewController:createAddressVC animated:YES];
}
#pragma mark - 编辑地址
-(void)editOrderAddress:(int)index
{
    CreateAddressViewController *createAddressVC = [[CreateAddressViewController alloc] init];
    createAddressVC.createType = 1;
    createAddressVC.orderAddressDic = [dataArray objectAtIndex:index];
    [self.navigationController pushViewController:createAddressVC animated:YES];
}
#pragma mark - 选择某个地址
-(void)selectedAddress:(int)index Selected:(BOOL)isSelected
{
    if (isSelected) {//选中
        //还原其他视图
        selectedRow = index;
        [listTableView reloadData];
        
    }else
    {//取消选中
    }
    
}
@end
