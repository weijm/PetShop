//
//  DateView.m
//  PetShop
//
//  Created by wjm on 15/6/15.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "DateView.h"
#import "SignModel.h"

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
                    UIButton *numberBt = (UIButton*)number;
                    int numberTag = numberBt.tag;//最后一行的最后一个按钮的tag为0  这个按钮是确定位置的
                    if (numberTag == 0) {
                        return;
                    }
                    //标记已经签到的日期
                    NSNumber *numberInArray = [signArray objectAtIndex:numberTag-1];
                    if ([numberInArray intValue]==0) {//某个月没有签到日期时
                        [self setButton:numberBt isSelected:NO];
                    }else
                    {//某个月签到的日期 置为不可点击
                        [self setButton:numberBt isSelected:YES];
                        
                    }
                   
                    
                    if (curMonth == titMonth && numberTag == curDay) {
                        //添加当天标记 并可点击
                        CGRect frame = number.frame;
                        //防止多次添加
                        UIImageView *tempMark = (UIImageView *)[lineView viewWithTag:100];
                        BOOL isFirstShow = YES;
                        if (tempMark) {
                            [tempMark removeFromSuperview];
                            isFirstShow = NO;
                        }
                        UIImageView *markView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.size.height+3, 30, 10)];
                        markView.backgroundColor = [UIColor greenColor];
                        markView.hidden = isFirstShow;
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
    
    //改变按钮的背景和字体
    [self setButton:numberBt isSelected:YES];
    
    //插入数据库
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:_currentDic];
    [dic setObject:@"1" forKey:@"userId"];
    [[SignModel sharedInstance] updateSign:dic];

}

- (IBAction)clickedLastMonthBtAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(clickedBackMonthBt:)]) {
        int titleMonth = [titleLab.text intValue];
        [_delegate clickedBackMonthBt:titleMonth];
    }
}
#pragma mark - 设置按钮的形状及颜色
- (void)setButton:(UIButton*)button isSelected:(BOOL)isSelected
{
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:15.0]; //设置矩形四个圆角半径
    [button.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.69, 0, 0.31, 1 });
    [button.layer setBorderColor:colorref];//边框颜色
    if (isSelected) {
        button.backgroundColor = Rgb(176, 0, 80);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.enabled = NO;
    }
}
@end
