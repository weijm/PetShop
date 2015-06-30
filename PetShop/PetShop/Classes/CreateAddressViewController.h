//
//  CreateAddressViewController.h
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateAddressTableViewCell.h"
#import "AreaPickerView.h"
@interface CreateAddressViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CreateAddressTableViewCellDelegate,AreaPickerViewDelegate>
{
    
    IBOutlet UITableView *dataTableView;
}
@end
