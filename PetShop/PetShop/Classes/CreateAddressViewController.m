//
//  CreateAddressViewController.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CreateAddressViewController.h"
#import "MakeSureOrderViewController.h"
#import "OrderAddress.h"

#define FOOTERTAG 10
#define FOOTERHEIGHT [Util myYOrHeight:50]

@interface CreateAddressViewController ()
{
    NSMutableDictionary *contentDictionary;  //编辑的内容
}

@end

@implementation CreateAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"编辑收货地址";
    //去掉tableView的分割线
    dataTableView.separatorColor = [UIColor clearColor];
    
    //编辑的内容
    if(_createType==0)
    {
        contentDictionary = [[NSMutableDictionary alloc] init];
    }else
    {
        contentDictionary = [[NSMutableDictionary alloc] initWithDictionary:_orderAddressDic];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return 4;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"OrderAddressListId";
    CreateAddressTableViewCell *cell = (CreateAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellid];//（寻找标识符为cellid并且没被用到的cell用于重用）
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CreateAddressTableViewCell" owner:self options:nil] lastObject];
    }
    cell.tag = indexPath.row;
    //加载内容
    [cell loadsubView:contentDictionary];
    cell.finishedThisCell = ^(NSString *string,NSInteger index)
    {
        [self operateTextFieldContent:string index:index];
    };
    cell.delegate = self;

    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    float fWidth = [Util myXOrWidth:150];
    float fheight = [Util myYOrHeight:40];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, FOOTERHEIGHT)];
    footerView.tag = FOOTERTAG;
    UIButton *saveBt = [[UIButton alloc] initWithFrame:CGRectMake((kWidth-fWidth)/2, FOOTERHEIGHT-fheight, fWidth, fheight)];
    [saveBt setTitle:@"保存并使用" forState:UIControlStateNormal];
    [saveBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBt setBackgroundImage:[UIImage imageNamed:@"homepage_suppbuy_bt.png"] forState:UIControlStateNormal];
    [saveBt addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    saveBt.layer.cornerRadius = 2.0;
    [footerView addSubview:saveBt];
    return footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FOOTERHEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        return [Util myYOrHeight:65];
    }
    return [Util myYOrHeight:45];
}
#pragma mark - 保存地址
-(void)saveData
{
    if ([contentDictionary allKeys].count<4) {
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:@"请将信息填写完整" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alterView show];
        return;
    }
    //保存到数据库中
    [contentDictionary setObject:@"1" forKey:@"userId"];
    int orderAddressId = 0;
    if (_createType==0) {//新建
        [[OrderAddress sharedInstance] insertData:contentDictionary];
    }else
    {//修改
        [[OrderAddress sharedInstance] updateData:contentDictionary];
        orderAddressId = [[contentDictionary objectForKey:ORDERID] intValue];
    }
    
    //返回到订单页面
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[MakeSureOrderViewController class]]) {
            MakeSureOrderViewController *tempVC = (MakeSureOrderViewController *)vc;
            tempVC.isEditAddress = YES;
            tempVC.orderAddressId = orderAddressId;
            [self.navigationController popToViewController:tempVC animated:YES];
        }
    }
    
}
#pragma mark - 将编辑的内容暂时放入dictionary中
-(void)operateTextFieldContent:(NSString *)string index:(NSInteger)index
{
    if ([string length]==0) {
        return;
    }
    NSString *keyString = PERSONALNAME;
    switch (index) {
        case 0:
            keyString = PERSONALNAME;
            break;
        case 1:
            keyString = PHONE;
            break;
        case 2:
            keyString = AREA;
            break;
        case 3:
            keyString = ADDRESS;
            break;
        case 4:
            keyString = ISDEFAULT;
            break;
        default:
            break;
    }
    [contentDictionary setObject:string forKey:keyString];
    
}
#pragma mark - CreateAddressTableViewCellDelegate
-(void)chooseAddressInfo
{
    [dataTableView reloadData];
    
    AreaPickerView *pickerView = [[AreaPickerView alloc] initWithStyle:AreaPickerWithStateAndCityAndDistrict delegate:self];
    [pickerView showInView:self.view];
    pickerView.finishedThisCell = ^(NSString *string,NSInteger index,AreaPickerView *pickView){
        [self operateTextFieldContent:string index:index];
        [pickView cancelPicker];
        [dataTableView reloadData];
    };

}
@end
