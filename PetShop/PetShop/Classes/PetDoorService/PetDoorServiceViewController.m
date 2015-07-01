//
//  PetDoorServiceViewController.m
//  PetShop
//
//  Created by zx_06 on 15/7/1.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetDoorServiceViewController.h"
#import "PetDoorServiceTableViewCell.h"
#import "Util.h"
#import "PetSearchBar.h"
@interface PetDoorServiceViewController ()
{
    UIWebView *phoneWebView;
}
@end

@implementation PetDoorServiceViewController
@synthesize dServiceTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"上门服务";
    dServiceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, kHeight-topBarheight) style:UITableViewStylePlain];
    dServiceTableView.dataSource = self;
    dServiceTableView.delegate = self;
    [self.view addSubview:dServiceTableView];
    //搜索
    UIView *search = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 44)];
    search.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:239/255.0 alpha:1.0];
    [self.view addSubview:search];
    
    PetSearchBar *searchBar = [[PetSearchBar alloc] initWithFrame:CGRectMake(0, 5, kWidth, 34)];
    searchBar.delegate = self;
    [searchBar searchDataByArray:nil];//传入所有数据数组，方便搜索时比较
    [search addSubview:searchBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  [Util myYOrHeight:200];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"doorService";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell==nil) {
        PetDoorServiceTableViewCell *dcell = [[[NSBundle mainBundle] loadNibNamed:@"PetDoorServiceTableViewCell" owner:self options:nil] lastObject];
        dcell.delegate = self;
        [dcell loadDoorServiceTableViewcell:nil];
        CGRect frame = dcell.frame;
        frame.size.width = kWidth;
        dcell.frame = frame;
        
        cell = dcell;
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"xuanze%ld",(long)indexPath.row);
}
#pragma mark - PetDoorServiceTableViewCellDelegate
- (void)CallTheDoorService:(NSString *)phoneNumber{
    if (phoneWebView==nil) {
        phoneWebView = [[UIWebView alloc] init];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]];
    [phoneWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
/////////////////////////////////////////PetSearchBarDelegate////////////////////////////////////
- (void)reloadTableViewBySearchResult:(NSArray *)searchResultArray{
    //根据搜索结果刷新tableview
}
@end
