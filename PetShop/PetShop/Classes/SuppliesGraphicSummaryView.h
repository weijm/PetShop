//
//  SuppliesGraphicSummaryView.h
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuppliesGraphicSummaryView : UIView
{
    //物件的介绍标题内容
    IBOutlet UILabel *contentLab;
    //售价
    IBOutlet UILabel *priceLab;
    //已销售数量
    IBOutlet UILabel *soldCountLab;
    //显示的图片
    IBOutlet UIImageView *pictureView;
}
@property (nonatomic,copy) void(^colletedOrCancel)(NSString *string);
//收藏事件
- (IBAction)collectedAction:(id)sender;

@end
