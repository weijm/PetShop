//
//  PetSearchBar.m
//  PetShop
//
//  Created by zx_06 on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetSearchBar.h"

@implementation PetSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"PetSearchBar" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
        
    }
    return self;
}

- (IBAction)searchAction:(id)sender {
    [_searchTextField resignFirstResponder];
    
    //这里需要后期修改，根据数组里面的字典解析字段比较(ssl)
    NSLog(@"%i",[_dataArray count]);
    if (_searchTextField.text!=nil && [_searchTextField.text length]>0) {
        _showArray= [NSMutableArray array];
        for (NSString *tempStr in _dataArray) {
            if ([tempStr rangeOfString:_searchTextField.text options:NSCaseInsensitiveSearch].length >0 ) {
                [_showArray addObject:tempStr];
                NSLog(@"%d",[_showArray count]);
            }
        }
        [self backSearchResult:_showArray];
    }
    else
    {
        _showArray = [NSMutableArray arrayWithArray:_dataArray];
        [self backSearchResult:_showArray];
    }
}

- (void) searchDataByArray:(NSArray*)originalArray
{
 //
    _dataArray = [[NSArray alloc] initWithArray:originalArray];//存储所有数据数组
    
}
- (void)backSearchResult:(NSArray*)resultArray{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(reloadTableViewBySearchResult:)]) {
        [self.delegate reloadTableViewBySearchResult:resultArray];
    }
}
#pragma mark - UITextFeildDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

@end
