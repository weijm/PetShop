//
//  MonoCommendTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonoCommendTableViewCell.h"
#import "CommendSuppView.h"

@implementation MonoCommendTableViewCell

- (void)awakeFromNib {
    // Initialization code
    titLab.backgroundColor = kNavigationBgColor;
    [self loadSubView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadSubView
{
    float viewW = kWidth/3;
    float viewH = [Util myYOrHeight:200]/2;
    for (int i = 0; i < 6; i++) {
        float offX = (i%3)*viewW;
        float offY = (i/3)*viewH;
        CGRect frame = CGRectMake(offX, offY, viewW, viewH);
        CommendSuppView *commendView = [[CommendSuppView alloc] initWithFrame:frame];
        commendView.tag = i;
        [commendView loadSubView];
        [bottomBg addSubview:commendView];
    }
    
}
@end
