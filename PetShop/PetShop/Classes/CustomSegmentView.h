//
//  CustomSegmentView.h
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomSegmentViewDelegate <NSObject>
@optional
/**
 点击相应按钮触发的事件
 */
-(void)ClickBtByTag:(NSInteger)viewTag;
@end
@interface CustomSegmentView : UIView
{
    
    IBOutlet UIButton *segmentBt;
    IBOutlet UIView *vLine;
}

@property (strong, nonatomic) IBOutlet UIView *hLine;
@property (nonatomic,weak) id<CustomSegmentViewDelegate>  delegate;
-(void)loadButtonView;
- (IBAction)clickedCustomSegmentBt:(id)sender;

@end
