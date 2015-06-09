//
//  WeatherAPIHelper.m
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "WeatherAPIHelper.h"

@implementation WeatherAPIHelper

- (void)currentDayForecastWithCompletionBlock:(void (^)(NSData *resultData))completionBlock{

    NSString * weatherURL = @"http://api.openweathermap.org/data/2.5/find?q=Barcelona,es&units=metric";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL: [NSURL URLWithString:weatherURL] completionHandler:^(NSData *serverData, NSURLResponse *response, NSError * error) {
        
        NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *) response;
        if (HTTPResponse.statusCode == 200) {
        
        
            if (!error) {
        
                completionBlock(serverData);
        
            } else {
                NSAssert(NO, @"Error retrieving data");
            }
        
        } else {
            NSAssert(NO, @"Server dta error");
        }
        
        
    }]  resume];
    
}


- (void)currentWeekForecastWithCompletionBlock:(void (^)(NSData *resultData))completionBlock{
    
    NSString * weatherURL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=Barcelona,es&cnt=10&mode=json";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL: [NSURL URLWithString:weatherURL] completionHandler:^(NSData *serverData, NSURLResponse *response, NSError * error) {
        
        NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *) response;
        if (HTTPResponse.statusCode == 200) {
            
            
            if (!error) {
                
                completionBlock(serverData);
                
            } else {
                NSAssert(NO, @"Error retrieving data");
            }
            
        } else {
            NSAssert(NO, @"Server dta error");
        }
        
        
    }]  resume];
    
}




@end
