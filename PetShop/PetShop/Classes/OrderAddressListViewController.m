//
//  OrderAddressListViewController.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderAddressListViewController.h"
#import "CreateAddressViewController.h"

@interface OrderAddressListViewController ()

@end

@implementation OrderAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"收获地址";
    listTableView.separatorColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}
#pragma mark - 创建新的地址
- (IBAction)createAddress:(id)sender {
    CreateAddressViewController *createAddressVC = [[CreateAddressViewController alloc] init];
    [self.navigationController pushViewController:createAddressVC animated:YES];
}
@end
