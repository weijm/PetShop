//
//  OrderTableViewCell.m
//  PetShop
//
//  Created by wjm on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "OrderAddress.h"

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

- (IBAction)reduceNumber:(id)sender {
    int number = [numberLab.text intValue];
    _suppliesCount = number -1;
    numberLab.text = [NSString stringWithFormat:@"%d",_suppliesCount];
    if ([numberLab.text intValue]>1) {
        reducceBt.enabled = YES;
    }else
    {
        reducceBt.enabled = NO;
    }
    self.updateCell(self);

}

- (IBAction)addNumber:(id)sender {
    int number = [numberLab.text intValue];
    _suppliesCount = number +1;
    NSString *numberString = [NSString stringWithFormat:@"%d",_suppliesCount];
    numberLab.text = numberString;
    if ([numberLab.text intValue]>=2) {
        reducceBt.enabled = YES;
    }
    self.updateCell(self);

}

- (void)loadNumber:(int)number
{
    countLab.text = [NSString stringWithFormat:@"x%d",number];
    totalCountLab.text = [NSString stringWithFormat:@"共%d件商品 合计：",number];
    totalPriceLab.text = [NSString stringWithFormat:@"¥ %.2f",number*29.0];
    numberLab.text = [NSString stringWithFormat:@"%d",number];
    if (number>1) {
        reducceBt.enabled = YES;
    }
}

// 加载地址信息
-(void)loadAddressInfo:(NSMutableDictionary*)dic
{
    if (dic!=nil) {
        nameLab.text = [dic objectForKey:PERSONALNAME];
        phoneLab.text = [dic objectForKey:PHONE];
        addressLab.text = [NSString stringWithFormat:@"%@%@",[dic objectForKey:AREA],[dic objectForKey:ADDRESS]];
    }
   
}
@end
