//
//  PetDoctorStarView.m
//  PetShop
//
//  Created by zx_06 on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetDoctorStarView.h"

@implementation PetDoctorStarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"PetDoctorStarView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}

- (void)loadHilightStars:(NSInteger)number{
    for (int i=1; i<=number; i++) {
//        UIView *containerView = [[[UINib nibWithNibName:@"PetDoctorStarView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
//        UIImageView *imgview = (UIImageView*)[containerView viewWithTag:i];
//        imgview.highlighted = YES;
//        imgview.image = [UIImage imageNamed:@"petBeauty_star"];
//        [imgview setImage:[UIImage imageNamed:@"petBeauty_star.png"]];
        
        switch (i) {
            case 1:
            {
                _star_1.highlighted = YES;
            }
                break;
            case 2:
                _star_2.highlighted = YES;
                break;
            case 3:
                _star_3.highlighted = YES;
                break;
            case 4:
                _star_4.highlighted = YES;
                break;
            case 5:
                _star_5.highlighted = YES;
                break;
            default:
                break;
        }
        
    }
}

@end
