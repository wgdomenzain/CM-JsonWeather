//
//  Declarations.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Declarations.h"

#define nURLWeather     @"http://api.openweathermap.org/data/2.5/weather?"

NSString *mstTemp;
NSString *mstHumidity;
NSString *mstPressure;
NSString *mstTempMin;
NSString *mstTempMax;

@implementation Declarations

/**********************************************************************************************/
#pragma mark - Particular methods
/**********************************************************************************************/
+ (NSDictionary *)getWeather:(float)lat and:(float)lng {
    print(NSLog(@"getWeather"))
    NSMutableDictionary *diData = [[NSMutableDictionary alloc]init];
    //add post to dictionary
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stLat             = [NSString stringWithFormat:@"%f",lat];
    NSString *stLng             = [NSString stringWithFormat:@"%f",lng];
    NSString *stNewURL          = [nURLWeather stringByAppendingString:@"lat="];
    stNewURL                    = [stNewURL stringByAppendingString:stLat];
    stNewURL                    = [stNewURL stringByAppendingString:@"&lon="];
    stNewURL                    = [stNewURL stringByAppendingString:stLng];
    
    return [self sendRequest:stNewURL forData:stData andMode:nGET];
}
/**********************************************************************************************/
#pragma mark - json common method
/**********************************************************************************************/
+ (NSDictionary *) sendRequest:(NSString *) postUrl forData:(NSString *) data andMode:(BOOL)mode {
    @try {
        NSString *post;
        if (mode) {
            post = [[NSString alloc] initWithFormat:@"data=%@", data];
        }
        else {
            post = [[NSString alloc] initWithFormat:@""];
        }
        print(NSLog(@"post parameters: %@",post))
        post = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURL *url = [NSURL URLWithString:postUrl];
        print(NSLog(@"URL post = %@", url))
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        if (mode) {
            [request setHTTPMethod:@"POST"];
        }
        else {
            [request setHTTPMethod:@"GET"];
        }
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"iOS QC 1.0" forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //Check response
        if ([response statusCode] >=200 && [response statusCode] <300) {
            //get json response
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
            print(NSLog(@"response received %@",jsonResponse))
            
            //return response
            return jsonResponse;
        }
        else { if (error) {print(NSLog(@"Error response")) return nil; } else {print(NSLog(@"Conect Fail"))return nil;}
            return nil;
        }
    }
    @catch (NSException * e) {print(NSLog(@"Exception")) return nil;}
}
@end
