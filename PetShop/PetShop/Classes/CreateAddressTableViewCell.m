//
//  CreateAddressTableViewCell.m
//  PetShop
//
//  Created by wjm on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CreateAddressTableViewCell.h"

@implementation CreateAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
    contentTextFiled.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKey)];
    [self addGestureRecognizer:tap];
    [contentTextFiled resignFirstResponder];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadsubView:(NSMutableDictionary*)dictionary
{
    NSInteger tag = self.tag;
    switch (tag) {
        case 0:
            titleLab.text = @"收货人：";
            contentTextFiled.text = [dictionary objectForKey:@"personalName"];
            break;
        case 1:
            titleLab.text = @"联系方式：";
            contentTextFiled.keyboardType = UIKeyboardTypeNumberPad;
            contentTextFiled.text = [dictionary objectForKey:@"phone"];
            break;
        case 2:
        {
            titleLab.text = @"所在地区：";
            arrowView.hidden =NO;
            //textField 不可点击
            contentTextFiled.enabled = NO;
            contentTextFiled.text = [dictionary objectForKey:@"area"];
            
            UIButton *bt = [[UIButton alloc] initWithFrame:self.contentView.frame];
            [bt addTarget:self action:@selector(areaPicker) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:bt];
        }
            break;
        case 3:
            titleLab.text = @"详细地址：";
            contentTextFiled.text = [dictionary objectForKey:@"address"];
            break;
        case 4:
            titleLab.hidden = YES;
            contentTextFiled.hidden = YES;
            arrowView.hidden = YES;
            defaultBg.hidden = NO;
            openSwitch.hidden = NO;
            openSwitch.on = [[dictionary objectForKey:@"isDeault"] intValue];
            break;
        default:
            break;
    }
}

- (IBAction)setDefault:(id)sender {
    UISwitch *oSwitch = (UISwitch*)sender;
    NSString *openString = [NSString stringWithFormat:@"%d",oSwitch.on];
    self.finishedThisCell(openString,self.tag);
}
#pragma mark - UITextFieldDelegate

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length]!=0) {
        self.finishedThisCell(textField.text,self.tag);
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [contentTextFiled resignFirstResponder];
    return YES;
}
#pragma mark -选择地区
-(void)areaPicker
{
    if ([_delegate respondsToSelector:@selector(chooseAddressInfo)]) {
        [_delegate chooseAddressInfo];
    }
}
#pragma mark - 取消键盘
-(void)removeKey
{
    [contentTextFiled resignFirstResponder];
}
@end
