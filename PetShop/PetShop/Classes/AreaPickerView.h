//
//  AreaPickerView.h
//  PetShop
//
//  Created by wjm on 15/6/29.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

typedef enum {
    AreaPickerWithStateAndCity,
    AreaPickerWithStateAndCityAndDistrict
}AreaPickerStyle;

@class AreaPickerView;
@protocol AreaPickerViewDelegate <NSObject>

@optional
-(void)pickerDidChangeStatus:(AreaPickerView*)picker;

@end

@interface AreaPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak,nonatomic) id<AreaPickerViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *locationPicker;
@property (strong,nonatomic) Location *locate;
@property (nonatomic) AreaPickerStyle pickerStyle;

-(id)initWithFrame:(CGRect)frame withStyle:(AreaPickerStyle)pStyle;

-(void)showInView:(UIView*)view;

-(void)cancelPicker;


@end
