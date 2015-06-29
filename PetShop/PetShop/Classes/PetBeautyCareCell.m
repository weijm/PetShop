//
//  PetBeautyCareCell.m
//  PetShop
//
//  Created by zx_06 on 15/6/25.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetBeautyCareCell.h"
#import "PetDoctorStarView.h"
@implementation PetBeautyCareCell

- (id)initWithFrame:(CGRect)frame  andDictionary:(NSDictionary*)dictionary{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //头像
        _portrialImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 70, 70)];
        _portrialImageView.image = [UIImage imageNamed:@"petBeauty_porImage"];
        [self addSubview:_portrialImageView];
        //名字
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 70, 30)];
        _nameLabel.text = @"田多美";
        _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        [self addSubview:_nameLabel];
        //级别
        _levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 17, 70, 20)];
        _levelLabel.text = @"高级美容师";
        _levelLabel.textColor = [UIColor lightGrayColor];
        _levelLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_levelLabel];
        //美容院
        _beautyCareLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 120, 15)];
        _beautyCareLabel.text = @"北京多美宠物美容";
        _beautyCareLabel.textColor = [UIColor whiteColor];
        _beautyCareLabel.backgroundColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
        _beautyCareLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_beautyCareLabel];
        
        //认证
        _authentitationLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 120, 15)];
        _authentitationLabel.text = @"CKU资格认证";
        _authentitationLabel.textColor = [UIColor whiteColor];
        _authentitationLabel.backgroundColor = [UIColor colorWithRed:228/255.0 green:37/255.0 blue:101/255.0 alpha:1.0];
        _authentitationLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_authentitationLabel];
        
        _phoneNumber = @"10086";
        
        //call
        _phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-60, (self.frame.size.height-40)/2, 40, 40)];
        [_phoneButton setBackgroundImage:[UIImage imageNamed:@"petBeauty_phone_order"] forState:UIControlStateNormal];
        [_phoneButton addTarget:self action:@selector(callBeautyCare:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_phoneButton];
        
        //星级
        _starNumber = 3;
        PetDoctorStarView *starView = [[PetDoctorStarView alloc]initWithFrame:CGRectMake(95, 37, 85, 12)];
        [starView loadHilightStars:_starNumber];
        starView.backgroundColor = [UIColor whiteColor];
        [self addSubview:starView];
    }
    return self;
}
- (void)callBeautyCare:(UIButton*)sender{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(CallPetbeautyCarePhoneNumber:)]) {
        [self.delegate CallPetbeautyCarePhoneNumber:_phoneNumber];
    }
}
@end
