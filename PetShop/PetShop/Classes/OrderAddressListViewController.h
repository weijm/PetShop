//
//  OrderAddressListViewController.h
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderAddressListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *listTableView;
}
- (IBAction)createAddress:(id)sender;

@end
