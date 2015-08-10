//
//  MonopolyLacationViewController.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "MonopolyLacationViewController.h"

@interface MonopolyLacationViewController ()
{
    BMKPointAnnotation* pointAnnotation;
}
@end

@implementation MonopolyLacationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商家地点";
    // Do any additional setup after loading the view from its nib.
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    
    [self addPointAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加标注
- (void)addPointAnnotation
{
    if (pointAnnotation == nil) {
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 39.915;
        coor.longitude = 116.404;
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"多伦多宠物店";
        pointAnnotation.subtitle = @"多伦多路888号";
    }
    [_mapView addAnnotation:pointAnnotation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
