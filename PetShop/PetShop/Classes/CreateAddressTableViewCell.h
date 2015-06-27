//
//  CreateAddressTableViewCell.h
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAddressTableViewCell : UITableViewCell
{
    //标题
    IBOutlet UILabel *titleLab;
    //编辑视图
    IBOutlet UITextField *contentTextFiled;
    //箭头
    IBOutlet UIImageView *arrowView;
}
-(void)loadsubView;
@end
