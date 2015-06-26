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
@end

@interface ReadyBuyView : UIView
{
    
    IBOutlet UIView *sizeBg;
    IBOutlet UIView *colorBg;
    
    IBOutlet UIImageView *pictureView;
    IBOutlet UILabel *priceLab;
    IBOutlet UILabel *inventoryLab;
    IBOutlet UIButton *reduceBt;
    IBOutlet UILabel *numberLab;
    IBOutlet UIButton *sureBt;
}
@property (nonatomic,weak) id<ReadyBuyViewDelegate> delegate;
- (IBAction)reduceNumber:(id)sender;
- (IBAction)addNumber:(id)sender;
- (IBAction)makeSure:(id)sender;
- (IBAction)closeView:(id)sender;
- (IBAction)chooseSize:(id)sender;
- (IBAction)chooseColor:(id)sender;

@end
