//
//  MonoBaseInfoTableViewCell.h
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonoBaseInfoTableViewCell : UITableViewCell
{
    //图标
    __weak IBOutlet UIImageView *iconImg;
    __weak IBOutlet NSLayoutConstraint *iconWidth;
    
    __weak IBOutlet NSLayoutConstraint *iconHeight;
    //标题
    
    __weak IBOutlet UILabel *contentLab;
}
/**
 加载数据和图片
 */
-(void)loadSubView:(NSString*)contentString;
@end
