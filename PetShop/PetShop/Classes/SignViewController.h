//
//  SignViewController.h
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateView.h"

@interface SignViewController : UIViewController<UIScrollViewDelegate,DateViewDelegate>
{
    
    IBOutlet UIView *dateViewBg;
    IBOutlet UIScrollView *dateScrollView;
}
@end
