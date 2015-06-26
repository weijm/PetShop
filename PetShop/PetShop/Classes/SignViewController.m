//
//  SignViewController.m
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SignViewController.h"

#import "SignModel.h"

@interface SignViewController ()
{
    NSDictionary *currentDic;
}
@end

@implementation SignViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //标题
    self.title = @"签到";
    //背景颜色
    self.view.backgroundColor = Rgb(231, 220, 220);
    
    //连续签到时间
    [self initSignDayCount];
    
    [self initScrollView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [self initScrollView:NO];

}
#pragma mark - 初始化连续签到时间和记分
-(void)initSignDayCount
{
    currentDic = [Util getCurrentMonth];
//    NSArray *signArray = [[SignModel sharedInstance] getSignDateByMonth:[[currentDic objectForKey:@"month"] intValue] AndYear:[[currentDic objectForKey:@"year"] intValue] AndUser:1];
    
}
#pragma mark - 签到时间视图的相关操作
//初始化签到时间的滚动视图 isInit为YES初始化dataView  为NO时 修改frame
-(void)initScrollView:(int)isInit
{
    float sWidth = kWidth - 30;
    float sHeight = dateViewBg.frame.size.height;
    int scrollAnchor = - sWidth;
    CGRect frame ;
    NSArray *subViewArray = [dateScrollView subviews];
    
    //当前年月日
    
    int month = [[currentDic objectForKey:@"month"] intValue];
    int titleMonth;
    for (int i =0; i < month; i++) {
        scrollAnchor += sWidth;
        frame = CGRectMake(scrollAnchor, 0, sWidth, sHeight);
       
        //某个月的天数
        int daysInMonth = [Util howManyDaysInThisMonth:2015 month:i+1];
        titleMonth = i+1;
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:daysInMonth],@"daysInMonth",[NSNumber numberWithInt:titleMonth],@"titleMonth", nil];
        
        DateView *dateView;
        NSMutableArray *signArr = [[SignModel sharedInstance] getSignDateByMonth:titleMonth AndYear:[[currentDic objectForKey:@"year"] intValue] AndUser:1];
        if (isInit) {
            dateView = [[DateView alloc] initWithFrame:frame];
            dateView.delegate = self;
            dateView.currentDic = currentDic;
            [dateView loadSubView:dic];
            [dateView initMarkView:titleMonth SignDate:signArr];
            [dateScrollView addSubview:dateView];
        }else
        {
            if ([subViewArray count]>0) {
                dateView = [subViewArray objectAtIndex:i];
                [dateView initMarkView:titleMonth SignDate:signArr];
            }
            
       
        }
        
        dateView.frame = frame;
        
    }
    dateScrollView.contentSize = CGSizeMake(scrollAnchor+sWidth, sHeight);
    //显示当前月份
    CGPoint point = dateScrollView.contentOffset;
    point.x = scrollAnchor;
    dateScrollView.contentOffset = point;
    
}
#pragma mark - DateViewDelegate
-(void)clickedBackMonthBt:(int)titleMonth
{
    float sWidth = dateViewBg.frame.size.width;
    CGPoint point = dateScrollView.contentOffset;
    if (point.x == 0) {
        return;
    }
    point.x = point.x- sWidth;
    [dateScrollView setContentOffset:point animated:YES];
    
}

@end
