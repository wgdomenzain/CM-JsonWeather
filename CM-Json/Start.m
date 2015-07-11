//
//  ViewController.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Start.h"
#define nUagLat 20.695306
#define nUagLng -103.418190

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    mstTemp = [[NSString alloc] init];
    mstTempMax = [[NSString alloc] init];
    mstTempMin = [[NSString alloc] init];
    mstPressure = [[NSString alloc] init];
    mstHumidity = [[NSString alloc] init];
    [self initData];
    [self initController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    NSDictionary *jsonResponse = [Declarations getWeather:nUagLat and:nUagLng];
    [Parser parseWeather:jsonResponse];
    print(NSLog(@"mstTemp = %@", mstTemp))
    print(NSLog(@"mstTempMax = %@", mstTempMax))
    print(NSLog(@"mstTempMin = %@", mstTempMin))
    print(NSLog(@"mstPressure = %@", mstPressure))
    print(NSLog(@"mstHumidity = %@", mstHumidity))
}

- (void)initController {
}

- (IBAction)btnRefrsehPressed:(id)sender {
    self.lblTemp.text       = mstTemp;
    self.lblMax.text        = mstTempMax;
    self.lblMin.text        = mstTempMin;
    self.lblPressure.text   = mstPressure;
    self.lblHumidity.text   = mstHumidity;
}
@end
