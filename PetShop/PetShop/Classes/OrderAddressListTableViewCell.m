//
//  OrderAddressListTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/7/18.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderAddressListTableViewCell.h"
#import "OrderAddress.h"

@implementation OrderAddressListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//加载cell上的数据
-(void)loadCellData:(NSDictionary*)orderAddressDic
{
    NSString *phone = [orderAddressDic objectForKey:PHONE];
    NSString *number = [NSString stringWithFormat:@"%@***%@",[phone substringToIndex:(([phone length]>10)?3:1)],[phone substringFromIndex:[phone length]-2]];
    nameAndPhoneLab.text = [NSString stringWithFormat:@"%@      %@",[orderAddressDic objectForKey:PERSONALNAME],number];
    addressLab.text = [NSString stringWithFormat:@"%@%@",[orderAddressDic objectForKey:AREA],[orderAddressDic objectForKey:ADDRESS]];
}
- (IBAction)editSeleted:(id)sender {
    self.editAddress((int)self.tag);
}
-(void)tap
{
    if (isSelected) {
        markBg.hidden = YES;
        infoBgToLeft.constant = 20;
        isSelected = NO;
        self.selectedAddress((int)self.tag,isSelected);
        return;
    }else
    {
        markBg.hidden = NO;
        infoBgToLeft.constant = 50;
        isSelected = YES;
        self.selectedAddress((int)self.tag,isSelected);
    }
    
}
-(void)revertView
{
    markBg.hidden = YES;
    infoBgToLeft.constant = 20;
    isSelected = NO;
}
@end
