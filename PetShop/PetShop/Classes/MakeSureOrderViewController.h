//
//  MakeSureOrderViewController.h
//  PetShop
//
//  Created by wjm on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeSureOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *dataTalbeView;
    
    NSMutableArray *dataArray;
    
    NSMutableDictionary *addressDic;
    IBOutlet UILabel *tPriceLab;
}
@property(nonatomic) int orderAddressId;//选中地址的id
@property(nonatomic) BOOL isEditAddress;
@property(nonatomic) int orderId;
- (IBAction)makeSureOrder:(id)sender;

@end
