//
//  SuppliesDetailsViewController.h
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuppliesDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *detailTableView;
}
- (IBAction)clickedBuyBtAction:(id)sender;
- (IBAction)clickedReadyBuyAction:(id)sender;

@end
