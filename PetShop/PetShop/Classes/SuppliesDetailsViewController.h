//
//  SuppliesDetailsViewController.h
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadyBuyView.h"
@interface SuppliesDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ReadyBuyViewDelegate>
{
    
    IBOutlet UITableView *detailTableView;
}
- (IBAction)clickedBuyBtAction:(id)sender;
- (IBAction)clickedReadyBuyAction:(id)sender;

@end
