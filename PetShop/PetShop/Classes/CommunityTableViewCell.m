//
//  CommunityTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/8/9.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CommunityTableViewCell.h"

@implementation CommunityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadSubView
{
    float imgW = (kWidth - 60 -10)/2;
    float imgH = 90;
    float imgY = contentLab.frame.origin.y+contentLab.frame.size.height;
    for (int i =0; i < 2; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30+i*imgW+10*i, imgY, imgW, imgH)];
        imgView.image = [UIImage imageNamed:@"community_default"];
        imgView.tag = i;
        [self addSubview:imgView];
    }
}
@end
