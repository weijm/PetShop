//
//  DoorServerViewController.h
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoorServerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *listTableView;
}
@end
