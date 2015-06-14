//
//  SegementBtnView.h
//  PetShop
//
//  Created by long on 15-6-14.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SegementBtnViewDelegate<NSObject>

- (void)touchButton:(UIButton*)sender;

@end

@interface SegementBtnView : UIView
{
    UIView *lineView;
}

@property (nonatomic,retain)id<SegementBtnViewDelegate>delegate;
@property (nonatomic,retain)UIButton *defaultBtn; //默认排序
@property (nonatomic,retain)UIButton *aptitudeBtn;//资质排序
@property (nonatomic,retain)UIButton *creditBtn;  //信誉排序
    

@end
