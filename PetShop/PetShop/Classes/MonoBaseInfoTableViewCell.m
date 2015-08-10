//
//  MonoBaseInfoTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonoBaseInfoTableViewCell.h"

@implementation MonoBaseInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadSubView:(NSString*)contentString
{
    NSInteger index = self.tag;
    switch (index) {
        case 2:
        {
            iconWidth.constant = 12;
            iconHeight.constant = 16;
            iconImg.image = [UIImage imageNamed:@"homepage_mono_location"];
            contentLab.text = @"多伦多路888号";
            contentLab.textColor = [UIColor darkGrayColor];
        }
            break;
        case 3:
        {
            iconWidth.constant = 12;
            iconHeight.constant = 16;
            iconImg.image = [UIImage imageNamed:@"homepage_mono_phone"];
            contentLab.text = @"1666999222";
            contentLab.textColor = [UIColor darkGrayColor];
        }
            break;
        case 5:
        {
            iconWidth.constant = 29;
            iconHeight.constant = 29;
            iconImg.image = [UIImage imageNamed:@"homepage_mono_dog"];
            contentLab.text = @"狗狗用品";
            contentLab.textColor = [UIColor colorWithRed:173.0/255.0 green:0.0/255.0 blue:90.0/255.0 alpha:0.8];
        }
            break;
        case 6:
        {
            iconWidth.constant = 29;
            iconHeight.constant = 29;
            iconImg.image = [UIImage imageNamed:@"homepage_mono_cat"];
            contentLab.text = @"猫猫用品";
            contentLab.textColor = [UIColor colorWithRed:173.0/255.0 green:0.0/255.0 blue:90.0/255.0 alpha:0.8];
                   }
            break;
        case 10:
        {
            iconWidth.constant = 16;
            iconHeight.constant = 15.5;
            iconImg.image = [UIImage imageNamed:@"homepage_mono_comment"];
            contentLab.text = @"用户点评（1000）";
            contentLab.textColor = [UIColor darkGrayColor];

        }
            break;
            
            
        default:
            break;
    }
}
@end
