//
//  PetDoorServiceViewController.h
//  PetShop
//
//  Created by zx_06 on 15/7/1.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetDoorServiceTableViewCell.h"
#import "PetSearchBar.h"
@interface PetDoorServiceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PetDoorServiceTableViewCellDelegate,PetSearchBarDelegate>

@property (nonatomic,retain) UITableView *dServiceTableView;//列表

@end
