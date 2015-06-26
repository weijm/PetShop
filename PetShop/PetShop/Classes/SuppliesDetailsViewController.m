//
//  SuppliesDetailsViewController.m
//  PetShop
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
            
            cell = [UITableViewCell new];
            CGRect frame = CGRectMake(0, 0, kWidth, [Util myYOrHeight:SummaryViewHeight]);
            SuppliesGraphicSummaryView *summaryView = [[SuppliesGraphicSummaryView alloc] initWithFrame:frame];
            [cell.contentView addSubview:summaryView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else
        {
        
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
- (IBAction)clickedBuyBtAction:(id)sender {
    NSLog(@"clickedBuyBtAction");
    [self appearBuyView:YES];
}

- (IBAction)clickedReadyBuyAction:(id)sender {
    NSLog(@"clickedReadyBuyAction");
    [self appearBuyView:NO];
}
#pragma mark 立即购买和加入购物车的界面
- (void)appearBuyView:(BOOL)isBuy
{
    //添加所有视图的父视图
    UIView *buyBg = [[UIView alloc] initWithFrame:self.view.window.frame];
    buyBg.backgroundColor = [UIColor clearColor];
    buyBg.tag = ReadyViewTag;
    buyBg.userInteractionEnabled = YES;
    [self.view.window addSubview:buyBg];

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
    buyView.delegate = self;
    buyView.tag =2;
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

-(void)removeBuyView
{
    NSInteger tag = ReadyViewTag;
    UIView *buyBg = [self.view.window viewWithTag:tag];
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
    }
}
#pragma mark - ReadyBuyViewDelegate
-(void)closeView
{
    [self removeBuyView];
}
@end
