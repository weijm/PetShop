//
//  DateView.h
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateView : UIView
{
    
    IBOutlet UIView *dateViewBg;
    
    IBOutlet UILabel *titleLab;
   
    
    IBOutlet UIView *lineBg5;
}
@property (nonatomic,retain) NSDictionary *currentDic;//当前月份信息
/**
 初始化每个月的视图
 */
-(void)loadSubView:(NSDictionary*)dictionary;
/**
 添加当天的标记视图 显示已经签到的日期
 */
-(void)initMarkView:(int)titMonth SignDate:(NSArray*)signArray;


- (IBAction)clickNumber:(id)sender;

@end
