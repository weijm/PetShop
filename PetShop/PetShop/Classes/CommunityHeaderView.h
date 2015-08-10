//
//  CommunityHeaderView.h
//  PetShop
//
//  Created by lyk on 15/8/9.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityHeaderView : UIView
{
    __weak IBOutlet UIView *selectedLine2;
    
    __weak IBOutlet UIView *selectedLine1;
}
- (IBAction)selectedAction:(id)sender;

@end
