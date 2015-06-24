//
//  DateView.h
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DateViewDelegate <NSObject>

@optional
-(void)clickedBackMonthBt:(int)titleMonth;
@end

@interface DateView : UIView
{
    
    IBOutlet UIView *dateViewBg;
    
    IBOutlet UILabel *titleLab;
   
    
    IBOutlet UIView *lineBg5;
}
@property (nonatomic,retain) NSDictionary *currentDic;//当前月份信息

@property (nonatomic,retain) id<DateViewDelegate> delegate;
/**
 初始化每个月的视图
 */
-(void)loadSubView:(NSDictionary*)dictionary;
/**
 添加当天的标记视图 显示已经签到的日期
 */
-(void)initMarkView:(int)titMonth SignDate:(NSArray*)signArray;

/**
 点击数组的触发事件
 */
- (IBAction)clickNumber:(id)sender;
/**
 点击月份前面按钮的触发事件
 */
- (IBAction)clickedLastMonthBtAction:(id)sender;
@end
