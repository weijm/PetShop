//
//  DateView.m
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "DateView.h"

@implementation DateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"DateView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}


//初始化每个月的视图
-(void)loadSubView:(NSDictionary*)dictionary
{
    int titleMonth = [[dictionary objectForKey:@"titleMonth"] intValue];
    int days = [[dictionary objectForKey:@"daysInMonth"] intValue];
    
    titleLab.text = [NSString stringWithFormat:@"%d月",titleMonth];

    //显示每个月的天数
    int remainder = days%7;
    if (remainder == 0) {//2月份直接 隐藏最后一行
        lineBg5.hidden = YES;
    }else
    {
        NSArray *subArray = [lineBg5 subviews];
        for (int i =0; i < [subArray count]; i++) {
            if (i+1 >remainder) {
                UIView *tempView = [subArray objectAtIndex:i];
                tempView.hidden = YES;
            }
        }
    }
}
// 添加当天的标记视图
-(void)initMarkView:(int)titMonth SignDate:(NSArray*)signArray
{
    //标记当前日期位置
    int curMonth = [[_currentDic objectForKey:@"month"] intValue];
    int curDay = [[_currentDic objectForKey:@"day"] intValue];
    NSArray *arry = [dateViewBg subviews];
    for (int i=0; i<[arry count]; i++) {
        UIView *lineView = [arry objectAtIndex:i];
        int lineTag = lineView.tag;
        if (lineTag >0 && lineTag<=5) {//tag大于0，小于等于5的view是数字按钮视图
            for (UIView *number in [lineView subviews]) {
                if ([number isKindOfClass:[UIButton class]]) {
                    int numberTag = number.tag;
                    //标记已经签到的日期
                    if (signArray.count>0) {
                        if (numberTag == [[signArray objectAtIndex:numberTag-1]intValue]) {
                            number.backgroundColor = [UIColor redColor];
                        }
                    }
                    
                    if (curMonth == titMonth && numberTag == curDay) {
                        //添加当天标记 并可点击
                        CGRect frame = number.frame;
                        //防止多次添加
                        UIImageView *tempMark = (UIImageView *)[lineView viewWithTag:100];
                        if (tempMark) {
                            [tempMark removeFromSuperview];
                        }
                        UIImageView *markView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.size.height+3, 30, 10)];
                        markView.backgroundColor = [UIColor greenColor];
                        markView.tag = 100;
                        [lineView addSubview:markView];
                    }else
                    {//不是当天的不可以点击
                        number.userInteractionEnabled = NO;
                    }
                    
                }
            }
        }
    }
}
- (IBAction)clickNumber:(id)sender {
    UIButton *numberBt = (UIButton*)sender;
    NSLog(@"clickNumber== %d",numberBt.tag);
}

@end
