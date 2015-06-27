//
//  CreateAddressTableViewCell.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CreateAddressTableViewCell.h"

@implementation CreateAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadsubView
{
    NSInteger tag = self.tag;
    switch (tag) {
        case 0:
            titleLab.text = @"收货人：";
            break;
        case 1:
            titleLab.text = @"联系方式：";
            break;
        case 2:
            titleLab.text = @"所在地区：";
            break;
        case 3:
            titleLab.text = @"详细地址：";
            break;
        case 4:
            break;
        default:
            break;
    }
}
@end
