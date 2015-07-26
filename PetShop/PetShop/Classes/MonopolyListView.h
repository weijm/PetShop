//
//  MonopolyListView.h
//  PetShop
//
//  Created by lyk on 15/7/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonopolyListView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *listTableView;
    
    NSMutableArray *listArray;
    
    int cateType;
}
@property (nonatomic,copy) void(^selectedRow)(int index,NSString *string);
-(void)initData:(int)type;
/**
 显示视图
 */
-(void)showView:(UIView *)view;
/**
 取消视图
 */
-(void)cancelView;
@end
