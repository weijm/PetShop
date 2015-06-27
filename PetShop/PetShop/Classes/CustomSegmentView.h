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
    //点击按钮
    IBOutlet UIButton *segmentBt;
    //右侧分隔竖线
    IBOutlet UIView *vLine;
}

@property (strong, nonatomic) IBOutlet UIView *hLine;//底部分割横线
@property (nonatomic,weak) id<CustomSegmentViewDelegate>  delegate;
@property (nonatomic) BOOL isShowCoverView;//按钮是否已经被选中
/**
 加载button上的标题，显示或隐藏横竖线
 */
-(void)loadButtonView;
/**
 点击按钮的触发事件
 */
- (IBAction)clickedCustomSegmentBt:(id)sender;

@end
