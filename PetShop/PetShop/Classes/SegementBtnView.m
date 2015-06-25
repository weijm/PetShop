//
//  SegementBtnView.m
//  PetShop
//
//  Created by long on 15-6-14.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SegementBtnView.h"

@implementation SegementBtnView

@synthesize defaultBtn;
@synthesize aptitudeBtn;
@synthesize creditBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        defaultBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWidth/3, 30)];
        [defaultBtn setTitle:@"默认排序" forState:UIControlStateNormal];
        [defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        defaultBtn.layer.borderColor = [[UIColor grayColor] CGColor];
        defaultBtn.layer.borderWidth = 1.0;
        defaultBtn.tag = 100;
        [defaultBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        //
        aptitudeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth/3, 0, kWidth/3, 30)];
        [aptitudeBtn setTitle:@"资质排序" forState:UIControlStateNormal];
        [aptitudeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        aptitudeBtn.layer.borderColor = [[UIColor grayColor] CGColor];
        aptitudeBtn.layer.borderWidth = 1.0;
        aptitudeBtn.tag = 101;
        [aptitudeBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        //
        creditBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth*2/3, 0, kWidth/3, 30)];
        [creditBtn setTitle:@"信誉排序" forState:UIControlStateNormal];
        [creditBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        creditBtn.layer.borderColor = [[UIColor grayColor] CGColor];
        creditBtn.layer.borderWidth = 1.0;
        creditBtn.tag = 102;
        [creditBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:defaultBtn];
        [self addSubview:aptitudeBtn];
        [self addSubview:creditBtn];
        
        //
        lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 29, kWidth/3, 1.0)];
        lineView.backgroundColor = [UIColor redColor];
        [self addSubview:lineView];
    }
    return self;
}
- (void)touchBtn:(UIButton*)sender{
    switch (sender.tag) {
        case 100:
        {
            CGRect frame = lineView.frame;
            frame.origin.x = 0;
            lineView.frame = frame;
            
        }
            break;
        case 101:
        {
            CGRect frame = lineView.frame;
            frame.origin.x = kWidth/3;
            lineView.frame = frame;
            
        }
            break;
        case 102:
        {
            CGRect frame = lineView.frame;
            frame.origin.x = kWidth*2/3;
            lineView.frame = frame;
            
        }
            break;
            
        default:
            break;
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(respondsToSelector:)]) {
        [self.delegate touchButton:sender];
    }
}
@end
