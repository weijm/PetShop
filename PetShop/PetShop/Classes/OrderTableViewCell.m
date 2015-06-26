//
//  OrderTableViewCell.m
//  PetShop
//
//  Created by wjm on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self setViewLayer:pictureView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setViewLayer:(UIView*)view
{
    view.layer.borderWidth = 1;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.84, 0.84, 0.84, 1 });
    [view.layer setBorderColor:colorref];//边框颜色
}

@end
