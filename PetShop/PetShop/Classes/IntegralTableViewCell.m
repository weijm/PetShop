//
//  IntegralTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/8/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "IntegralTableViewCell.h"
#import "IntegralSingleView.h"

@implementation IntegralTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadSubView:(NSArray*)array
{
    NSInteger count = array.count;
    
    float edgeLeft = [Util myXOrWidth:20];
    float viewW = (kWidth-edgeLeft*3)/2;
    for (int i = 0; i < count; i++) {
        float viewX = (i%2+1)*edgeLeft+viewW*(i%2);
        IntegralSingleView *integralV = [[IntegralSingleView alloc] initWithFrame:CGRectMake(viewX, 0, viewW, 190)];
        [self addSubview:integralV];
    }
}
@end
