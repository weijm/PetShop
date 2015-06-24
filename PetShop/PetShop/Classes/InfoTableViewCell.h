//
//  InfoTableViewCell.h
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewCell : UITableViewCell
{
    IBOutlet UIImageView *iconView;
    
    IBOutlet UILabel *titleLab;
}
-(void)loadContent:(int)commentCount;
@end
