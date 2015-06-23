//
//  SuppliesViewController.h
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegmentView.h"

@interface SuppliesViewController : UIViewController<CustomSegmentViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UIView *bannerBg;
    IBOutlet UIView *segmentView;
}

@end
