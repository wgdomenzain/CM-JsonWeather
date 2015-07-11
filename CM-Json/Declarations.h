//
//  Declarations.h
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

//Debug
#define nDebugEnable        1
#define print(x)            if(nDebugEnable){(x);}

//Json modes
#define nGET                0
#define nPOST               1

extern NSString *mstTemp;
extern NSString *mstHumidity;
extern NSString *mstPressure;
extern NSString *mstTempMin;
extern NSString *mstTempMax;

@interface Declarations : NSObject
+ (NSDictionary *)getWeather:(float)lat and:(float)lng;
@end
