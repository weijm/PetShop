//
//  MonopolyInfoViewController.h
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonopolyInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *dataTableView;
}
@end
