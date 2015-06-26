//
//  PetHospitalViewController.m
//  PetShop
//
//  Created by zx_06 on 15/6/26.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetHospitalViewController.h"
#import "PetHospitalCell.h"
#import <Foundation/NSObject.h>

@interface PetHospitalViewController ()
{
    UIWebView *petPhoneWebView;
    
}
@end

@implementation PetHospitalViewController
@synthesize PHospitalTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物医院";
    //tableView
    PHospitalTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 30, kWidth, kHeight-32)];
    PHospitalTableView.dataSource = self;
    PHospitalTableView.delegate   = self;
    PHospitalTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.PHospitalTableView];
    
    //搜索
    UIView *search = [[UIView alloc] initWithFrame:CGRectMake(0, topBarheight, kWidth, 60)];
    search.backgroundColor = [self colorWithHexString:@"EEEEEF"];
    [self.view addSubview:search];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] <6) {
        return [UIColor clearColor];
     }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] !=6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location =0;
    range.length =2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location =2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location =4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f) green:((float) g /255.0f) blue:((float) b /255.0f) alpha:1.0f];

}
#pragma mark - TQTableViewDataSource
#pragma mark -- 一级cell的个数
- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)tableView
{
    return 10;
}
#pragma mark -- 二级cell的个数
- (NSInteger)mTableView:(TQMultistageTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
#pragma mark - 第二级cell
- (UITableViewCell *)mTableView:(TQMultistageTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }else{
        if ([cell.contentView.subviews lastObject]!=nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    UILabel *rowLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, kWidth-100, 30)];
    rowLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    switch (indexPath.row) {
        case 0:
            rowLabel.text = @"个人简历";
            break;
        case 1:
            rowLabel.text = @"成功案例";
            break;
        case 2:
            rowLabel.text = @"医治对象";
            break;
            
        default:
            break;
    }
    [cell.contentView addSubview:rowLabel];
    
    cell.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    
    return cell;
}

#pragma mark - 第三极cell
- (UIView *)mTableView:(TQMultistageTableView *)tableView openCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.editable = NO;
    
    switch (indexPath.row) {
        case 0:
        {
            view.frame = CGRectMake(0, 0, kWidth, firstCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, firstCellHeight-16);
            textView.text = @"还记得电影007中的那种便携式喷气背包吗？喷气背包中国首飞即将来临，能让你像007一样遨游天际。7月11日，百度新闻与极客公园联合主办的“The BIG Talk·新飞行时代”峰会，见证喷气背包中国首飞！除了喷气背包中国首飞，还有无人机等全球最前沿的飞行科技，让飞行不再是梦想。";
            
        }
            break;
        case 1:
        {
            view.frame = CGRectMake(0, 0, kWidth, secondCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, secondCellHeight-16);
            textView.text = @"还记得电影007中的那种便携式喷气背包吗？\n喷气背包中国首飞即将来临，能让你像007一样遨游天际。\n7月11日，百度新闻与极客公园联合主办的“The BIG Talk·新飞行时代”峰会，见证喷气背包中国首飞！\n除了喷气背包中国首飞，还有无人机等全球最前沿的飞行科技，让飞行不再是梦想。";
        }
            break;
        case 2:
        {
            view.frame = CGRectMake(0, 0, kWidth, thirdCellHeight);
            textView.frame = CGRectMake(30, 8, kWidth-60, thirdCellHeight-16);
            textView.text = @"主治大型犬：像金毛等";
        }
            break;
            
        default:
            break;
    }
    
    [view addSubview:textView];
    return view;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)mTableView:(TQMultistageTableView *)tableView heightForOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return firstCellHeight;
            break;
        case 1:
            return secondCellHeight;
            break;
        case 2:
            return thirdCellHeight;
            break;
            
        default:
            break;
    }
    return thirdCellHeight;
}
#pragma mark - 第一级cell
- (UIView *)mTableView:(TQMultistageTableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PetHospitalCell *petH = [[PetHospitalCell alloc] initWithFrame:CGRectMake(0, 0, kWidth, 100) andDictionary:nil];
    petH.delegate =self;
    
    //上分割线
    UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.3)];
    lineViewTop.backgroundColor = [UIColor lightGrayColor];
    
    //下分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 99.5, tableView.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    [petH addSubview:lineViewTop];
    [petH addSubview:lineView];
    return petH;
    
}
//header点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClick%d",section);
}

//celll点击
- (void)mTableView:(TQMultistageTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellClick%@",indexPath);
}

//header展开
- (void)mTableView:(TQMultistageTableView *)tableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerOpen%d",section);
}

//header关闭
- (void)mTableView:(TQMultistageTableView *)tableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"headerClose%d",section);
}

- (void)mTableView:(TQMultistageTableView *)tableView willOpenCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"OpenCell%@",indexPath);
}

- (void)mTableView:(TQMultistageTableView *)tableView willCloseCellAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"CloseCell%@",indexPath);
}

/////////////////////////////////////PetHospitalCellDelegate//////////////////////////
- (void)CallPetHospitalPhoneNumber:(NSString *)phoneNumber{
    if (petPhoneWebView==nil) {
        petPhoneWebView = [[UIWebView alloc] init];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]];
    [petPhoneWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
@end
