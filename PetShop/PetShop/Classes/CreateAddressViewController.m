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
    
    //编辑的内容
    contentDictionary = [[NSMutableDictionary alloc] init];

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
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CreateAddressTableViewCell *tcell= [[[NSBundle mainBundle] loadNibNamed:@"CreateAddressTableViewCell" owner:nil options:nil] lastObject];
    tcell.tag = indexPath.row;
    [tcell loadsubView:contentDictionary];
    tcell.finishedThisCell = ^(NSString *string,NSInteger index)
    {
        [self operateTextFieldContent:string index:index];
    };
    tcell.delegate = self;

    UITableViewCell *cell = tcell;
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
    //保存到数据库中
    [contentDictionary setObject:@"1" forKey:@"userId"];
    [[OrderAddress sharedInstance] insertData:contentDictionary];
    //返回到订单页面
    
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
