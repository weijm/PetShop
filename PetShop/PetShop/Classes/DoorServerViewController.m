//
//  DoorServerViewController.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "DoorServerViewController.h"
#import "DoorServerTableViewCell.h"

@interface DoorServerViewController ()
{
    UITextField *searchField;
    
    UITapGestureRecognizer *tapGesture;
}
@end

@implementation DoorServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"上门服务";
    [self initSearchView];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initTableView
{
    listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topBarheight+50, kWidth, kHeight-50-topBarheight)];
    listTableView.delegate = self;
    listTableView.dataSource = self;
    listTableView.showsVerticalScrollIndicator = NO;
    listTableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:listTableView];
}
-(void)initSearchView
{
    UIView *searchBg = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 50)];
    searchBg.backgroundColor = Rgb(232, 234, 235);
    [self.view addSubview:searchBg];
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake([Util myXOrWidth:15], [Util myYOrHeight:10], kWidth-[Util myXOrWidth:15]*2, [Util myYOrHeight:30])];
    bgImg.image = [UIImage imageNamed:@"homepage_door_searchBg"];
    bgImg.userInteractionEnabled = YES;
    [searchBg addSubview:bgImg];
    searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, (kWidth-[Util myXOrWidth:15]*2-[Util myXOrWidth:80]), [Util myYOrHeight:30])];
    searchField.delegate = self;
    searchField.placeholder = @"请输入搜索关键字";
    searchField.font = [UIFont systemFontOfSize:13];
    [bgImg addSubview:searchField];
    
    UIButton *searchBt = [[UIButton alloc] initWithFrame:CGRectMake(searchField.frame.size.width+15, 0, [Util myXOrWidth:60], [Util myYOrHeight:30])];
    [searchBt setTitle:@"搜 索" forState:UIControlStateNormal];
    [searchBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBt addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    float fontSize = 14;
    if (kIphone6||kIphone6plus) {
        fontSize = 16;
    }
    searchBt.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [bgImg addSubview:searchBt];
    
}
#pragma mark - UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DoorServerTableViewCellID";
    DoorServerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[DoorServerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row%2!=0) {
        cell.contentView.backgroundColor = Rgb(232, 234, 235);
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [Util myYOrHeight:100]+93;
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self addTapView];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self tapCancel:NO];
    return YES;
}
-(void)addTapView
{
    UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight+50, kWidth, kHeight)];
    tapView.backgroundColor = [UIColor blackColor];
    tapView.alpha = 0.0;
    tapView.tag = 250;
    [self.view addSubview:tapView];
    [UIView animateWithDuration:0.2 animations:^{
        tapView.alpha = 0.2;
    } completion:nil];
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCancel:)];
    [tapView addGestureRecognizer:tapGesture];
}
-(void)tapCancel:(BOOL)isSearch
{
    [searchField resignFirstResponder];
    if (!isSearch) {
        searchField.text = @"";
    }
    UIView *tempView = [self.view viewWithTag:250];
    if (tempView) {
        [UIView animateWithDuration:0.2 animations:^{
            tempView.alpha = 0;
        } completion:^(BOOL finished) {
            [tempView removeFromSuperview];
        }];
    }
    
}
#pragma mark - 搜索的触发事件
-(void)searchAction
{
    
    if ([searchField.text length]==0) {
        return;
    }
    //取消搜索页面
    [self tapCancel:YES];
    //出现搜索结果
    NSLog(@"searchAction 出现搜索结果");
}
@end
