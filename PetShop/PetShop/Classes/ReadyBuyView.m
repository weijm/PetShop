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
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
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

- (IBAction)addNumber:(id)sender {
    int number = [numberLab.text intValue];
     numberLab.text = [NSString stringWithFormat:@"%d",number +1];
    if ([numberLab.text intValue]>=2) {
        reduceBt.enabled = YES;
    }
}

- (IBAction)makeSure:(id)sender {
}

- (IBAction)closeView:(id)sender {
    if ([_delegate respondsToSelector:@selector(closeView)]) {
        [_delegate closeView];
    }
}

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
- (void)setViewLayer:(UIView*)view showBorder:(BOOL)isShow
{
    if (isShow) {
        view.layer.borderWidth = 1;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.84, 0.84, 0.84, 1 });
        [view.layer setBorderColor:colorref];//边框颜色
        if ([view isKindOfClass:[UIButton_Select class]]) {
            UIButton_Select *bt = (UIButton_Select *)view;
            [bt setTitleColor:Rgb(126, 127, 126) forState:UIControlStateNormal];
            bt.backgroundColor = Rgb(255, 255, 255);
        }
    }else
    {
        view.layer.borderWidth = 0;
        if ([view isKindOfClass:[UIButton_Select class]]) {
            UIButton_Select *bt = (UIButton_Select *)view;
            [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            bt.backgroundColor = kNavigationBgColor;
        }
        
    }
    
    view.layer.cornerRadius = 2.0;
}
- (void)revertSubView:(NSInteger)index superview:(UIView*)superView
{
    for (UIView *view in [superView subviews]) {
        if ([view isKindOfClass:[UIButton_Select class]]) {
            UIButton_Select *bt = (UIButton_Select *)view ;
            if (bt.tag!= index&&bt.showColor) {
                bt.showColor = NO;
                [self setViewLayer:bt showBorder:YES];
            }
        }
    }
}
@end
