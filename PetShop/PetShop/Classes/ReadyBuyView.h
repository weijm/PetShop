//
//  ReadyBuyView.h
//  PetShop
//
//  Created by wjm on 15/6/25.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ReadyBuyViewDelegate <NSObject>
@optional
//关闭该视图
-(void)closeView;
//立即购买的确认的触发事件
-(void)makeSureOrder;
@end

@interface ReadyBuyView : UIView
{
    //尺寸按钮的的父视图
    IBOutlet UIView *sizeBg;
    //颜色按钮的父视图
    IBOutlet UIView *colorBg;
    //小图片视图
    IBOutlet UIImageView *pictureView;
    //售价
    IBOutlet UILabel *priceLab;
    //库存
    IBOutlet UILabel *inventoryLab;
    //减少数量
    IBOutlet UIButton *reduceBt;
    //显示数量
    IBOutlet UILabel *numberLab;
    //确认
    IBOutlet UIButton *sureBt;
}
@property (nonatomic,weak) id<ReadyBuyViewDelegate> delegate;
@property (nonatomic) BOOL buyNow;//是否立即购买

@property (nonatomic,copy) void(^addToCart)(NSString *string);
/**
 减少数量的触发事件
 */
- (IBAction)reduceNumber:(id)sender;
/**
 增加数量的触发事件
 */
- (IBAction)addNumber:(id)sender;
/**
 确认触发事件
 */
- (IBAction)makeSure:(id)sender;
/**
 关闭该页面的触发事件
 */
- (IBAction)closeView:(id)sender;
/**
 选择尺寸的触发事件
 */
- (IBAction)chooseSize:(id)sender;
/**
 选择颜色的触发事件
 */
- (IBAction)chooseColor:(id)sender;

@end
