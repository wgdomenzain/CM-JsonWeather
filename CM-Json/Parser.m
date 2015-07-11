//
//  Parser.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+ (void)parseWeather:(NSDictionary*)json {
    //check for valid value
    if(json != nil){
        NSDictionary    *main = [json valueForKey: @"main"];
        int temp = (int)[main valueForKey: @"temp"];
        
        mstTemp     = [main valueForKey: @"temp"];
        mstHumidity = [main valueForKey: @"humidity"];
        mstPressure = [main valueForKey: @"pressure"];
        mstTempMax  = [main valueForKey: @"temp_max"];
        mstTempMin  = [main valueForKey: @"temp_min"];
    }
}

@end
