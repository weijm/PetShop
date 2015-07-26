//
//  SuppliesListViewController.h
//  分类的商品类表
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegmentView.h"
@interface SuppliesListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CustomSegmentViewDelegate>
{
    
     UITableView *listTableView;
    
    
    IBOutlet UISearchBar *searchBar;
    
    
    IBOutlet UIView *searchBg;
}
@property(nonatomic) NSInteger categoryType;//0 狗狗用品 1 猫猫用品 2 小宠用品 3 水族用品 
@end
