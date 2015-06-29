//
//  PetHospitalCell.h
//  PetShop
//
//  Created by zx_06 on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PetHospitalCellDelegate <NSObject>

- (void)CallPetHospitalPhoneNumber:(NSString*)phoneNumber;

@end

@interface PetHospitalCell : UIView

@property (nonatomic)id<PetHospitalCellDelegate>delegate;
@property (nonatomic,retain) UIImageView *portrialImageView;   //头像
@property (nonatomic,retain) UILabel     *nameLabel;           //名字
@property (nonatomic,retain) UILabel     *levelLabel;          //级别
@property (nonatomic,retain) UILabel     *hospitalLabel;       //医院
@property (nonatomic,retain) UILabel     *diagnosisLabel;      //诊断和鲜花

@property (nonatomic,retain) UIButton    *phoneButton;         //呼叫
@property (nonatomic) NSInteger    starNumber;                 //星级
@property (nonatomic,retain) NSString    *phoneNumber;         //号码
@property (nonatomic,retain) NSString     *flowerNumber;       //鲜花数量
@property (nonatomic,retain) NSString     *diagnosisNumber;    //诊断数量
- (id)initWithFrame:(CGRect)frame  andDictionary:(NSDictionary*)dictionary;

@end
