//
//  SuppliesDetailsViewController.m
//  商品详情
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesDetailsViewController.h"
#import "InfoTableViewCell.h"
#import "SuppliesGraphicSummaryView.h"


#define SummaryViewHeight 300
#define DataCount 4

#define ReadyViewHeight 380

#define ReadyViewTag 100;

@interface SuppliesDetailsViewController ()

@end

@implementation SuppliesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品详情";
    detailTableView.separatorColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return DataCount;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID=@"CELL";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        if (indexPath.row == 0) {
            //首行图文共存的介绍
            cell = [UITableViewCell new];
            CGRect frame = CGRectMake(0, 0, kWidth, [Util myYOrHeight:SummaryViewHeight]);
            SuppliesGraphicSummaryView *summaryView = [[SuppliesGraphicSummaryView alloc] initWithFrame:frame];
            summaryView.colletedOrCancel = ^(NSString *string){
                [self showPromptView:string];
            };
            [cell.contentView addSubview:summaryView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else
        {//其他简单的cell
        
            InfoTableViewCell *tcell= [[[NSBundle mainBundle] loadNibNamed:@"InfoTableViewCell" owner:nil options:nil] lastObject];
            CGRect frame = tcell.frame;
            frame.size.width = kWidth;
            tcell.frame = frame;
            tcell.tag = indexPath.row;
            [tcell loadContent:123];
            
            cell = (UITableViewCell*)tcell;
        }
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [Util myYOrHeight:SummaryViewHeight];
    }else
    {
        return 44;
   
    }
}
#pragma mark - 各种按钮的触发事件
//立即购买的触发事件
- (IBAction)clickedBuyBtAction:(id)sender {
    NSLog(@"clickedBuyBtAction");
    [self appearBuyView:YES];
}
//加入购物车的触发事件
- (IBAction)clickedReadyBuyAction:(id)sender {
    NSLog(@"clickedReadyBuyAction");
    [self appearBuyView:NO];
}
#pragma mark －立即购买和加入购物车的界面
- (void)appearBuyView:(BOOL)isBuy
{
    //添加所有视图的父视图
    UIView *buyBg = [[UIView alloc] initWithFrame:self.view.window.frame];
    buyBg.backgroundColor = [UIColor clearColor];
    buyBg.tag = ReadyViewTag;
    buyBg.userInteractionEnabled = YES;
    [self.navigationController.view addSubview:buyBg];

    //遮罩视图
    UIView *subBg = [[UIView alloc] initWithFrame:self.view.window.frame];
    subBg.backgroundColor = [UIColor blackColor];
    subBg.alpha = 0;
    subBg.tag = 1;
    [buyBg addSubview:subBg];
    
    float theight = ReadyViewHeight;
    float height = [Util myYOrHeight:theight];
    CGRect frame = CGRectMake(0, self.view.frame.size.height+height, kWidth, height);
    //购买视图
    ReadyBuyView *buyView = [[ReadyBuyView alloc] initWithFrame:frame];
    buyView.addToCart = ^(NSString *string){
        [self showPromptView:string];
    };
    buyView.delegate = self;
    buyView.tag =2;
    buyView.buyNow = isBuy;
    [buyBg addSubview:buyView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView animateWithDuration:0.4 animations:^{
        CGRect tFrame = buyView.frame;
        tFrame.origin.y = self.view.frame.size.height-height;
        buyView.frame = tFrame;
        
        subBg.alpha = 0.7;
    }];
    [UIView commitAnimations];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeBuyView)];
    [subBg addGestureRecognizer:tap];
}
//移除购买选择的页面
-(void)removeBuyView
{
    NSInteger tag = ReadyViewTag;
    UIView *buyBg = [self.navigationController.view viewWithTag:tag];
    if (buyBg) {
        UIView *subBg = [buyBg viewWithTag:1];
        ReadyBuyView * buyView = (ReadyBuyView *)[buyBg viewWithTag:2];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView animateWithDuration:0.4 animations:^{
            CGRect tFrame = buyView.frame;
            tFrame.origin.y = tFrame.origin.y+tFrame.size.height;
            buyView.frame = tFrame;
            subBg.alpha = 0;
        } completion:^(BOOL finished){
            [buyBg removeFromSuperview];
        }];
        [UIView commitAnimations];
    }
}
#pragma mark - ReadyBuyViewDelegate
//关闭购买选择页面
-(void)closeView
{
    [self removeBuyView];
}
#pragma mark - 提示语界面
-(void)showPromptView:(NSString*)content
{
    MBProgressHUD * progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:progressHUD];
    //这里添加的图片是37*37
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homepage_checkmark"]];
    
    // Set custom view mode
    progressHUD.mode = MBProgressHUDModeCustomView;
    
    progressHUD.delegate = self;
    progressHUD.labelText = content;
    [progressHUD show:YES];
    [progressHUD hide:YES afterDelay:1.0];
}
#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    MBProgressHUD *progressHUD = (MBProgressHUD *)[self.navigationController.view viewWithTag:HUDTAG];
    [progressHUD removeFromSuperview];
    progressHUD = nil;
}

@end
