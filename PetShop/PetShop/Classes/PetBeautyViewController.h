//
//  PetBeautyViewController.h
//  PetShop
//
//  Created by long on 15-6-14.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegementBtnView.h"
#import "TQMultistageTableView.h"

@interface PetBeautyViewController : UIViewController<SegementBtnViewDelegate,TQTableViewDataSource,TQTableViewDelegate>

@property (nonatomic,retain)SegementBtnView *segmentView;
@property (nonatomic,retain)TQMultistageTableView*tqMultiTableView;

@end
