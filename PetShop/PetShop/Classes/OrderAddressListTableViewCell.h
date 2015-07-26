//
//  OrderAddressListTableViewCell.h
//  PetShop
//
//  Created by lyk on 15/7/18.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OrderAddressListTableViewCell : UITableViewCell
{
    //姓名 电话
    IBOutlet UILabel *nameAndPhoneLab;
    //地址
    IBOutlet UILabel *addressLab;
    
    IBOutlet NSLayoutConstraint *infoBgToLeft;
    IBOutlet UIView *markBg;
    
    BOOL isSelected;
}
@property (nonatomic,copy) void (^editAddress)(int index);
@property (nonatomic,copy) void (^selectedAddress)(int index,BOOL isSelected);
/**
 加载cell上的数据
 */
-(void)loadCellData:(NSDictionary*)orderAddressDic;
/**
 删除数据
 */
- (IBAction)editSeleted:(id)sender;
/**
 取消选中标志
 */
-(void)revertView;
@end
