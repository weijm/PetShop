//
//  PetHospitalViewController.h
//  PetShop
//
//  Created by zx_06 on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"
#import "PetHospitalCell.h"
#import "PetSearchBar.h"

@interface PetHospitalViewController : UIViewController<TQTableViewDataSource,TQTableViewDelegate,PetHospitalCellDelegate,PetSearchBarDelegate>

@property (nonatomic,retain) TQMultistageTableView *PHospitalTableView;

@end
