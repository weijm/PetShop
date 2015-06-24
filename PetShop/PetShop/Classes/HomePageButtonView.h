//
//  HomePageButtonView.h
//  PetShop
//
//  Created by weijuanmin on 15-6-12.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomePageButtonViewDelegate<NSObject>
@optional
-(void)clickedBtAction:(NSInteger)index;
@end
@interface HomePageButtonView : UIView
{
    
    IBOutlet UIView *buttonbg;
}
@property(nonatomic,retain)id<HomePageButtonViewDelegate>delegate;
- (IBAction)clickedBt:(id)sender;

@end
