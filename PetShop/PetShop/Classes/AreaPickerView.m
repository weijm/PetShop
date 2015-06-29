//
//  AreaPickerView.m
//  PetShop
//
//  Created by wjm on 15/6/29.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "AreaPickerView.h"
@interface AreaPickerView()
{
    NSArray *provinces,*cities,*areas;
}
@end
@implementation AreaPickerView
-(Location*)locate
{
    if (_locate==nil) {
        _locate = [[Location alloc] init];
    }
    return _locate;
}

-(id)initWithFrame:(CGRect)frame withStyle:(AreaPickerStyle)pStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *containerView = [[[UINib nibWithNibName:@"AreaPickerView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
        
        self.pickerStyle = pStyle;
        //加载数据
        if (self.pickerStyle == AreaPickerWithStateAndCityAndDistrict) {
            provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"]];
            cities = [[provinces objectAtIndex:0] objectForKey:@"cities"];
            _locate.state = [[provinces objectAtIndex:0] objectForKey:@"state"];
            _locate.city = [[cities objectAtIndex:0] objectForKey:@"city"];
            
            areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
            if (areas.count>0) {
                _locate.district = [areas objectAtIndex:0];
            }else
            {
                _locate.district = @"";
           
            }
        }else
        {
            provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"]];
            cities = [[provinces objectAtIndex:0] objectForKey:@"cities"];
            _locate.state = [[provinces objectAtIndex:0] objectForKey:@"state"];
            _locate.city = [cities objectAtIndex:0];
            
       
        }
    }
    return self;
}
#pragma mark - PickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (_pickerStyle == AreaPickerWithStateAndCityAndDistrict) {
        return 3;
    }else
    {
        return 2;
    }
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [provinces count];
            break;
        case 1:
            return [cities count];
            
            break;
        case 2:
            if (_pickerStyle == AreaPickerWithStateAndCityAndDistrict) {
                return [areas count];
                break;
            }
        default:
            return 0;
            break;
    }
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (_pickerStyle == AreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
                return [[provinces objectAtIndex:row] objectForKey:@"state"];
                break;
            case 1:
                return [[cities objectAtIndex:row] objectForKey:@"city"];
                
                break;
            case 2:
                if ([areas count]>0) {
                    return [areas objectAtIndex:row];
                    break;
                }
                
            default:
                return @"";
                break;
        }
    }else
    {
        switch (component) {
            case 0:
                return [[provinces objectAtIndex:row] objectForKey:@"state"];
                break;
            case 1:
                return [cities objectAtIndex:row];
                break;
            default:
                return @"";
                break;
        }
   
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (_pickerStyle == AreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
                cities = [[provinces objectAtIndex:row] objectForKey:@"cities"];
                [_locationPicker selectRow:0 inComponent:1 animated:YES];
                [_locationPicker reloadComponent:1];
                
                areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
                [_locationPicker selectRow:0 inComponent:2 animated:YES];
                [_locationPicker reloadComponent:2];
                
                _locate.state = [[provinces objectAtIndex:row] objectForKey:@"state"];
                
                _locate.city = [[cities objectAtIndex:row] objectForKey:@"city"];
                if ([areas count]>0) {
                    _locate.district = [areas objectAtIndex:row];
                }else
                {
                    _locate.district = @"";
                }
                break;
            case 1:
                areas = [[cities objectAtIndex:row] objectForKey:@"areas"];
                [_locationPicker selectRow:0 inComponent:2 animated:YES];
                [_locationPicker reloadComponent:2];
                _locate.city = [[cities objectAtIndex:row]objectForKey:@"city"];
                if (areas.count>0) {
                    _locate.district = [areas objectAtIndex:0];
                }else
                {
                    _locate.district = @"";
               
                }
                
                break;
            case 2:
                if (areas.count>0) {
                    _locate.district = [areas objectAtIndex:row];
                }else
                {
                    _locate.district = @"";
               
                }
                break;
                
            default:
                break;
        }
    }else
    {
        switch (component) {
            case 0:
                cities = [[provinces objectAtIndex:row] objectForKey:@"cities"];
                [_locationPicker selectRow:0 inComponent:1 animated:YES];
                [_locationPicker reloadComponent:1];
                
                _locate.state = [[provinces objectAtIndex:row] objectForKey:@"state"];
                _locate.city = [cities objectAtIndex:0];
                break;
            case 1:
                _locate.city = [cities objectAtIndex:row];
                
                break;
                
            default:
                break;
        }
    }
    
    if ([_delegate respondsToSelector:@selector(pickerDidChangeStatus:)]) {
        [_delegate pickerDidChangeStatus:self];
    }
}
#pragma mark - animation
-(void)showInView:(UIView *)view
{
    self.frame = CGRectMake(0, view.frame.size.height, self.frame.size.width, self.frame.size.height);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = view.frame.size.height-self.frame.size.height;
        self.frame = frame;
            }];
}
-(void)cancelPicker
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = frame.origin.y+frame.size.height;
        self.frame = frame;
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}
@end
