//
//  HomePageButtonView.m
//  PetShop
//
//  Created by weijuanmin on 15-6-12.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "HomePageButtonView.h"

@implementation HomePageButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (IBAction)clickedBt:(id)sender {
    UIButton *bt = (UIButton*)sender;
    NSInteger index = bt.tag;
    [_delegate clickedBtAction:index];
}
@end
