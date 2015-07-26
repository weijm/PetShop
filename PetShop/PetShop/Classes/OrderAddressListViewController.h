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
    //地址数组
    NSMutableArray *dataArray;
    
    int selectedId;
    
    int selectedRow;
}
//选中的地址
@property(nonatomic) int orderAddressId;
- (IBAction)createAddress:(id)sender;

@end
