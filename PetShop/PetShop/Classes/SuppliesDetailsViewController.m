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
}

- (IBAction)clickedReadyBuyAction:(id)sender {
    NSLog(@"clickedReadyBuyAction");
}
@end
