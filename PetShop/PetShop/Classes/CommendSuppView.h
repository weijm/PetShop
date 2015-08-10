//
//  CommendSuppView.h
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommendSuppView : UIView
{
    __weak IBOutlet UIView *leftLine;
    
    __weak IBOutlet UIView *rightLine;
    
    __weak IBOutlet UIView *topLine;
    
    __weak IBOutlet UIView *bottomLine;
}
-(void)loadSubView;
@end
