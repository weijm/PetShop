//
//  InfoTableViewCell.m
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadContent:(int)commentCount
{
    NSInteger viewTag = self.tag;
    switch (viewTag) {
        case 1:
            titleLab.text = @"商品详情";
            break;
        case 2:
            titleLab.text = @"商品参数";
            break;
        case 3:
            titleLab.text = [NSString stringWithFormat:@"用户评价（%d）",commentCount];
            break;
        default:
            break;
    }
    iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"homepage_suppinfo_icon%ld",(long)viewTag]];
}
@end
