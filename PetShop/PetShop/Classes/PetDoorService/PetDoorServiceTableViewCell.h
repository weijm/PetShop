//
//  PetDoorServiceTableViewCell.h
//  PetShop
//
//  Created by zx_06 on 15/7/1.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PetDoorServiceTableViewCellDelegate <NSObject>

- (void)CallTheDoorService:(NSString*)phoneNumber;

@end


@interface PetDoorServiceTableViewCell : UITableViewCell

@property (nonatomic)id<PetDoorServiceTableViewCellDelegate>delegate;
@property (nonatomic,retain)UIImageView *petDoorServicePortrial;
@property (nonatomic,retain) UILabel     *nameLabel;           //名字
@property (nonatomic,retain) UILabel     *levelLabel;          //级别
@property (nonatomic,retain) UILabel     *hospitalLabel;       //医院
@property (nonatomic,retain) UILabel     *diagnosisLabel;      //诊断和鲜花

@property (nonatomic,retain) UIButton    *phoneButton;         //呼叫
@property (nonatomic) NSInteger    starNumber;                 //星级
@property (nonatomic,retain) NSString    *phoneNumber;         //号码
@property (nonatomic,retain) NSString     *flowerNumber;       //鲜花数量
@property (nonatomic,retain) NSString     *diagnosisNumber;    //诊断数量
@property (nonatomic,retain) UILabel      *introductionLabel;       //个人简介
@property (nonatomic,retain) UITextView   *doorServiceDetial;  //简介

- (void)loadDoorServiceTableViewcell:(NSDictionary*)cellDictionary;
@end
