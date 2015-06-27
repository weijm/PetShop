//
//  SuppliesDetailsViewController.h
//  商品详情
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadyBuyView.h"
@interface SuppliesDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ReadyBuyViewDelegate,MBProgressHUDDelegate>
{
    
    IBOutlet UITableView *detailTableView;
}
/**
 立即购买的触发事件
 */
- (IBAction)clickedBuyBtAction:(id)sender;
/**
 加入购物车的触发事件
 */
- (IBAction)clickedReadyBuyAction:(id)sender;

@end
