//
//  CommunityTableViewCell.h
//  PetShop
//
//  Created by lyk on 15/8/9.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityTableViewCell : UITableViewCell
{
    
    __weak IBOutlet UILabel *contentLab;
    __weak IBOutlet UIView *topView;
}
-(void)loadSubView;
@end
