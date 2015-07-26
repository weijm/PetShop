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
@property (nonatomic) int createType;//0 新建  1 修改
@property (nonatomic,strong) NSDictionary *orderAddressDic;
@end
