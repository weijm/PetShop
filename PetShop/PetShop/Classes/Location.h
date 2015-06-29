//
//  Location.h
//  PetShop
//
//  Created by wjm on 15/6/29.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *district;
@property (strong, nonatomic) NSString *street;
@end
