//
//  OrderTableViewCell.h
//  PetShop
//
//  Created by wjm on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell
{
    /**第一行 地址信息*/
    //姓名
    
    IBOutlet UILabel *nameLab;
    //电话
    
    IBOutlet UILabel *phoneLab;
    //地址
    
    IBOutlet UILabel *addressLab;
    /**第二行的cell上的内容*/
    //商品缩略图
    IBOutlet UIImageView *pictureView;
    //商店名称
    IBOutlet UILabel *shopLab;
    //商品介绍lab
    IBOutlet UILabel *contentLab;
    //单价显示lab
    IBOutlet UILabel *priceLab;
    //价格价格下面的数量
    IBOutlet UILabel *countLab;
    
    /**第三行的cell的内容*/
    //减量按钮
    IBOutlet UIButton *reducceBt;
    //增减之间的数量显示lab
    IBOutlet UILabel *numberLab;
    
    /** 第5行的cell内容*/
    //商品总数的显示lab
    IBOutlet UILabel *totalCountLab;
    //购买商品总价
    IBOutlet UILabel *totalPriceLab;
}
@property (nonatomic,readonly) int suppliesCount;
@property (nonatomic,readonly) float price;


@property (nonatomic,copy) void(^updateCell)(OrderTableViewCell *cell);
/**
 减少商品数量
 */
- (IBAction)reduceNumber:(id)sender;
/**
 增加商品数量
 */
- (IBAction)addNumber:(id)sender;
/**
 重新加载部分子视图
 */
- (void)loadNumber:(int)number;

/**
 加载地址信息
 */
-(void)loadAddressInfo:(NSMutableDictionary*)dic;
@end
