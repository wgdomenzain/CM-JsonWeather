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
        mstTemp     = [[main valueForKey: @"temp"] stringValue];
        mstHumidity = [[main valueForKey: @"humidity"]stringValue];
        mstPressure = [[main valueForKey: @"pressure"]stringValue];
        mstTempMax  = [[main valueForKey: @"temp_max"]stringValue];
        mstTempMin  = [[main valueForKey: @"temp_min"]stringValue];
    }
}

@end
