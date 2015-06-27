//
//  PetBeautyCareCell.h
//  PetShop
//
//  Created by zx_06 on 15/6/25.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PetBeautyCareCellDelegate <NSObject>

- (void)CallPetbeautyCarePhoneNumber:(NSString*)phoneNumber;

@end

@interface PetBeautyCareCell : UIView

@property (nonatomic)id<PetBeautyCareCellDelegate>delegate;
@property (nonatomic,retain) UIImageView *portrialImageView;   //头像
@property (nonatomic,retain) UILabel     *nameLabel;           //名字
@property (nonatomic,retain) UILabel     *levelLabel;          //级别
@property (nonatomic,retain) UILabel     *beautyCareLabel;     //美容院
@property (nonatomic,retain) UILabel     *authentitationLabel; //认证
@property (nonatomic,retain) UIButton    *phoneButton;         //呼叫

@property (nonatomic,retain) NSString    *phoneNumber;         //号码
@property (nonatomic)NSInteger starNumber;                    //星星个数
- (id)initWithFrame:(CGRect)frame  andDictionary:(NSDictionary*)dictionary;

@end
