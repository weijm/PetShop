//
//  PetSearchBar.h
//  PetShop
//
//  Created by zx_06 on 15/6/27.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PetSearchBarDelegate <NSObject>

- (void)reloadTableViewBySearchResult:(NSArray *)searchResultArray;

@end
@interface PetSearchBar : UIView<UITextFieldDelegate>

@property (nonatomic)id<PetSearchBarDelegate>delegate;

@property (retain,nonatomic) NSArray *dataArray;//所有数据数组
@property (retain,nonatomic) NSMutableArray *showArray;//搜索结果数组
@property (weak, nonatomic) IBOutlet UIButton *SearchBtn;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;


- (IBAction)searchAction:(id)sender;
- (void) searchDataByArray:(NSArray*)originalArray;//获取所有数据的数组，方便后期搜索时比较

@end
