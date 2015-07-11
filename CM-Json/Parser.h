//
//  Parser.h
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Declarations.h"

@interface Parser : NSObject
+ (void)parseWeather:(NSDictionary*)json;
@end
