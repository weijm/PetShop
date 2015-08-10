//
//  DoorServerTableViewCell.h
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DoorServerTableViewCellDelegate <NSObject>

- (void)CallPetHospitalPhoneNumber:(NSString*)phoneNumber;

@end
@interface DoorServerTableViewCell : UITableViewCell
@property (nonatomic)id<DoorServerTableViewCellDelegate>delegate;
@property (nonatomic,retain) UIImageView *portrialImageView;   //头像
@property (nonatomic,retain) UILabel     *nameLabel;           //名字
@property (nonatomic,retain) UILabel     *levelLabel;          //级别
@property (nonatomic,retain) UILabel     *hospitalLabel;       //医院
@property (nonatomic,retain) UILabel     *diagnosisLabel;      //诊断和鲜花

@property (nonatomic,retain) UIButton    *phoneButton;         //呼叫
@property (nonatomic) NSInteger    starNumber;          //星级
@property (nonatomic,retain) NSString    *phoneNumber;         //号码
@property (nonatomic,retain) NSString     *flowerNumber;       //鲜花数量
@property (nonatomic,retain) NSString     *diagnosisNumber;    //诊断数量
@property (nonatomic,strong) UITextView *personalTextView;
@end
