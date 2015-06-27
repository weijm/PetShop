//
//  PetDoctorStarView.h
//  PetShop
//
//  Created by zx_06 on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//  星级视图

#import <UIKit/UIKit.h>

@interface PetDoctorStarView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *star_1;
@property (weak, nonatomic) IBOutlet UIImageView *star_2;
@property (weak, nonatomic) IBOutlet UIImageView *star_3;
@property (weak, nonatomic) IBOutlet UIImageView *star_4;
@property (weak, nonatomic) IBOutlet UIImageView *star_5;

- (void)loadHilightStars:(NSInteger)number;

@end
