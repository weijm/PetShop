//
//  DoorServerTableViewCell.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "DoorServerTableViewCell.h"
#import "PetDoctorStarView.h"

@implementation DoorServerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
-(void)initSubView
{
    self.backgroundColor = [UIColor whiteColor];
    //头像
    _portrialImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 70, 70)];
    _portrialImageView.image = [UIImage imageNamed:@"pet_hospital_portrial"];
    [self addSubview:_portrialImageView];
    //名字
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 70, 30)];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.text = @"李华生";
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [self addSubview:_nameLabel];
    //级别
    _levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 17, 70, 20)];
    _levelLabel.backgroundColor = [UIColor clearColor];
    _levelLabel.text = @"主治医生";
    _levelLabel.textColor = [UIColor lightGrayColor];
    _levelLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_levelLabel];
    
    //诊断和鲜花
    _diagnosisNumber = @"221";
    _flowerNumber = @"542";
    NSInteger length1 = [_diagnosisNumber length];
    NSInteger length2 = [_diagnosisNumber length];
    NSString *labelString = [NSString stringWithFormat:@"诊断%@例／鲜花%@朵",_diagnosisNumber,_flowerNumber];
    NSMutableAttributedString *labelString2 = [[NSMutableAttributedString alloc] initWithString:labelString];
    if (length1>0) {
        [labelString2 addAttribute: NSForegroundColorAttributeName value: [UIColor colorWithRed:224/255.0 green:34/255.0 blue:152/255.0 alpha:1.0] range: NSMakeRange(2, length1)];
    }
    if (length2>0) {
        [labelString2 addAttribute: NSForegroundColorAttributeName value: [UIColor colorWithRed:224/255.0 green:34/255.0 blue:152/255.0 alpha:1.0] range: NSMakeRange([labelString2 length]-length2-1, length2)];
    }
    _diagnosisLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 160, 15)];
    _diagnosisLabel.backgroundColor = [UIColor clearColor];
    _diagnosisLabel.attributedText = labelString2;
    
    _diagnosisLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_diagnosisLabel];
    
    
    //医院
    NSString *hosStrig = @"内科，北京第一宠物医院";
    NSDictionary *dicHos = @{NSBackgroundColorAttributeName:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]};
    
    _hospitalLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 160, 15)];
    _hospitalLabel.backgroundColor = [UIColor clearColor];
    _hospitalLabel.attributedText = [[NSAttributedString alloc] initWithString:hosStrig attributes:dicHos];
    _hospitalLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_hospitalLabel];
    
    
    _phoneNumber = @"10086";
    
    //call
    _phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-60, 24, 39, 38)];
    [_phoneButton setBackgroundImage:[UIImage imageNamed:@"homepage_monopoly_phonebt"] forState:UIControlStateNormal];
    [_phoneButton addTarget:self action:@selector(callBeautyCare:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_phoneButton];
    
    //星级
    _starNumber = 3;
    PetDoctorStarView *starView = [[PetDoctorStarView alloc]initWithFrame:CGRectMake(95, 57, 85, 12)];
    [starView loadHilightStars:_starNumber];
    starView.backgroundColor = [UIColor clearColor];
    [self addSubview:starView];
    
    //分割线
    float offY = _portrialImageView.frame.origin.y+_portrialImageView.frame.size.height + [Util myYOrHeight:13];
    float offX = _portrialImageView.frame.origin.x;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(offX, offY, kWidth-offX*2, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    //个人简介标题
    offY = offY + [Util myYOrHeight:8];
    UILabel *personalTitLab = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY, kWidth-offX*2, 15)];
    personalTitLab.backgroundColor = [UIColor clearColor];
    personalTitLab.text = @"个人简介";
    personalTitLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:personalTitLab];
    
    //个人简介
    offY = offY + personalTitLab.frame.size.height-3;
    
    _personalTextView = [[UITextView alloc] initWithFrame:CGRectMake(offX-2, offY, kWidth-offX*2, [Util myYOrHeight:70])];
    _personalTextView.userInteractionEnabled = NO;
    _personalTextView.text = @"还记得电影007中的那种便携式喷气背包吗？喷气背包中国首飞即将来临，能让你像007一样遨游天际。7月11日，百度新闻与极客公园联合主办的“The BIG Talk·新飞行时代”峰会，见证喷气背包中国首飞！除了喷气背包中国首飞，还有无人机等全球最前沿的飞行科技，让飞行不再是梦想。";
    _personalTextView.font = [UIFont systemFontOfSize:12];
    _personalTextView.textColor = [UIColor lightGrayColor];
    _personalTextView.backgroundColor = [UIColor clearColor];
    [self setTextViewParagraphStyle];
    [self addSubview:_personalTextView];
    
}


- (void)callBeautyCare:(UIButton*)sender{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(CallPetHospitalPhoneNumber:)]) {
        [self.delegate CallPetHospitalPhoneNumber:_phoneNumber];
    }
}
-(void)setTextViewParagraphStyle
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    float lineSpace = 4;
    float fontSize = 12;
    if (kIphone4||kIphone5) {
        lineSpace = 3;
        fontSize = 11;
    }
     paragraphStyle.lineSpacing = lineSpace;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:
                                     [UIColor grayColor]
                                 };
    _personalTextView.attributedText = [[NSAttributedString alloc] initWithString:_personalTextView.text attributes:attributes];
}

@end
