//
//  ReadyBuyView.m
//  PetShop
//
//  Created by wjm on 15/6/25.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "ReadyBuyView.h"
#import "UIButton+Select.h"

@implementation ReadyBuyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"ReadyBuyView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
        [self initViewBorder];
    }
    return self;
}
#pragma mark - 各种点击事件
// 减少数量的触发事件
- (IBAction)reduceNumber:(id)sender {
    int number = [numberLab.text intValue];
        
    numberLab.text = [NSString stringWithFormat:@"%d",number -1];
    if ([numberLab.text intValue]>1) {
        reduceBt.enabled = YES;
    }else
    {
        reduceBt.enabled = NO;
    }
}
//增加数量的触发事件
- (IBAction)addNumber:(id)sender {
    int number = [numberLab.text intValue];
     numberLab.text = [NSString stringWithFormat:@"%d",number +1];
    if ([numberLab.text intValue]>=2) {
        reduceBt.enabled = YES;
    }
}
//确认触发事件
- (IBAction)makeSure:(id)sender {
    //检查是否选中尺寸
    NSString *string = @"";
    BOOL sizeHasSelected = [self revertSubView:1000 superview:sizeBg];
    if (!sizeHasSelected) {
        string = @"尺寸";
    }
    //检查是否选中颜色
    BOOL colorHasSelected = [self revertSubView:1000 superview:colorBg];
    if (!colorHasSelected) {
        string = [NSString stringWithFormat:@"%@ 颜色",string];
    }
    if (!sizeHasSelected || !colorHasSelected) {
        string = [NSString stringWithFormat:@"请选择 %@",string];
        self.addToCart(string);
        return;
    }
    
    if (_buyNow) {//立即购买
        if ([_delegate respondsToSelector:@selector(makeSureOrder)]) {
            [_delegate makeSureOrder];
        }
        
        
    }else
    {//加入购物车
        //关闭购物视图
        [_delegate closeView];
        //显示提示页面
        self.addToCart(@"商品已成功添加到购物车");
    }
}
//关闭该页面的触发事件
- (IBAction)closeView:(id)sender {
    if ([_delegate respondsToSelector:@selector(closeView)]) {
        [_delegate closeView];
    }
}
//选择尺寸的触发事件
- (IBAction)chooseSize:(id)sender {
    UIButton_Select *bt = (UIButton_Select *)sender;
    BOOL selected = bt.showColor;
    if (!selected) {
        [self setViewLayer:bt showBorder:NO];
        bt.showColor = YES;
    }else
    {
        [self setViewLayer:bt showBorder:YES];
        bt.showColor = NO;
    }
    //还原其他视图
    [self revertSubView:bt.tag superview:sizeBg];
}
//选择颜色的触发事件
- (IBAction)chooseColor:(id)sender {
    UIButton_Select *bt = (UIButton_Select *)sender;
    BOOL selected = bt.showColor;
    if (!selected) {
        [self setViewLayer:bt showBorder:NO];
        bt.showColor = YES;
    }else
    {
        [self setViewLayer:bt showBorder:YES];
        bt.showColor = NO;
    }
    //还原其他视图
    [self revertSubView:bt.tag superview:colorBg];
}
#pragma mark -绘制视图边框
//给相关视图添加边框
- (void)initViewBorder
{
    [self setViewLayer:pictureView showBorder:YES];
    for (UIView *view in [sizeBg subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            [self setViewLayer:view showBorder:YES];
        }
    }
    
    for (UIView *view in [colorBg subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            [self setViewLayer:view showBorder:YES];
        }
    }
}
//根据所给视图显示或隐藏边框 或改变背景颜色
- (void)setViewLayer:(UIView*)view showBorder:(BOOL)isShow
{
    if (isShow) {//显示边框
        view.layer.borderWidth = 1;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.84, 0.84, 0.84, 1 });
        [view.layer setBorderColor:colorref];//边框颜色
        if ([view isKindOfClass:[UIButton_Select class]]) {//尺寸 颜色按钮
            UIButton_Select *bt = (UIButton_Select *)view;
            [bt setTitleColor:Rgb(126, 127, 126) forState:UIControlStateNormal];//字体颜色灰色
            bt.backgroundColor = Rgb(255, 255, 255);//背景白色
        }
    }else
    {//不显示边框
        view.layer.borderWidth = 0;
        if ([view isKindOfClass:[UIButton_Select class]]) {
            UIButton_Select *bt = (UIButton_Select *)view;
            [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//字体颜色白色
            bt.backgroundColor = kNavigationBgColor;//背景和导航条一个颜色
        }
        
    }
    
    view.layer.cornerRadius = 2.0;//设置圆角
}
//还原尺寸或颜色按钮 除当前选中按钮以外 其他按钮的初始状态
- (BOOL)revertSubView:(NSInteger)index superview:(UIView*)superView
{
    BOOL hasSelected = NO;
    for (UIView *view in [superView subviews]) {
        if ([view isKindOfClass:[UIButton_Select class]]) {
            UIButton_Select *bt = (UIButton_Select *)view ;
            if (index == 1000) {//判断是否有选中的按钮
                if (bt.showColor) {
                    hasSelected = YES;
                }
                continue;
            }
            //还原尺寸或颜色按钮 除当前选中按钮以外 其他按钮的初始状态
            if (bt.tag!= index&&bt.showColor) {
                bt.showColor = NO;
                [self setViewLayer:bt showBorder:YES];
            }
        }
    }
    return hasSelected;
}
@end
