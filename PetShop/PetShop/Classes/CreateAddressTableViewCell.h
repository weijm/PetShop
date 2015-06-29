//
//  CreateAddressTableViewCell.h
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAddressTableViewCell : UITableViewCell<UITextFieldDelegate>
{
    //标题
    IBOutlet UILabel *titleLab;
    //编辑视图
    IBOutlet UITextField *contentTextFiled;
    //箭头
    IBOutlet UIImageView *arrowView;
    //是否打开默认地址开关的提示
    IBOutlet UIView *defaultBg;
    //默认地址开关
    IBOutlet UISwitch *openSwitch;
}
//编辑信息的处理
@property (nonatomic,copy) void(^finishedThisCell)(NSString *string,NSInteger index);
//按要求加载cell
-(void)loadsubView;
- (IBAction)setDefault:(id)sender;
@end
